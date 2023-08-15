//
//  BnP_Travel_PackerApp.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/07/27.
//

import SwiftUI
import Firebase



@main
struct BnP_Travel_PackerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(TripManager())

        }
    }
}
