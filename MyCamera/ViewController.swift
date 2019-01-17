//
//  ViewController.swift
//  MyCamera
//
//  Created by 漢那優太 on 2019/01/17.
//  Copyright © 2019 Yuta Kanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func SNSButtonAction(_ sender: Any) {
    }
}

