//
//  ImagePickerViewController.swift
//  Demo
//
//  Created by Julie Saby on 18/11/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var imageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func choosePicture() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.sourceType = .photoLibrary
		self.present(imagePicker, animated: true) {
			//
		}
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let image = info[.originalImage] as! UIImage
		
		DispatchQueue.main.async {
			self.imageView.image = image
			self.dismiss(animated: true, completion: nil)
		}
		
	}
}
