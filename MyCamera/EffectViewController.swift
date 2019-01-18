//
//  EffectViewController.swift
//  MyCamera
//
//  Created by 漢那優太 on 2019/01/18.
//  Copyright © 2019 Yuta Kanna. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 画面遷移時に元の画像を表示
        effectImage.image = originalImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var effectImage: UIImageView!
    
    // エフェクト前画像
    // 前の画面より画像を設定
    var originalImage : UIImage?
 
    @IBAction func effectButtonAction(_ sender: Any) {
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
    }
}
