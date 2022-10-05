//
//  WelcomeScreen.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/04.
//

import SwiftUI

struct WelcomeScreen: View {
	@State private var searchText = ""
	
	var body: some View {
		NavigationView()
		{
			VStack() {
				Text("")
					.searchable(text: $searchText, prompt: "Search Parking Areas...")
				
				HStack {
					Text("Nearby Parking Areas")
						.font(.title2)
						.fontWeight(.semibold)
					
					Spacer()
					
					Button("See all") {
						//Put Code Here
					}.foregroundColor(.secondary)
				}
				.padding(.horizontal)
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 16) {
						ForEach(0 ..< 5) { item in
							ParkingAreas()
						}
					}
					.padding(.bottom, 3.0)
					.padding(.horizontal)
				}
				
				Divider()
					.padding(.horizontal)
				
				ParkingStatus()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.navigationTitle("Welcome")
			
			
		}
	}
}

struct WelcomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeScreen()
	}
}
