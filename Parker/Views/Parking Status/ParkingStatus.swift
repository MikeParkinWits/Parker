//
//  ParkingStatus.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/04.
//

import SwiftUI

struct ParkingStatus: View {
    var body: some View {
		VStack {
			Spacer()
			Text("Current Parking Status")
				.font(.title2)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
			
			HStack (alignment: .top){
				Image("testProfilePicture")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 75, height: 75)
					.multilineTextAlignment(.leading)
					.cornerRadius(10)
				
				
				VStack(alignment: .leading){
					Text("John Smith")
						.fontWeight(.semibold)
						.foregroundColor(.primary)
					
					
					
					HStack {
						Image(systemName: "mappin.circle")
						
						Text("44 Stanley")
							.font(.subheadline)
					}
					.padding(.top, -5)
					.foregroundColor(.secondary)

					
					
				}.frame(maxWidth: .infinity, alignment: .leading)
					
				
				
				Spacer()
				
				Text("R8")
					.font(.system(size: 60))
					.fontWeight(.medium)
				
			}.padding(.horizontal)
			
			Spacer()
			
			VStack (alignment: .leading){
				Text("Time Parked:")
					.font(.headline)
					.fontWeight(.regular)
				Text("43 Minutes")
					.font(.title)
					.fontWeight(.regular)
			}.padding(.horizontal)						.frame(maxWidth: .infinity, alignment: .leading)
			
			Spacer()
			
			Button(action:{}) {
				Text("End Parking Session").fontWeight(.bold).padding().foregroundColor(Color.white)
			}
			.frame(maxWidth: .infinity)
			.background(Color.blue).cornerRadius(10).padding()
				
			Spacer()
		}
		.padding([.leading, .bottom, .trailing], 1)
    }
}

struct ParkingStatus_Previews: PreviewProvider {
    static var previews: some View {
        ParkingStatus()
    }
}
