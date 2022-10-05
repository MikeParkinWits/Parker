//
//  WelcomeScreen.swift
//  Parker
//
//  Created by Mike Parkin
//

import SwiftUI
import MapKit

struct WelcomeScreen: View {
	@State private var searchText = ""
	
	var body: some View {
		NavigationView()
		{
			
				VStack(alignment: .leading) {
					
						Text("Good Afternoon")
							.font(.largeTitle)
							.fontWeight(.bold)
							.frame(width: 200,  alignment: .leading)
							.padding([.leading, .trailing])
							.padding(.top, 10)

					
						HStack {
							Text("Explore Parking Areas")
								.font(.title2)
								.fontWeight(.medium)
								
							
							Spacer()
							
							VStack {
								
								NavigationLink("See all", destination: AllAreas()).foregroundColor(.secondary)
									
							}
						}
						.padding(.horizontal)
						.padding(.top, -10)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack(spacing: 16) {
								ForEach(0 ..< 5) { item in
									ParkingAreas()
								}
							}
							.padding(.bottom, 3.0)
							.padding(.horizontal)
						}
					

					
					Spacer()
						
//						Divider()
//							.frame(height: 1)
//							.overlay(.gray)
//							.padding(.horizontal)
					
					
					
						
						

					ParkingStatus().padding(.top, 10)
					
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			

			
			
		}
	}
}

struct WelcomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeScreen()
	}
}


struct ParkArea: Identifiable{
	let id = UUID()
	
	let locationName: String
	let locationAddress: String
	let locationLat: Double
	let locationLong: Double
	let parkDistance: Double
	let parkPrice: Int
	let parkTime: Int
	let parkImage: String
}

struct AllAreas: View {
	
	@State private var parkArea: [ParkArea] = [
		ParkArea(
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDistance: 0.2,
			parkPrice: 10,
			parkTime: 72,
			parkImage: "test1"
		),
		ParkArea(
			locationName: "Parkhurst Strip",
			locationAddress: "Parkhurst",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDistance: 0.4,
			parkPrice: 10,
			parkTime: 64,
			parkImage: "testImage_square"
		),
		ParkArea(
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDistance: 1.2,
			parkPrice: 8,
			parkTime: 43,
			parkImage: "test1"
		)
	]
		
	var body: some View {
		
		ScrollView {
			VStack(alignment: .leading, spacing: 20){
				ForEach(parkArea, id: \.locationName) {
					item in
					NavigationLink(destination: DetailAreaView(parkArea: item)) {
													
						CardViewOneAreas(parkArea: item)
							.padding(.horizontal, 17)
							.padding(.bottom, -10)
							.foregroundColor(.primary)
					}
				}
			}.navigationBarTitle(Text("Parking Areas"), displayMode: .inline)
		}
		
	}
}

struct DetailAreaView: View{
	
	let parkArea: ParkArea

	@State var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: -26.1850882, longitude: 28.0187231), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
	
	var price = 0;
	
	var prices = ["<15", "15 - 60", "60 - 120", "120 - 180", "180 - 240", "240 - 300", "300+"]
	
	var body: some View{
		VStack(alignment: .leading){
			//			HStack{
			//				CircleView(emojiItem: emojiItem)
			//					.padding(.trailing, 5)
			//
			//				Text(emojiItem.name).font(.largeTitle).fontWeight(.bold)
			//
			//				Spacer()
			//			}
			//
			//			Text(emojiItem.description)
			//				.padding(.top)
			//
			//			Spacer()
			
			//			Image("testImage_square")
			//				.resizable()
			//				.aspectRatio(contentMode: .fit)
			//				.mask {
			//					Rectangle()
			//
			//						.cornerRadius(10)
			//				}
			//		}
			//		.padding()
			//		.navigationBarTitle(Text("Park #00312"), displayMode: .inline)
			
			VStack {
				VStack{
					
					Map(coordinateRegion: $region, annotationItems: [
						City(name: parkArea.locationName, coordinate: CLLocationCoordinate2D(latitude: parkArea.locationLat, longitude: parkArea.locationLong))
					]) {
						MapMarker(coordinate: $0.coordinate)
						
					}.allowsHitTesting(false)
					
					
					
				}
				.navigationBarTitle(Text(parkArea.locationName), displayMode: .inline)
				.frame(maxWidth: .infinity, maxHeight: 300)
				.cornerRadius(10)
				.padding([.top, .leading, .trailing])
				
				HStack {
					VStack(alignment: .leading) {
						
						Text(parkArea.locationAddress).foregroundColor(.secondary)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					
					Text(String(parkArea.parkDistance) + "km")
						.foregroundColor(.secondary)
						.padding([.top, .bottom, .trailing])
						.frame(maxWidth: .infinity, alignment: .trailing)
					
				}
				
				HStack(alignment: .top) {
					Text("Prices").fontWeight(.semibold).font(.body)
						.padding(.bottom, 1)
					Spacer()
				}.padding(.horizontal)
				
				ForEach(prices, id: \.self){x in
					HStack {
						HStack(){
							Text(x).fontWeight(.semibold).font(.body)
							Text("min").fontWeight(.semibold).font(.body).foregroundColor(.secondary)
						}
						
						
						Spacer()
						
						
						
						Text("Price").fontWeight(.semibold).font(.body)
					}
					.padding(.horizontal)
				}
			}

					

				
				}
				
				.frame(maxWidth: .infinity, alignment: .leading)
			.padding()
				
				
				Spacer()
				
			}
		}
	





struct CardViewOneAreas: View {
	
	let parkArea: ParkArea

	
	var body: some View {
		HStack(alignment: .center) {
			Image(parkArea.parkImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
				.padding(12)
			
			VStack(alignment: .leading){
				Text(parkArea.locationName)
					.font(.title3)
					.fontWeight(.semibold)
					.fixedSize()
				
				HStack{
					
					//					Image(systemName: "mappin.circle")
					
					Text(parkArea.locationAddress)
						.font(.body)
						.fontWeight(.medium)
						.fixedSize(horizontal: false, vertical: true).foregroundColor(.secondary)
				}
				
				Spacer()
				
				Text(String(parkArea.parkDistance) + "km")
					.fontWeight(.light)
					.foregroundColor(.secondary)
					.font(.body)
			}
			.padding([.top, .bottom, .trailing], 12)
			
			Spacer()

		}
		.frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
		.background(Color("List Grey"))
		.cornerRadius(10)
		.padding(.top, 15)
		.shadow(color: Color("List Grey"), radius: 5)
		
	}
}
