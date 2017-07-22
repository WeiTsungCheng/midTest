//
//  ViewController.swift
//  midTest
//
//  Created by Wei-Tsung Cheng on 2017/7/21.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,

UINavigationControllerDelegate, UIScrollViewDelegate {


    @IBOutlet weak var photo: UIImageView!

    @IBOutlet weak var upView: UIView!

    @IBOutlet weak var downView: UIView!

    @IBOutlet weak var toGetPicture: UIButton!

    @IBOutlet weak var showImage: UIScrollView!

   //拍照
    @IBAction func useCammera(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            //UIImagePickerController指派給自己(ViewController)
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)

        }
    }


    //選照片
    @IBAction func toGetPicture(_ sender: Any)
    {

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {


            let imagePicker = UIImagePickerController()
            //UIImagePickerController指派給自己(ViewController)
            imagePicker.delegate = self

                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary

                imagePicker.allowsEditing = true

                self.present(imagePicker, animated: true, completion: nil)
               // photo.contentMode = .scaleAspectFit

            }

    }

    //存檔
    @IBAction func savePhoto(_ sender: Any) {

        let imageData = UIImageJPEGRepresentation(photo.image!, 1)

        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)


        let alert = UIAlertController(title: "Wow", message: "Your image has been saved to Photo Library!", preferredStyle: UIAlertControllerStyle.alert)

        let callaction = UIAlertAction(title: "OK", style: .default , handler:nil)

        alert.addAction(callaction)

        self.present(alert, animated: true, completion: nil)
    }

    //放照片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photo.image = image
        } else {
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)

        //不要把placehold預設圖像放的填滿控制放在viewDidLoad()下，否則剛進入頁面時會造成預設圖像模糊，而是放在拿完圖後（拍照,或相簿拿圖）,存入imageView時再改成scaleAspectFit，讓圖片撐開外面的scrollView
        photo.contentMode = UIViewContentMode.scaleAspectFit

    }


    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        showImage.delegate = self
        showImage.minimumZoomScale = 1.0
        showImage.maximumZoomScale = 10.0

        photo.tintColor = UIColor.white
        upView.backgroundColor = UIColor.asiBlack
        downView.backgroundColor = UIColor.asiDandelion

        toGetPicture.backgroundColor = UIColor.asiBlack
        toGetPicture.layer.shadowColor = UIColor.asiBlack26.cgColor
        toGetPicture.layer.shadowOpacity = 1
        toGetPicture.layer.shadowOffset = CGSize(width: 0, height: 2)
        toGetPicture.layer.shadowRadius = 2

        toGetPicture.titleLabel?.font = UIFont.asiTextStyle23Font()
        toGetPicture.setTitle("Pick an Image", for: UIControlState.normal)
        toGetPicture.setTitleColor(UIColor.white, for: UIControlState.normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

