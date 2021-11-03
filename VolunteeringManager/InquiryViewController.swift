//
//  InquiryViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/19/21.
//

import UIKit
import CoreData

class InquiryViewController: UIViewController {
    
    @IBOutlet weak var labelReasonOfInterest: UILabel!
    @IBOutlet weak var textFieldReasonOfInterest: UITextView!
    @IBOutlet weak var labelRelevantExperience: UILabel!
    @IBOutlet weak var textFieldRelevantExperience: UITextView!
    
    // bInquiry = 0 (inquiry)
    // bInquiry = 1 (epxress interest)
    // bInquiry = 2 (log activity)
    //
    var bInquiry = 0
    

    override func viewDidLoad() {
        switch bInquiry {
        case 0:
            labelReasonOfInterest.text = "Type in your question:"
            labelRelevantExperience.isHidden = true
            textFieldRelevantExperience.isHidden = true
        case 2:
            labelReasonOfInterest.text = "Activity log:"
            labelRelevantExperience.isHidden = true
            textFieldRelevantExperience.isHidden = true
        default: break
        }
        super.viewDidLoad()
    }
    
    @IBAction func SendBtnClicked(_ sender: Any) {

        var log = String()
        switch bInquiry {
        case 0:
            log = "Send an inquiry to the organization."
        case 1:
            log = "Expressed interest."
        case 2:
            log = textFieldReasonOfInterest.text
        default: break
        }
        SaveLog(log: log)
    }
}
