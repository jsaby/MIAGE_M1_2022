//
//  ViewController.swift
//  EggTimer
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
	
	var pickerInfo: [String] = []
	var tempsCuisson:Int = 0
	var timer:Timer = Timer()
	var lecteur:AVAudioPlayer = AVAudioPlayer()
	var estActif:Bool = false
	var selection:Int?
	
	@IBOutlet weak var minuteurLabel: UILabel!
	@IBOutlet weak var activerMinuteurBtn: UIButton!
	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var navBar: UINavigationBar!
	
	@IBAction func activerMinuteurAction(_ sender: UIButton) {
		compteur()
	}
	
	@IBAction func resetMinuteurAction(_ sender: UIButton) {
		resetCompteur()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//datasource + delegate
		pickerView.dataSource = self
		pickerView.delegate = self
		
		pickerInfo = ["Oeufs Durs", "Oeuf à la Coque", "Oeuf Mollet", "Oeufs Cocotte", "Oeufs Poché", "Omelette Baveuse"]
		
		activerMinuteurBtn.setTitleColor(UIColor.white, for: .normal)
		
		activerMinuteurBtn.isEnabled = false
		activerMinuteurBtn.alpha = 0.3
		
		alarm()
		
	}
	
	func selectionCuisson(selection: Int) {
		
		var titreVC: String?
		
		switch selection {
			
		case 0:
			tempsCuisson = 600
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title = titre(str: pickerInfo[selection])
			break
			
		case 1:
			tempsCuisson = 180
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title  = titre(str: pickerInfo[selection])
			break
			
			
		case 2:
			tempsCuisson = 360
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title  = titre(str: pickerInfo[selection])
			break
			
		case 3:
			tempsCuisson = 180
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title  = titre(str: pickerInfo[selection])
			break
			
		case 4:
			tempsCuisson = 240
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title = titre(str: pickerInfo[selection])
			break
			
		case 5:
			tempsCuisson = 300
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
			navBar.topItem?.title  = titre(str: pickerInfo[selection])
			break
			
		default:
			//code
			print("Aucune sélection")
			break
			
		}
		
		//pour afficher option sélectionnée dans barre navigation
		self.title = titreVC
		
		activerMinuteurBtn.isEnabled = true
		activerMinuteurBtn.alpha = 1
		minuteurLabel.textColor = UIColor.black
		
	}
	
	func minuteurString(temps: Int) -> String {
		let heure = Int(temps) / 3600
		let minutes = Int(temps) / 60 % 60
		let secondes = Int(temps) % 60
		
		return String(format: "%02i:%02i:%02i", heure, minutes, secondes)
	}
	
	func compteur() {
		
		if (!estActif) {
			
			timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementer), userInfo: nil, repeats: true)
			timer.fire()
			activerMinuteurBtn.setTitle("STOP", for: .normal)
			activerMinuteurBtn.setTitleColor(UIColor.orange, for: .normal)
			estActif = true
			
		} else {
			
			timer.invalidate()
			activerMinuteurBtn.setTitle("Démarrer", for: .normal)
			activerMinuteurBtn.setTitleColor(UIColor.blue, for: .normal)
			estActif = false
			
		}
		
		
	}
	
	@objc func incrementer() {
		
		if tempsCuisson == 0 {
			timer.invalidate()
			minuteurLabel.text = "00:00:00"
			activerMinuteurBtn.setTitle("Démarrer", for: .normal)
			activerMinuteurBtn.setTitleColor(UIColor.blue, for: .normal)
			
			minuteurLabel.textColor = UIColor.green
			
			activerMinuteurBtn.isEnabled = false
			activerMinuteurBtn.alpha = 0.3
			
			lecteur.play()
			
		} else {
			tempsCuisson -= 1
			minuteurLabel.text = minuteurString(temps: tempsCuisson)
		}
	}
	
	func resetCompteur() {
		timer.invalidate()
		tempsCuisson = 0
		minuteurLabel.text = "00:00:00"
		activerMinuteurBtn.setTitle("Démarrer", for: .normal)
		activerMinuteurBtn.setTitleColor(UIColor.white, for: .normal)
		
		estActif = false
		
		activerMinuteurBtn.isEnabled = false
		activerMinuteurBtn.alpha = 0.3
		
		pickerView.selectRow(0, inComponent: 0, animated: true)
		
	}
	
	//MARK: -- AVAudioPlayer
	func alarm() {
		
		let fichier = Bundle.main.path(forResource: "alarm", ofType: "mp3")
		
		do {
			try lecteur = AVAudioPlayer(contentsOf: URL(string: fichier!)!)
		} catch {
			print("erreur lecture ficher MP3")
		}
	}
	
	// Retourner Titre
	func titre(str:String) -> String {
		return str
	}
	
	//MARK: -- PickerViewDataSource
	// returns the number of 'columns' to display.
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// returns the # of rows in each component..
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerInfo.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerInfo[row]
	}
	
	// changer couleur pickerView label
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.size.width, height: 44))
		label.textColor = UIColor.white
		label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
		label.textAlignment = .center
		label.text = String(format:" %@", pickerInfo[row])
		
		if (row == selection) {
			label.textColor = UIColor.yellow
		}
		
		return label
	}
	//MARK: -- PickerViewDelegate
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectionCuisson(selection: row)
		selection = row
	}
}

