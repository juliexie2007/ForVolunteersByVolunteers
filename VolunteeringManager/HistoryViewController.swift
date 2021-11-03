//
//  HistoryViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/12/21.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var activityTableView: UITableView!
    
    // Reference to managed object contect
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return opps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = opps![section].opp_title! + " @ " + opps![section].org_name!
        return sectionTitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let items = opps![section].opp_act
        return items!.count
    }

    // Prepare the table cell for display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_activity", for: indexPath)
      
        // Get opportunities from CoreData to show
        let opp = opps?[indexPath.section]
//      let set = opp!.opp_act
//      let acts = set
//      let activity = acts![indexPath.row]
        let activity = opp!.opp_act![indexPath.row]

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let textDate = dateFormatter.string(from: ((activity as AnyObject).dateTime!))
        
        cell.textLabel?.attributedText = makeAttributedString(title: textDate, subtitle: ((activity as AnyObject).activity)!)
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityTableView.delegate = self
        activityTableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchOpps()
        DispatchQueue.main.async {
            self.activityTableView.reloadData()
        }
    }
    
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]

        let titleString = NSMutableAttributedString(string: "\(title): ", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)

        titleString.append(subtitleString)

        return titleString
    }
}
