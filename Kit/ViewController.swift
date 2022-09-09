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
    let imageArray = [UIImage(named: "boot1.jpg"),
                      UIImage(named: "boot2.jpg"),
                      UIImage(named: "boot3.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 400)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        //create segment
        self.segmentControll = UISegmentedControl(items: self.menyArray)
        self.segmentControll.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
        self.view.addSubview(self.segmentControll)
        
        self.segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmemtIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageArray[segmemtIndex]
        }
            
    }


}

