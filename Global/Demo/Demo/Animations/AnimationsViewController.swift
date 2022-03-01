//
//  AnimationsViewController.swift
//  Demo
//
//  Created by Julie Saby on 10/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {

	@IBOutlet weak var coloredView: UIView!
	@IBOutlet weak var animatedView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		animateBackgroundColor()
		
		let rotateGesture = UIRotationGestureRecognizer(target: self, action:
		#selector(AnimationsViewController.rotatedView(_:)))
		animatedView.addGestureRecognizer(rotateGesture)
    }
	
	// Passage de la couleur de fond à jaune en 5 secondes après un délais de 2 secondes puis retour au rouge en 5 secondes et on boucle
	func animateBackgroundColor() {
		coloredView.backgroundColor = UIColor.red
		
		UIView.animate(withDuration: 5.0, delay: 2.0, options: [], animations: {
			self.coloredView.backgroundColor = UIColor.yellow
		}) { (true) in
			
			UIView.animate(withDuration: 5.0, animations: {
				self.coloredView.backgroundColor = UIColor.red
			}) { (true) in
				self.animateBackgroundColor()
			}
		}
	}
	
	// Animation de vue en fonction de la rotation (à partir d'une gesture)
	@objc func rotatedView(_ sender: UIRotationGestureRecognizer) {
		var lastRotation = CGFloat()
		if sender.state == UIGestureRecognizer.State.ended {
			lastRotation = 0.0
		}
		let rotation = 0.0 - (lastRotation - sender.rotation)
		let currentTrans = sender.view?.transform
		let newTrans = currentTrans!.rotated(by: rotation)
		
		sender.view?.transform = newTrans
		lastRotation = sender.rotation
	}

}
