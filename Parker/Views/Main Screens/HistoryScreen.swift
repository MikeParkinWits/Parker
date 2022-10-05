//
//  HistoryScreen.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/05.
//

import SwiftUI
import MapKit

struct HistoryScreen: View {
	
	@State private var parkHistoryList: [ParkHistory] = [
		ParkHistory(
			parkNum: 000001,
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDate: "22/02/2022",
			parkPrice: 8,
			parkTime: 43,
			parkImage: "testImage_square"
		),
		ParkHistory(
			parkNum: 000002,
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDate: "22/02/2022",
			parkPrice: 8,
			parkTime: 43,
			parkImage: "testImage_square"
		),
		ParkHistory(
			parkNum: 000002,
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDate: "22/02/2022",
			parkPrice: 8,
			parkTime: 43,
			parkImage: "testImage_square"
		),
		ParkHistory(
			parkNum: 000003,
			locationName: "44 Stanley",
			locationAddress: "Braamfontein",
			locationLat: -26.1850882,
			locationLong: 28.0187231,
			parkDate: "22/02/2022",
			parkPrice: 8,
			parkTime: 43,
			parkImage: "testImage_square"
		)
	]
	
	
	
	var body: some View {
		NavigationView{
			
			//			List(emojiList) {
			//				emojiItem in
			//
			//
			//				CardViewTwo()		.background(					NavigationLink(destination: DetailsView(emojiItem: emojiItem)) {
			//					EmptyView()
			//				}
			//
			//					.opacity(0))
			//
			//			}
			//			.navigationTitle("Parking History")
			//
			//
			//		}
			
			ScrollView {
				VStack(spacing: 20) {
					ForEach(parkHistoryList, id: \.parkNum) {
						item in
						NavigationLink(destination: DetailsView(parkHistory: item)) {
														
							CardViewOne()
								.padding(.horizontal, 17)
								.padding(.bottom, -10)
								.foregroundColor(.primary)
						}
					}
				}
			}.navigationTitle("Parking History")
			
			
		}
		
	}
}

struct City: Identifiable {
	let id = UUID()
	let name: String
	let coordinate: CLLocationCoordinate2D
}


struct DetailsView: View {
	
	let parkHistory: ParkHistory
	
	@State var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: -26.1850882, longitude: 28.0187231), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
	
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
						City(name: parkHistory.locationName, coordinate: CLLocationCoordinate2D(latitude: parkHistory.locationLat, longitude: parkHistory.locationLong))
					]) {
						MapMarker(coordinate: $0.coordinate)
			
					}.allowsHitTesting(false)
					
					

				}
				.navigationBarTitle(Text("#" + String(format: "%05d", parkHistory.parkNum)), displayMode: .inline)
				.frame(maxWidth: .infinity, maxHeight: 300)
				.cornerRadius(10)
				.padding([.top, .leading, .trailing])
				
				HStack {
					VStack(alignment: .leading) {
						Text(parkHistory.locationName).font(.title
						).fontWeight(.bold)
						Text(parkHistory.locationAddress).foregroundColor(.secondary)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					
					Text("R8")
						.font(.largeTitle)
						.fontWeight(.bold)
						.padding([.top, .bottom, .trailing])
						.frame(maxWidth: .infinity, alignment: .trailing)
					
				}
				
				HStack {
					VStack(alignment: .leading){
						Text("Date Parked").fontWeight(.semibold)
							.font(.title3)
						Text("22/09/2022").fontWeight(.regular).font(.body)
					}
					
					Spacer()
					
					VStack(alignment: .leading){
						Text("Time Parked").fontWeight(.semibold)
							.font(.title3)
						Text("43 minutes").fontWeight(.regular).font(.body)
					}
					

				
				}
				
				.frame(maxWidth: .infinity, alignment: .leading)
			.padding()
				
				
				Spacer()
				
				Button(action:{}) {
					Text("Report an Issue").fontWeight(.bold).padding().foregroundColor(Color.white)
						.frame(maxWidth: .infinity)
						.background(Color.red).cornerRadius(10).padding()
				}
				
			}
		}
	}
}

struct ParkHistory: Identifiable{
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
}

struct HistoryScreen_Previews: PreviewProvider {
	static var previews: some View {
		HistoryScreen()
	}
}

struct CardViewOne: View {
	//	var emojiItem: EmojiItem
	
	var body: some View {
		HStack(alignment: .center) {
			Image("testImage_square")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
				.padding(12)
			
			VStack(alignment: .leading){
				Text("44 Stanley")
					.font(.title3)
					.fontWeight(.semibold)
				
				HStack{
					
					//					Image(systemName: "mappin.circle")
					
					Text("#00001")
						.font(.body)
						.fontWeight(.medium)
						.fixedSize(horizontal: false, vertical: true).foregroundColor(.secondary)
				}
				
				Spacer()
				
				Text("22/09/2022")
					.fontWeight(.light)
					.foregroundColor(.secondary)
					.font(.body)
			}
			.padding([.top, .bottom, .trailing], 12)
			
			Text("R8")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.padding([.top, .bottom, .trailing], 20)
				.frame(maxWidth: .infinity, alignment: .bottomTrailing)
		}
		.frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
		.background(Color("List Grey"))
		.cornerRadius(10)
		.padding(.top, 15)
		.shadow(color: Color("List Grey"), radius: 5)
		
	}
}


struct CardViewTwo: View {
	//	var emojiItem: EmojiItem
	
	var body: some View {
		HStack(alignment: .center) {
			Image("testImage_square")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 100, height: 100)
				.mask {
					Rectangle()
						.frame(width: 80, height: 80)
						.cornerRadius(10)
				}
			
			VStack(alignment: .leading, spacing: 0){
				Text("44 Stanley")
					.font(.title3)
					.fontWeight(.semibold)
					.fixedSize(horizontal: false, vertical: true)
				
				HStack{
					
					//					Image(systemName: "mappin.circle")
					
					Text("Braamfontein")
						.font(.subheadline)
						.fixedSize(horizontal: false, vertical: true)
				}
				
				Spacer()
				
				Text("22/09/2022").foregroundColor(.secondary)
					.font(.subheadline)
				
				
			}
			.padding([.top, .bottom, .trailing], 10)
			.frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
			
			Spacer()
			Text("R8")
				.font(.system(size: 40))
				.fontWeight(.bold)
				.padding([.top, .bottom, .trailing])
			
			
			
		}
		
	}
}

