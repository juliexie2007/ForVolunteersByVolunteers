//
//  FavoriteViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/12/21.
//

import UIKit
import CoreData

// var opp_interested = Favorites()

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favoriteTableView: UITableView!
    
    // Reference to managed object contect
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    var items:[Favorites]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opps?.count ?? 0
    }
    
    // Prepare the table cell for display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_favorite", for: indexPath)
        
        // Get opportunities from CoreData to show
        let opp = opps?[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.attributedText = makeAttributedString(title: (opp?.opp_title)!, subtitle: (opp?.org_name)!, details: (opp?.opp_description)!)
        
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
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Remove") { (action, view, completionHandler) in
            // Which Opp to remove
            let oppToRemove = opps![indexPath.row]
            oppToRemove.favorated = false
            
            // Remove the Opp
//            self.context.delete(oppToRemove)
        
            // Save the data
            SaveUserSettings ()
            
            // re-fetch the data
            fetchFavorites()
            DispatchQueue.main.async {
                self.favoriteTableView.reloadData()
            }
        }
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        // For the case that come back here from the Opp Details page
        if bFavoriteChanged {
            let opp = opps![numCell]
            opp.favorated = !bFavoriteOriginal
            // Save the data
            SaveUserSettings ()
            bFavoriteChanged = false
            numCell = 0
            //refetch data
            fetchFavorites()
        }
        fetchFavorites()
        DispatchQueue.main.async {
            self.favoriteTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self

        // Get Data
        fetchFavorites()
        DispatchQueue.main.async {
            self.favoriteTableView.reloadData()
        }
    }
 

    func makeAttributedString(title: String, subtitle: String, details: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline), NSAttributedString.Key.foregroundColor: UIColor.blue]
        let detailAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSMutableAttributedString(string: "\(subtitle)\n", attributes: subtitleAttributes)
        let detailsString = NSAttributedString(string: details, attributes: detailAttributes)

        titleString.append(subtitleString)
        titleString.append(detailsString)

        return titleString
    }

}
