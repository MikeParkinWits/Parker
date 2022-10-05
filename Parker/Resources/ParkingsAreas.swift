//
//  ParkingsAreas.swift
//  Parker
//
//  Created by Mike Parkin
//

import Foundation

class ParkingsAreas: ObservableObject {
	let parkingAreas: [Parkings]
	
	var primary: Parkings {
		parkingAreas[0]
	}
	
	init(){
		let url = Bundle.main.url(forResource: "ParkHistory", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		parkingAreas = try! JSONDecoder().decode([Parkings].self, from: data)
	}
}
