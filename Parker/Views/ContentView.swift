//
//  ContentView.swift
//  Parker
//
//  Created by Mike Parkin on 2022/10/04.
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
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13 mini")
	}
}
