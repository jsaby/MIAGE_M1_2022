//
//  GeolocationViewController.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit
import CoreLocation

class GeolocationViewController: UIViewController, CLLocationManagerDelegate {
	
	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		checkLocationServices()
	}
	
	//check if the authorization services is ok
	func checkLocationServices(){
		if CLLocationManager.locationServicesEnabled(){
			setUpLocationManager()
			checkLocationAuthorization()
		} else{
			showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
		}
	}
	
	func setUpLocationManager() {
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
	}
	
	func checkLocationAuthorization(){
		switch CLLocationManager.authorizationStatus() {
		case .authorizedWhenInUse:
			locationManager.startUpdatingLocation()
		case .denied:
			showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
			break
		case .notDetermined:
			locationManager.requestWhenInUseAuthorization()
			break
		case .restricted:
			showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
			break
		case .authorizedAlways:
			break
			
		}
	}
	
	//verify differents permissions
	func locationManager(_ manager:CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
		checkLocationAuthorization()
	}
	
	//update the position of the user when he move and show buses points with itineraire
	func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		
		DispatchQueue.main.async {
			//ICI
		}
		
		latitudeLabel.text = String(location.coordinate.latitude)
		longitudeLabel.text = String(location.coordinate.longitude)
		
		
	}
}
