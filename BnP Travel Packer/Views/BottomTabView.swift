//
//  BottomTabView.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/02.
//

import SwiftUI

struct BottomTabView: View {
    
    @AppStorage("showOnContent")
    var showOnContent: Bool = true
    @State private var selection = 1
    

    init() {
        UITabBar.appearance()
            .backgroundColor =
        UIColor(Color("sunsetOrange"))
        UITabBar.appearance()
            .unselectedItemTintColor =
        UIColor(named: "UnselectedTabColor")
    }
    var body: some View {
        TabView(selection: $selection) {
            NewTripView(tripManager: TripManager())
                .tabItem {
                    Label("New Trip", systemImage:"globe.americas.fill")
                }
                .tag(1)
            ContentView(tripManager: TripManager())
                .tabItem {
                    Label("Trips", systemImage:"map")
                }
                .tag(2)
            StartView()
                .tabItem {
                    Label("User", systemImage:"person")
                }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
