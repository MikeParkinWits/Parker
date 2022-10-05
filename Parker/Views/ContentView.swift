//
//  ContentView.swift
//  Parker
//
//  Created by Mike Parkin
//

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		TabView {
			WelcomeScreen()
			.tabItem{
				Image(systemName: "house")
				Text("Home")
			}
			HistoryScreen()
			.tabItem{
				Image(systemName: "menucard")
				Text("History")
			}
			ProfileScreen()
			.tabItem{
				Image(systemName: "person.crop.circle")
				Text("Profile")
			}
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13 mini")
	}
}
