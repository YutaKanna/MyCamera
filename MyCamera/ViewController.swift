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
    
    // カメラを起動するをタップすると実行
    @IBAction func cameraButtonAction(_ sender: Any) {
//        // カメラが利用可能かチェック
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            print("カメラは利用できます")
//            // (1)UIImagePickerControllerのインスタンスを作成
//            let imagePickerController = UIImagePickerController()
//            // (2)sourceTypeにcameraを設定
//            imagePickerController.sourceType = .camera
//            // (3)delegate設置
//            imagePickerController.delegate = self
//            // (4)モーダルビューで表示
//            present(imagePickerController, animated: true, completion: nil)
//        } else {
//            print("カメラは使用できません")
//        }
//
//        // カメラかフォトライブラリーどちらから画像を取得するか選択
//        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
//
//        // カメラを起動するための選択肢を定義
//        let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: nil)
//        alertController.addAction(cameraAction)
//
//        // フォトライブラリーを起動するための選択肢を定義
//        let photoLibraryAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler: nil)
//        alertController.addAction(photoLibraryAction)
        
        // カメラかフォトライブラリーどちらから画像を取得するか選択
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動するための選択肢を定義
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (action:UIAlertAction) in
                // カメラを起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // フォトライブラリーが利用可能かをチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // フォトライブラリーを起動するための選択肢を定義
            let photoLibraryAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler: { (action:UIAlertAction) in
                // フォトライブラリーを起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        // キャンセルの選択肢を定義
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // iPadで落ちてしまう対策
        alertController.popoverPresentationController?.sourceView = view
        
        // 選択肢を画面に表示
        present(alertController, animated: true, completion: nil)
    }
    
    
    // SNSに投稿するをタップすると実行
    @IBAction func SNSButtonAction(_ sender: Any) {
        // 表示画像をアンラップしてシェア画像を取り出し
        if let shareImage = pictureImage.image {
            // UIActivityViewControllerに渡す配列を作成
            let shareItems = [shareImage]
            // UIActivityViewControllerにシェア画像を渡す
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            // iPadで落ちてしまう対策
            controller.popoverPresentationController?.sourceView = view
            // UIActivityViewControllerを表示
            present(controller, animated: true, completion: nil)
        }
    }
    
    // (1)撮影が終わったときに呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // (2)撮影した写真を、配置したpictureImageに渡す
        captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        // (3)モーダルビューを閉じる
        dismiss(animated: true, completion: {
            // (4)エフェクト画面に遷移
            self.performSegue(withIdentifier: "showEffetView", sender: nil)
        })
    }
    
    // 次の画面遷移するときに渡す画像を格納する場所
    var captureImage : UIImage?
}

