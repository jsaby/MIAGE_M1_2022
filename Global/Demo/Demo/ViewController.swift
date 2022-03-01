//
//  ViewController.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

extension String {
	var busId: String {
		get {
			var busString = self
			if self.starts(with: "SNC") {
				if let index = busString.lastIndex(of: ":") {
					busString = String(busString.prefix(upTo: index))
				}
			}
			
			if let index = busString.lastIndex(of: ":") {
				let firstPart = busString.prefix(upTo: index)
				return String(firstPart)
			}
			return ""
		}
	}
}

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		descriptionLabel.text = "Le ViewController initial"
		
		textField.delegate = self
		textField.isUserInteractionEnabled = false
		
		// JSON file
//		var recipes = [Recipe]()
//
//		let tartiflette = Recipe()
//		tartiflette.name = "Tartiflette"
//		tartiflette.photo = "tartiflette"
//
//		let raclette = Recipe()
//		raclette.name = "Raclette"
//		raclette.photo = "raclette"
//
//		recipes.append(contentsOf: [tartiflette, raclette])
//
//		writeJSON(recipes: recipes)
//
//		var recipesAfter = loadJson()
//
//		let fondue = Recipe()
//		fondue.name = "Fondue"
//		fondue.photo = "fondue"
//
//		recipesAfter?.append(fondue)
//
//		writeJSON(recipes: recipesAfter!)
//
//		var recipesEnd = loadJson()
//		print(recipesEnd)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		textField.isUserInteractionEnabled = false
		return false
	}

	@IBAction func openTextField() {
		textField.isUserInteractionEnabled = true
		textField.becomeFirstResponder()
		
	}
	
	@IBAction func showTableViewAction() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let customTableViewController = storyboard.instantiateViewController(withIdentifier: "customTableViewController") as! CustomTableViewController
		self.navigationController?.pushViewController(customTableViewController, animated: true)
	}
	
	func loadJson() -> [Recipe]? {
		do {
			let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
			let fileURL = directory.appendingPathComponent("test.json")
			
			let data = try Data(contentsOf: fileURL)
			
			let decoder = JSONDecoder()
			let jsonData = try decoder.decode([Recipe].self, from: data)
			
			return jsonData
			
		} catch {
			print("error:\(error)")
		}
		return nil
	}
	
	func writeJSON(recipes: [Recipe]) {
		do {
			let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
			let fileURL = directory.appendingPathComponent("test.json")
			
			let encoder = JSONEncoder()
			try encoder.encode(recipes).write(to: fileURL)
		} catch {
			print(error.localizedDescription)
		}
	}
}

class Recipe: NSObject, Decodable, Encodable {
	var name: String!
	var photo: String!
}
