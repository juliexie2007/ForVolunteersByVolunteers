//
//  HomeViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/9/21.
//

import UIKit
import CoreData

var numCell = 0

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var oppsTableView: UITableView!

    // Reference to managed object contect
//    let user_context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var users:[Users]?

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opps?.count ?? 0
    }
    
    // Prepare the table cell for display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_opp", for: indexPath)
        
        // Get opportunities from CoreData to show
        let opp = opps?[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.attributedText = makeAttributedString(title: (opp?.opp_title)!, subtitle: (opp?.org_name)!, details: (opp?.opp_description)!, bFavorite: opp!.favorated)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Selected Opp
        opp_interested = opps![indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "OppDetailsViewController")
            as? OppDetailsViewController {
            viewcontroller.textOppTitle = opp_interested.opp_title ?? ""
            viewcontroller.textOppDetails = opp_interested.opp_description ?? ""
            viewcontroller.bFavorite = opp_interested.favorated
            viewcontroller.textOrgName = opp_interested.org_name ?? ""
            viewcontroller.bVirtual = opp_interested.opp_virtual
            viewcontroller.textTimeZone = opp_interested.opp_time_zone ?? ""
            viewcontroller.textState = opp_interested.opp_state ?? ""
            viewcontroller.textZipCode = opp_interested.opp_zip_code ?? ""
            
            bFavoriteOriginal = opp_interested.favorated
            bFavoriteChanged = false
            numCell = indexPath.row

            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }

        
/*
         // This is a sample to show how to create a pop up window
        // Create alert
        let alert = UIAlertController(title: "Edit Opportunity", message: "Title:", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = opp.opp_title
        
        // Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            //Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            // Edit title of the opp
            opp.opp_title = textfield.text
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            // refetch the data
            self.fetchOpps()
        }
        
        // Add button
        alert.addAction(saveButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
 */
    }

    // Reference to managed object contect
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    var items:[Favorites]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide back button on home page
        navigationItem.hidesBackButton = true

        oppsTableView.delegate = self
        oppsTableView.dataSource = self
        
   }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeLogOut" {
            users![0].loggedIn = false
            SaveUserSettings ()
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        // For the case that come back here from the Opp Details page
        if bFavoriteChanged {
            let opp = opps![numCell]
            opp.favorated = !bFavoriteOriginal
            // Save the data
/*
            do {
                try context.save()
                bFavoriteChanged = false
                numCell = 0
                //refetch data
 
            }
            catch {
                bFavoriteChanged = false
                numCell = 0
            }
 */
            SaveUserSettings()
        }
        // refetch data
        fetchOpps()
        fetchUser()
        self.oppsTableView.reloadData()
        
        helloLabel.text = "Hello, " + users![0].first_name! + "!"

    }
    
    
    @IBAction func FindButtonClicked(_ sender: Any) {
    
        // Add search function here
        
        // Create alert
        let alert = UIAlertController(title: "Add Opps", message: "Title of the opp", preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Title"
            }
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Description"
            }
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Org Name"
            }
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "TimeZone"
            }
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "State"
            }
        alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Zip Code"
            }
        // Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            let textDetails = alert.textFields![1]
            let textOrgName = alert.textFields![2]
            let textTimeZone = alert.textFields![3]
            let textState = alert.textFields![4]
            let textZipCode = alert.textFields![5]
            
            // Create a new Favorite object
            
            let newFavorite = CreateANewOpp()
            newFavorite.opp_title = textfield.text
            newFavorite.opp_description = textDetails.text
            newFavorite.org_name = textOrgName.text
            newFavorite.opp_time_zone = textTimeZone.text
            newFavorite.opp_state = textState.text
            newFavorite.opp_zip_code = textZipCode.text
            
            SaveUserSettings()
                        
            // Re-fetch the data
            fetchOpps()
            self.oppsTableView.reloadData()
        }
        
        // Add button
        alert.addAction(submitButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
            
            RemoveAnOpp(index: indexPath.row)
/*
            // Remove the Opp
            let oppToRemove = opps![indexPath.row]
            
            // Remove the Opp
            context.delete(oppToRemove)

            // Save the data
            do {
                try context.save()
            }
            catch {
            }
 */
            // re-fetch the data
            fetchOpps()
            DispatchQueue.main.async {
                self.oppsTableView.reloadData()
            }
            
        }
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    func makeAttributedString(title: String, subtitle: String, details: String, bFavorite: Bool) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline), NSAttributedString.Key.foregroundColor: UIColor.blue]
        let detailAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
/*
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
*/
        let titleString = NSMutableAttributedString(string: title, attributes: titleAttributes)
        if bFavorite {
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = UIImage(systemName: "heart.fill")?.withTintColor(.red)
            image1Attachment.bounds = CGRect(x: 0, y: -4, width: 18, height: 15)
            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: image1Attachment)
            titleString.append(image1String)
        }
        let subtitleString = NSAttributedString(string: "\n\(subtitle)", attributes: subtitleAttributes)
        let detailString = NSAttributedString(string: "\n\(details)", attributes: detailAttributes)

        titleString.append(subtitleString)
        titleString.append(detailString)

        return titleString
    }
}

