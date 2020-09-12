//
//  ViewControllerOnceDonate.swift
//  VkHackathon1
//
//  Created by Pavel on 11.09.2020.
//  Copyright © 2020 Pavel. All rights reserved.
//

import UIKit

class ViewControllerOnceDonate: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

	@IBOutlet weak var editName: UITextField!
	@IBOutlet weak var editAmount: UITextField!
	@IBOutlet weak var editGoal: UITextField!
	@IBOutlet weak var editTextDescription: UITextView! {
		didSet {
			self.editTextDescription.layer.borderWidth = 0.33
			self.editTextDescription.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
			self.editTextDescription.layer.cornerRadius = 10
			self.editTextDescription.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
		}
	}
	@IBOutlet weak var imageCover: UIImageView!
	var imagePicker = UIImagePickerController()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		editName.addStyleToTextField()
		editAmount.addStyleToTextField()
		editGoal.addStyleToTextField()
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
		imageCover.addGestureRecognizer(tapGesture)
		
        // Do any additional setup after loading the view.
    }
    
	@IBAction func btnClickBack(_ sender: Any) {
		self.dismiss(animated: true)
	}
	
	@objc func imageTapped(gesture: UIGestureRecognizer) {
		if (gesture.view as? UIImageView) != nil {
			if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
				imagePicker.delegate = self
				imagePicker.sourceType = .photoLibrary
				imagePicker.allowsEditing = false

				present(imagePicker, animated: true, completion: nil)
			}
		}
	}
	
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageCover.image = image
			imageCover.layer.cornerRadius = 10
			imageCover.clipsToBounds = true
        }
    }
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
	func addStyleToTextField() {
		self.layer.borderWidth = 0.33
		self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
		self.layer.cornerRadius = 10
		self.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 2.0))
		self.leftViewMode = .always
	}
}
