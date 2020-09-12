//
//  ViewControllerTypeDonate.swift
//  VkHackathon1
//
//  Created by Pavel on 11.09.2020.
//  Copyright © 2020 Pavel. All rights reserved.
//

import UIKit

class ViewControllerTypeDonate: UIViewController {

	@IBOutlet weak var donateOnce: UIView!
	@IBOutlet weak var donateRepeatly: UIView!
	
	@IBAction func btnClickBack(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		donateOnce.layer.borderWidth = 0.33
		donateOnce.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
		donateRepeatly.layer.borderWidth = 0.33
		donateRepeatly.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
		
		let gestureOnce = UITapGestureRecognizer(target: self, action:  #selector(self.donateOnceClick))
		self.donateOnce.addGestureRecognizer(gestureOnce)
		let gestureRepeatly = UITapGestureRecognizer(target: self, action:  #selector(self.donateRepeatlyClick))
		self.donateRepeatly.addGestureRecognizer(gestureRepeatly)
		
        // Do any additional setup after loading the view.
    }
	
	@objc func donateOnceClick(sender : UITapGestureRecognizer) {
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let onceViewController = storyBoard.instantiateViewController(withIdentifier: "donateOnceID") as! ViewControllerOnceDonate
		self.present(onceViewController, animated: true, completion: nil)
	}
	
	@objc func donateRepeatlyClick(sender : UITapGestureRecognizer) {
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let repeatlyViewController = storyBoard.instantiateViewController(withIdentifier: "donateRepeatlyID") as! ViewControllerRepeatlyDonate
		self.present(repeatlyViewController, animated: true, completion: nil)
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
