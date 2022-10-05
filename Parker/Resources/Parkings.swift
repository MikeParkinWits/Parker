//
//  Parkings.swift
//  Parker
//
//  Created by Mike Parkin
//

import Foundation

struct Parkings: Decodable, Identifiable{
	let id = UUID()
	
	let parkNum: Int
	let locationName: String
	let locationAddress: String
	let locationLat: Double
	let locationLong: Double
	let parkDate: String
	let parkPrice: Int
	let parkTime: Int
	let parkImage: String
	
	static let example = Parkings(parkNum: 00000, locationName: "Test Name", locationAddress: "Test Location", locationLat: 0.00, locationLong: 00.00, parkDate: "21/05/2022", parkPrice: 10, parkTime: 23, parkImage: "testImage_sqaure")
}
