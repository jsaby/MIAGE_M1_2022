//
//  Model.swift
//  Demo
//
//  Created by Julie Saby on 23/02/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import Foundation

public class Field: Decodable {
	var fields: Station?
	init(fields:Station) {
		self.fields = fields
	}
}

public class RecordsContainer: Decodable {
	var records: [Field]?
	
	init(records:[Field]) {
		self.records = records
	}
}

public class Station: Decodable {
	
	var name: String?
	var brand: String?
	var price_sp95: Double?
	var price_gazole: Double?
	var price_gplc: Double?
	var price_e10: Double?
	var price_sp98: Double?
	var price_e85: Double?
	var services: String?
	var shortage:String?
	var geo_point: [Double?]
	var address: String?
	var fuel: String?
	var city: String?
	var cp: String?
}
