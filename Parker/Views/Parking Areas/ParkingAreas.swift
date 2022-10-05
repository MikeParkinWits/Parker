//
//  ParkingAreas.swift
//  Parker
//
//  Created by Mike Parkin
//

import SwiftUI

struct ParkingAreas: View {
	
	var body: some View {
		Button{} label: {
			VStack(alignment: .leading){
				
				Image("imageTestTwo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					
				
					.overlay(
						
						HStack {
							Image(systemName: "mappin.circle")
							
							Text("Braamfontein")
								.font(.subheadline)
							
								.frame(maxWidth: .infinity, alignment: .leading)
						}
						
							.padding(10)
							.foregroundColor(Color.white)
							.background(Color.black.blur(radius: 20)), alignment: .bottomLeading
					)
					
					.cornerRadius(10)
					.shadow(color: Color.gray.opacity(0.9), radius: 5, x: 0, y: 0)
					.padding(.top, 10)
				
				Text("44 Stanley")
					.font(.headline)
					.foregroundColor(Color.primary)
				Text("0.2km")
					.foregroundColor(.secondary)
					.font(.footnote)
			}
			
		}
		
	}
}

struct ParkingAreas_Previews: PreviewProvider {
	static var previews: some View {
		ParkingAreas()
	}
}
