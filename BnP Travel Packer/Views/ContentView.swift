//
//  ContentView.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tripManager: TripManager
    
    var body: some View {
        VStack {
            VStack {
               TitleRow()
                Text("Current Trips")
                    .font(.headline)
               TripList()
                    .environmentObject(tripManager)
                
                
                
                
            }
            .background(Color("backgroundColor"))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tripManager: TripManager())
    }
}
