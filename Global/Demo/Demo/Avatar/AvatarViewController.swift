//
//  AvatarViewController.swift
//  Demo
//
//  Created by Julie Saby on 11/03/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var avatarTextField: EmojiTextField!
//	@IBOutlet weak var selectAvatarButton: UIButton!
	@IBOutlet weak var selectedAvatarLabel: UILabel!
	@IBOutlet weak var selectedAvatarMiniatureLabel: UILabel!
	
	var selectedAvatar: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		avatarTextField.delegate = self
    }
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		print(string)
		self.selectedAvatar = string
		
		selectedAvatarLabel.text = string
		selectedAvatarMiniatureLabel.text = string
		
		avatarTextField.resignFirstResponder()
		return true
	}

}

class EmojiTextField: UITextField {

   // required for iOS 13
   override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

	override var textInputMode: UITextInputMode? {
		for mode in UITextInputMode.activeInputModes {
			if mode.primaryLanguage == "emoji" {
				return mode
			}
		}
		return nil
	}
}
