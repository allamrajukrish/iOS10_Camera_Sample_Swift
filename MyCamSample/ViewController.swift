//
//  ViewController.swift
//  MyCamSample
//
//  Created by Stellent_Krish on 6/2/17.
//  Copyright © 2017 My Business App Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var myImageView:UIImageView! // Reference/declaration of imageview
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Button action to access the Camera and capture the image
   @IBAction func cameraAction(_ sender: AnyObject) {
        if UIImagePickerController
            .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate=self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            self .present(imagePicker, animated: true, completion: nil)
        }
        
    }
    //Image PickerControl Delegate Method
    func imagePickerController(_ picker: UIImagePickerController,    didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView?.image = image //This is where we are assigning the selected or captured image to the imageview.
            myImageView?.contentMode = .scaleAspectFit
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    //Button action to access the images from photo Library
    @IBAction func photosFromLibrary(_ sender: AnyObject) {
        if UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate=self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self .present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

