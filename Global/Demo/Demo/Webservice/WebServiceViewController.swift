//
//  WebServiceViewController.swift
//  Demo
//
//  Created by Julie Saby on 23/02/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import UIKit

class WebServiceViewController: UIViewController {

	var api = Api()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let latitude = 45.19130205
		let longitude = 5.71517336
		
		api.getTag(completion: { tags in
			print(tags)
		})
//		api.getStationPoint(longitude: longitude, latitude: latitude) { recordsContainer in
//			recordsContainer?.records?.forEach({ record in
//				print(record)
//			})
//		}
    }

}
