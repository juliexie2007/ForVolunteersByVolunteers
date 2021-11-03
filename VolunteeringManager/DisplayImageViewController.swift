//
//  DisplayImageViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/20/21.
//

import UIKit

class DisplayImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController.numberOfPages = imagesArrayGlobal.count
        SetupScreens()
        scollView.delegate = self

    }

    func SetupScreens () {
        for index in 0..<imagesArrayGlobal.count {
            
            let frame = CGRect(origin: scollView.frame.origin, size: scollView.frame.size)
            let imgView = UIImageView(frame: frame)
            imgView.image =  imagesArrayGlobal[index]
             self.scollView.addSubview(imgView)
         }

        scollView.contentSize = CGSize(width: (scollView.frame.size.width * CGFloat(imagesArrayGlobal.count)), height: scollView.frame.size.height)
        scollView.delegate = self
    }
}
