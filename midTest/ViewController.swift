//
//  ViewController.swift
//  midTest
//
//  Created by Wei-Tsung Cheng on 2017/7/21.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var upView: UIView!

    @IBOutlet weak var downView: UIView!


   @IBOutlet weak var showImage: UIImageView!


   //拍照
    @IBAction func useCammera(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }

    

    }


    //選照片
    @IBAction func toGetPicture(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {

            let imagePicker = UIImagePickerController()

                imagePicker.delegate = self

                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary

                imagePicker.allowsEditing = true

                self.present(imagePicker, animated: true, completion: nil)

            }

    }



////放照片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            showImage.image = image
        } else {
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)


    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        upView.backgroundColor = UIColor.asiBlack

        downView.backgroundColor = UIColor.asiDandelion
        showImage.tintColor = UIColor.white
        //showImage.backgroundColor = UIColor.asiDandelion

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

