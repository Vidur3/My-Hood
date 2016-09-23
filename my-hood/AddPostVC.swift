//
//  AddPostVC.swift
//  my-hood
//
//  Created by Vidur Singh on 19/08/16.
//  Copyright © 2016 Vidur Singh. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    var imgPicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        postImg.layer.cornerRadius = postImg.frame.width / 2
        postImg.clipsToBounds = true
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        
        if let title = titleField.text, let desc = descField.text, let image = postImg.image {
            
            let imgPath = DataService.instance.saveImageandCreatePath(image)
            
            var post = Post(imagePath: imgPath, title: title, postDesc: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
        
        
    }
    
    
    
}
