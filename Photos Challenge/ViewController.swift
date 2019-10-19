//
//  ViewController.swift
//  Photos Challenge
//
//  Created by Carmel Braga on 10/18/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takePhoto(_ sender: Any) {
    let imagePickerController = UIImagePickerController()

           imagePickerController.delegate = self

                 let actionList = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)

                 actionList.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {(action: UIAlertAction) in imagePickerController.sourceType = .camera

                     if UIImagePickerController.isSourceTypeAvailable(.camera){

                         imagePickerController.sourceType = .camera

                         self.present(imagePickerController, animated: true, completion: nil)

                     } else{

                         print("Camera not available.")

                     }

                 }))

                 actionList.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))

                 self.present(actionList, animated: true, completion: nil)
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()

                      imagePickerController.delegate = self

                      

                      let actionList = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)

                      

                      actionList.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {(action: UIAlertAction) in imagePickerController.sourceType = .photoLibrary

                          

                          self.present(imagePickerController, animated: true, completion: nil)

                      }))

                      actionList.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))

                      

                      self.present(actionList, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

                  imageView.image = image

                  picker.dismiss(animated: true, completion: nil)
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
}

