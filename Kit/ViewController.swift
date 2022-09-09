//
//  ViewController.swift
//  Kit
//
//  Created by  DNS on 03.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()
    
    var menyArray = ["one", "two", "three"]
    let imageArray = [UIImage(named: "boot1"),
                      UIImage(named: "boot2"),
                      UIImage(named: "boot3")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[2]
        self.view.addSubview(self.imageView)
        
        //create segment
        self.segmentControll = UISegmentedControl(items: self.menyArray)
        self.segmentControll.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
        self.view.addSubview(self.segmentControll)
        
    }


}

