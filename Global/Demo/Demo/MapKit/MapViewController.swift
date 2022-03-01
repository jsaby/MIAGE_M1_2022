//
//  MapViewController.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet weak var mapView: MKMapView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		mapView.delegate = self
		
		mapView.showsUserLocation = true
		mapView.showsPointsOfInterest = false
		
		// Nous centrons la carte sur la latitude et la longitude passée en paramètre
		let center = CLLocationCoordinate2D(latitude: 45.19193413, longitude: 5.72666532)
		centerMap(onLocation: center)
		
		// Nous créons une annotation customisée
		let annotation = CustomAnnotation()
		annotation.id = "id-1"
		annotation.coordinate = CLLocationCoordinate2D(latitude: 45.18541716, longitude: 5.72996383)
		annotation.title = "Mon annotation customisée"
		annotation.subtitle = "Nous sommes à Chavant"
		mapView.addAnnotation(annotation)
		
		// Nous créons un itinéraire entre deux points
		let sourceCoordinates = CLLocationCoordinate2D(latitude: 45.19193413, longitude: 5.72666532)
		let destinationCoordinates = CLLocationCoordinate2D(latitude: 45.18541716, longitude: 5.72996383)
		directionsRequest(source: sourceCoordinates, destination: destinationCoordinates)
    }
	
	func centerMap(onLocation location: CLLocationCoordinate2D) {
		let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
		mapView.setRegion(region,animated: true)
    }

	//MARK: -- Annotations --
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		if annotation is CustomAnnotation {
			let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))

			let rightButton = UIButton(type: .infoLight)
			rightButton.tag = annotation.hash

			pinView.animatesDrop = true
			pinView.canShowCallout = true
			pinView.rightCalloutAccessoryView = rightButton

			return pinView

		} else {
			return nil
		}
	}
	
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
		showAlert(title: "Annotation sélectionnée", message: "Vous venez de sélectionner l'annotation")
		
    }
	
	//MARK: -- Itinéraire --
    func directionsRequest(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
		request.source = MKMapItem(placemark: MKPlacemark(coordinate: source, addressDictionary: nil))
		request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination, addressDictionary: nil))
		request.requestsAlternateRoutes = false
		request.transportType = .walking

		let directions = MKDirections(request: request)
		
		directions.calculate { [unowned self] response, error in
			guard let unwrappedResponse = response else { return }
			
			for route in unwrappedResponse.routes {
				self.mapView.addOverlay(route.polyline)
				self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
			}
		}
		
		self.mapView.removeOverlays(mapView.overlays)
    }
	
	//show and custom the line
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 3.0
        return renderer
    }
}
