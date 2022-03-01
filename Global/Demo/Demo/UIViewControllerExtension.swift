//
//  UIViewControllerExtension.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	func showAlert(title: String, message: String){
		let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}
