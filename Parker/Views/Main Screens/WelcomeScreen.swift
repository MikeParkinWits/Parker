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
			
				VStack(alignment: .leading) {
					
						Text("Good Afternoon")
							.font(.largeTitle)
							.fontWeight(.bold)
							.frame(width: 200,  alignment: .leading)
							.padding([.top, .leading, .trailing])

					
						HStack {
							Text("Explore Parking Areas")
								.font(.title2)
								.fontWeight(.medium)
							
							Spacer()
							
							Button("See all") {
								//Put Code Here
							}.foregroundColor(.secondary)
						}
						.padding(.horizontal)
						.padding(.top, 0.5)
						
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
