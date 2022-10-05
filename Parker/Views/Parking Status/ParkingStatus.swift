//
//  ParkingStatus.swift
//  Parker
//
//  Created by Mike Parkin
//

import SwiftUI

struct ParkingStatus: View {
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("Parking Status")
				.font(.title)
				.fontWeight(.bold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
				.padding(.top, 18)

			
			Group(){

				HStack {
					VStack (alignment: .leading){
						Text("Time Parked")
							.font(.title3)
							.fontWeight(.semibold)
						Text("43 Minutes")
							.font(.body)
							.fontWeight(.regular)
					}.padding(.horizontal)						.frame(maxWidth: .infinity, alignment: .leading)
					
					Text("R8")
						.font(.largeTitle)
						.fontWeight(.bold)
						.padding(.horizontal)

				}.padding(.vertical, 5)
				

				
				Text("Guard")
					.font(.title2)
					.fontWeight(.bold)
					.padding(.horizontal)
					.padding(.top, 10)
				
				HStack (alignment: .top){
					Image("testImageSecurityGuard")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 50, height: 50)
						.multilineTextAlignment(.leading)
						.cornerRadius(10)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.black, lineWidth: 2)
						)
					
					VStack(alignment: .leading){
						Text("John Smith")
							.font(.body)
							.fontWeight(.semibold)
							.foregroundColor(.primary)
						
						HStack {
							Text("44 Stanley Guard")
								.font(.body)
						}
						.foregroundColor(.secondary)
						
					}.frame(maxWidth: .infinity, alignment: .leading)
					
					
					
					Spacer()
					

					
					Button(action:{}) {
						Image(systemName: "exclamationmark.square").foregroundColor(Color.white).padding()
							.background(Color.red).cornerRadius(10)
					}
					
				}.padding(.horizontal)
					.padding(.bottom, 30)
				
				
			}
			
			
			
			
//						Button(action:{}) {
//							Text("View Parking Prices").fontWeight(.bold).padding().foregroundColor(Color.white).frame(maxWidth: .infinity)
//								.background(Color.blue).cornerRadius(10).padding()
//						}
						
			
		
		}
		.background(
			Color("List Grey")
				.cornerRadius(25)
				.padding(.bottom, -25)
				.shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
				.mask(Rectangle().padding(.top, -20)) /// here!
		).frame(minHeight: 10, maxHeight: 500, alignment: .bottom)
		
		.padding([.leading, .bottom, .trailing], 1)

	}
}

struct ParkingStatus_Previews: PreviewProvider {
	static var previews: some View {
		ParkingStatus()
	}
}
