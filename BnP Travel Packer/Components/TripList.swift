//
//  TripLists.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/08.
//

import SwiftUI

struct TripList: View {
    
    @EnvironmentObject var tripManager: TripManager
    
    
    var body: some View {
        ScrollView  {
            ForEach(tripManager.trips, id: \.destination) { trip in
                NavigationLink {
                    TripDetailView(trip: trip)
                } label: {
                    TripRow(trip: trip)
                }

            }
            
        }
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        TripList()
            .environmentObject(TripManager())
    }
}
