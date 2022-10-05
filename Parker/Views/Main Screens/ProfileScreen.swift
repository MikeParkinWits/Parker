//
//  ProfileScreen.swift
//  Parker
//
//  Created by Mike Parkin
//

import SwiftUI

struct ProfileScreen: View {
	var body: some View {
		NavigationView()
		{
			VStack(alignment: .leading){
				HStack(alignment: .top){
					Image("carTest")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 100, height: 100)
						.cornerRadius(10)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.black, lineWidth: 2)
						)
					
					VStack(alignment: .leading){
						Text("Jake Sky").font(.title2).fontWeight(.bold)
						
						Text("Ford Fiesta").font(.footnote).fontWeight(.regular)
						
						Text("BB11BB GP").font(.footnote).fontWeight(.regular).foregroundColor(.secondary)
						
						Spacer()
												
						Text("Payment: Apple Pay").font(.footnote).fontWeight(.regular)
					}
					
					Spacer()
						
				}.frame(width: .infinity, height: 100, alignment: .topLeading)
					.padding()
				
				

				
				VStack{
					Button(action:{}) {
						Text("Update Car Information").fontWeight(.bold).padding().foregroundColor(Color.white)
							.frame(maxWidth: .infinity)
							.background(Color.blue)
							.cornerRadius(10).padding()
					}
					
					Button(action:{}) {
						Text("Payment Methods").fontWeight(.bold).padding().foregroundColor(Color.white)
							.frame(maxWidth: .infinity)
							.background(Color.blue)
							.cornerRadius(10).padding()
					}
					
					Button(action:{}) {
						Text("App Settings").fontWeight(.bold).padding().foregroundColor(Color.white)
							.frame(maxWidth: .infinity)
							.background(Color.blue)
							.cornerRadius(10).padding()
					}
				}
				
				Spacer()
				
				Button(action:{}) {
					Text("Logout").fontWeight(.bold).padding().foregroundColor(Color.red)
						.frame(maxWidth: .infinity)
						.background(Color.white)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.red, lineWidth: 2)
						)
						.cornerRadius(10).padding()
				}
			}
			.frame(width: .infinity, alignment: .leading)
			.navigationTitle("Profile")
		}
		
	}
}

struct ProfileScreen_Previews: PreviewProvider {
	static var previews: some View {
		ProfileScreen()
	}
}
