//
//  MomentsTableViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/17/21.
//

import UIKit
import CoreData


class MomentsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        self.navigationItem.setHidesBackButton(true, animated: true)

    }

/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moment_list.count
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchUser()
        fetchMoments()
        self.tabBarController?.tabBar.isHidden = false
        self.reloadInputViews()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MomentsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_moment", for: indexPath) as! MomentsTableViewCell

        // Set user icon image
        if users!.count >= 1 {
            if users![0].image_blob != nil {
                cell.authorImage.image = UIImage(data: users![0].image_blob! as Data)
            }
        }
        //Set author name
        cell.authorNameLabel.text = moment_list[indexPath.row].author
        
        // Set moment images
        cell.imagesArray.removeAll()
        let moment_images = moment_list[indexPath.row].moment_images // this is [MomentImages]
        for data_image in moment_images! {
            let image = UIImage(data: (data_image as AnyObject).picture!!)
            cell.imagesArray.append(image!)
        }
        
        // Set moment date
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .long
        let textDate = dateFormatter.string(from: moment_list[indexPath.row].dateTime!)

        
        // Set moment content
        cell.momentContentLabel.attributedText = makeAttributedString(subtitle: textDate, details: moment_list[indexPath.row].post!)
        
        // fix the collection view height issue
        
        cell.frame = tableView.bounds
        [cell .layoutIfNeeded()]
        [cell.momentImageCollectionView .reloadData()]
        
        var height = 0
        var width = 202
        
        let num = cell.imagesArray.count
        switch num {
        case 0:
            height = 0
            width = 202
        case 1:
            height = 101
            width = 101
        case 2:
            height = 101
            width = 202
        case 3:
            height = 101
            width = 303
        case 4:
            height = 202
            width = 202
        case 5, 6:
            height = 202
            width = 303
        default:
            height = 303
            width = 303
        }
        cell.momentImageCollectionViewHeight.constant = CGFloat(height)
        cell.momentImageCollectionViewWidth.constant = CGFloat(width)

        return cell
    }
    
/*
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
            // Which Post to remove
            let postToRemove = moment_list[indexPath.row]
            
            // Remove the Opp
            self.context.delete(postToRemove)
        
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            
            // re-fetch the data
            self.fetchMoments()
        
        }
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
 
            // Which Post to remove
            let postToRemove = moment_list[indexPath.row]
            
            // Remove the Opp
            context.delete(postToRemove)
        
            // Save the data
            do {
                try context.save()
            }
            catch {
                
            }
            moment_list.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func AddMomentBtnClicked(_ sender: Any) {

        bShowMomentDetail = false

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "MultiplePicturePostViewController")
            as? MultiplePicturePostViewController {

            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
    }

 /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MomentTableToShowImages" {
        }
    }
*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Selected Post to show
        num_moment = indexPath.row
        bShowMomentDetail = true
/*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "AddMomentViewController")
            as? AddNewMomentViewController {

            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
*/
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    func makeAttributedString(subtitle: String, details: String) -> NSAttributedString {
        
        let subtitleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10.0)]
        let detailAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10.0)]
        let subtitleString = NSMutableAttributedString(string: "\(subtitle)\n", attributes: subtitleAttributes)
        let detailsString = NSAttributedString(string: details, attributes: detailAttributes)

        subtitleString.append(detailsString)

        return subtitleString
    }
}
