//
//  Api.swift
//  Demo
//
//  Created by Julie Saby on 23/02/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import Foundation
import MapKit

class Api {
	
//	public func getStationPoint(longitude: Double, latitude : Double, completion: @escaping (RecordsContainer?) -> Void) {
//
//		let url = URL(string:"https://public.opendatasoft.com/api/records/1.0/search/?dataset=prix_des_carburants_j_7&q=&geofilter.distance=\(latitude)%2C+\(longitude)%2C+10000")
//
//		let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//			do {
//				if let dataResult = data {
//					do {
//						let jsonDecoder = JSONDecoder()
//						let stationsResult = try jsonDecoder.decode(RecordsContainer.self, from: dataResult)
//						completion(stationsResult)
//					}
//					catch {
//						print("Error")
//					}
//				}
//				else {
//					print("No result")
//				}
//			}
//			catch {
//				print(error.localizedDescription)
//			}
//		}
//		session.resume()
//	}
	
	public func getTag(completion: @escaping (TagContainer?) -> Void) {
		let url = URL(string: "https://data.mobilites-m.fr/api/lines/json?types=ligne&codes=SEM_C")
	
		let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			do {
				if let dataResult = data {
					do {
						let jsonDecoder = JSONDecoder()
						let stationsResult = try jsonDecoder.decode(TagContainer.self, from: dataResult)
						completion(stationsResult)
					}
					catch {
						print("Error")
					}
				}
				else {
					print("No result")
				}
			}
			catch {
				print(error.localizedDescription)
			}
		}
		session.resume()
	}
}

public class TagContainer: Decodable {
	var features: [Feature]!
}

public class Feature: Decodable {
	var geometry: Geometry!
}

public class Geometry: Decodable {
	var coordinates: [CLLocationCoordinate2D]!
	
	enum CodingKeys: String, CodingKey {
		case coordinates
	}
	
	required public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let tmpCoordinates = try values.decode([[[Double]]].self, forKey: .coordinates)
		
		let allCoordinates = tmpCoordinates.first
		
		coordinates = [CLLocationCoordinate2D]()
		allCoordinates?.forEach({ (coord) in
			coordinates.append(CLLocationCoordinate2D(latitude: coord[0], longitude: coord[1]))
		})
	}
}
