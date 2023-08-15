//
//  NewTripView.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/08.
//

import SwiftUI

struct NewTripView: View {
    @StateObject var tripManager : TripManager
    var body: some View {
        NewTripForm(items: [], locationService: LocationService())
            .environmentObject(tripManager)
        
    }
}

struct NewTripView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripView(tripManager: TripManager())
            .environmentObject(TripManager())
    }
}
