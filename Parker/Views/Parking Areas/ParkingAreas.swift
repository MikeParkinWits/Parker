//
//  ParkingAreas.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/04.
//

import SwiftUI

struct ParkingAreas: View {
    var body: some View {
		Button{} label: {
			VStack(alignment: .leading){
				
				
				Image("testImage")
					.resizable()
					.aspectRatio(contentMode: .fit)
				
					.overlay(						HStack {
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
				
				Text("44 Stanley")
					.font(.headline)
					.foregroundColor(Color.primary)
				Text("0.2km")
					.foregroundColor(.secondary)
					.font(.footnote)
			}
		}
		.frame(width: 250, height: 200)
    }
}

struct ParkingAreas_Previews: PreviewProvider {
    static var previews: some View {
        ParkingAreas()
    }
}
