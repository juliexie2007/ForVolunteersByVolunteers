//
//  OppDetailsViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/14/21.
//

import UIKit

class OppDetailsViewController: UIViewController {
    
    @IBOutlet weak var labelOppTitle: UILabel!
    @IBOutlet weak var labelOrgName: UILabel!
    
    @IBOutlet weak var labelOppDetails: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var labelVirtual: UILabel!
    @IBOutlet weak var labelTimeZone: UILabel!
    @IBOutlet weak var labelState: UILabel!
    @IBOutlet weak var labelZipCode: UILabel!
    
    var textOppTitle = ""
    var textOppDetails = ""
    var textOrgName = ""
    var bFavorite = false
    var bVirtual = false
    var textTimeZone = ""
    var textState = ""
    var textZipCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        
        labelOppTitle.text = textOppTitle
        labelOppDetails.text = textOppDetails
        labelOrgName.text = textOrgName
        if bVirtual {
            labelVirtual.attributedText = makeAttributedString(title: labelVirtual.text!, subtitle: "Yes")
        } else {
            labelVirtual.attributedText = makeAttributedString(title: labelVirtual.text!, subtitle: "No")
        }
        labelTimeZone.attributedText = makeAttributedString(title: labelTimeZone.text!, subtitle: textTimeZone)
        labelState.attributedText = makeAttributedString(title: labelState.text!, subtitle: textState)
            
        labelZipCode.attributedText = makeAttributedString(title: labelZipCode.text!, subtitle: textZipCode)
        
        
        if bFavorite {
            if let image = UIImage(systemName: "heart.fill") {
                btnFavorite.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "heart") {
                btnFavorite.setImage(image, for: .normal)
            }
        }
    }
    
    // Track if the favorite is changed for this opp
    @IBAction func BtnFavoriteClicked(_ sender: Any) {
        bFavorite.toggle()
        bFavoriteChanged = (bFavoriteOriginal != bFavorite)
        if bFavorite {
            if let image = UIImage(systemName: "heart.fill") {
                btnFavorite.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "heart") {
                btnFavorite.setImage(image, for: .normal)
            }
        }
    }
    @IBAction func BtnInquiryClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "InquiryViewController")
            as? InquiryViewController {
            
            viewcontroller.bInquiry = 0
            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
    }
    
    @IBAction func BtnApplyClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "InquiryViewController")
            as? InquiryViewController {
            
            viewcontroller.bInquiry = 1
            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
    }
   
    @IBAction func BtnLogActivityClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(identifier: "InquiryViewController")
            as? InquiryViewController {
            
            viewcontroller.bInquiry = 2
            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
    }
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]

        let titleString = NSMutableAttributedString(string: "\(title)", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)

        titleString.append(subtitleString)

        return titleString
    }
    
}



