//
//  TripRow.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/08.
//

import SwiftUI

struct TripRow: View {
    
    @EnvironmentObject var tripManager: TripManager
    var trip: Trip
    
    var body: some View {
        HStack {
            Text(trip.destination)
                        .foregroundColor(Color("AccentColor"))
        
                    
                    Spacer()
                    Button {
                        print("Deleted!")
                        tripManager.deleteTrip(toDelete: trip)
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(Color("Flare"))
                    }
                }
                .frame(height: 35)
                .padding(.horizontal, 19)
                .padding(.vertical, 10)
                .background(Color("sunsetOrange"))
                .padding(.horizontal, 35)
    }
}

struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TripRow(
                trip: Trip(id: "1",
                           bags: 0,
                           destination: "Paris, France", items: ["shirt", "pants"],
                               name: "Ada",
                               startDate: Date(),
                               endDate: Date()
                              )
            )
            TripRow(
                trip: Trip(id: "2",
                           bags: 1,
                           destination: "Tokyo, Japan", items: ["pants", "shoes"],
                               name: "Ada",
                               startDate: Date(),
                               endDate: Date()
                              )
            )
        }
        
    }
}
