//
//  HistoryScreen.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/05.
//

import SwiftUI
import MapKit

struct HistoryScreen: View {
	
	@State private var emojiList: [EmojiItem] = [
		EmojiItem(
			emoji: "👾",
			name: "Alien Monster",
			description: "A friendly-looking, tentacled space creature with two eyes."),
		EmojiItem(
			emoji: "🥑",
			name: "Avocado",
			description: "A pear-shaped avocado, sliced in half to show its yellow-green flesh and "
			+ "large brown pit."),
		EmojiItem(
			emoji: "🍟",
			name: "French Fries",
			description: "Thin-cut, golden-brown French fries, served in a red carton, as at "
			+ "McDonald’s."),
		EmojiItem(
			emoji: "🍕",
			name: "Pizza",
			description: "A slice of pepperoni pizza, topped with black olives on Google. WhatsApp "
			+ "adds green pepper, Samsung white onion."),
		EmojiItem(
			emoji: "🧩",
			name: "Puzzle Piece",
			description: "Puzzle Piece was approved as part of Unicode 11.0 in 2018 under the name "
			+ "“Jigsaw Puzzle Piece” and added to Emoji 11.0 in 2018."),
		EmojiItem(
			emoji: "🚀",
			name: "Rocket",
			description: "A rocket being propelled into space."),
		EmojiItem(
			emoji: "🗽",
			name: "Statue of Liberty",
			description: "The Statue of Liberty, often used as a depiction of New York City."),
		EmojiItem(
			emoji: "🧸",
			name: "Teddy Bear",
			description: "A classic teddy bear, as snuggled by a child when going to sleep."),
		EmojiItem(
			emoji: "🦄",
			name: "Unicorn",
			description: "The face of a unicorn, a mythical creature in the form of a white horse with "
			+ "a single, long horn on its forehead."),
		EmojiItem(
			emoji: "👩🏽‍💻",
			name: "Woman Technologist",
			description: "A woman behind a computer screen, working in the field of technology."),
		EmojiItem(
			emoji: "🗺",
			name: "World Map",
			description: "A rectangular map of the world. Generally depicted as a paper map creased at "
			+ "its folds, Earth’s surface shown in green on blue ocean."),
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
							ForEach(emojiList, id: \.name) {
								item in
								NavigationLink(destination: DetailsView(emojiItem: item)) {
		
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
	
	@State var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
	
	let annotations = [
		City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
	]
	
	let emojiItem: EmojiItem
	
	
	
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
					Map(coordinateRegion: $region, annotationItems: annotations) {
						MapMarker(coordinate: $0.coordinate)
					}.allowsHitTesting(false)
					
				}
				.navigationBarTitle(Text("Park #00312"), displayMode: .inline)
				.frame(maxWidth: .infinity, maxHeight: 350)
				.cornerRadius(10)
				.padding([.top, .leading, .trailing])
				
				HStack {
					VStack(alignment: .leading) {
						Text("44 Stanley").font(.title).fontWeight(.bold)
						Text("Braamfontein").foregroundColor(.secondary)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					
					Text("R8")
						.font(.system(size: 40))
						.fontWeight(.bold)
						.padding([.top, .bottom, .trailing])
						.frame(maxWidth: .infinity, alignment: .trailing)
					
				}
				
				VStack(alignment: .leading){
					Text("Time Parked:").fontWeight(.semibold)
					Text("43 minutes").fontWeight(.bold).font(.title)
				}
				
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
				
				
				Spacer()
				
				Button(action:{}) {
					Text("Report an Issue").fontWeight(.bold).padding().foregroundColor(Color.white)
				}
				.frame(maxWidth: .infinity)
				.background(Color.red).cornerRadius(10).padding()
			}
		}
	}
}

struct EmojiItem: Identifiable{
	let id = UUID()
	
	let emoji: String
	let name: String
	let description: String
}

struct HistoryScreen_Previews: PreviewProvider {
	static var previews: some View {
		HistoryScreen()
	}
}

struct CircleView: View {
	var emojiItem: EmojiItem
	
	var body: some View {
		ZStack{
			Text(emojiItem.emoji)
				.shadow(radius: 3)
				.font(.largeTitle)
				.frame(width: 65, height: 65)
				.overlay(
					Circle().stroke(Color.purple, lineWidth: 3))
		}
	}
}

struct CardViewOne: View {
	//	var emojiItem: EmojiItem
	
	var body: some View {
		HStack(alignment: .top) {
			Image("testImage_square")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
				.padding(12)
			
			VStack(alignment: .leading){
				Text("44 Stanley")
					.font(.title2)
					.fontWeight(.semibold)
				
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
			.padding([.top, .bottom, .trailing], 12)
			
			Text("R8")
				.font(.system(size: 60))
				.fontWeight(.regular)
				.padding([.top, .bottom, .trailing])
				.frame(maxWidth: .infinity, alignment: .trailing)
		}
		.frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
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

