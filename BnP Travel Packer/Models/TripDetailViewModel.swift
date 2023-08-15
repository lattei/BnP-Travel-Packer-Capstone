//
//  TripDetailViewModel.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/14.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore

class TripDetailViewModel: ObservableObject {
    @Published var trip: Trip
    private let db = Firestore.firestore()  // Declare db at the class level
    private var tripID: String?
    
    init(trip: Trip) {
        self.trip = trip
        self.tripID = trip.id
        subscribeToChanges()
    }
    
    private func subscribeToChanges() {
        guard let tripID = trip.id else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("trips").document(tripID)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty")
                    return
                }
                
                do {
                    let updatedTrip = try Firestore.Decoder().decode(Trip.self, from: data)
                    self.trip = updatedTrip
                } catch {
                    print("Error decoding updated document into Trip: \(error)")
                }
            }
       
    }
    func removeItem(item: String) {
        let remoteRef = db.collection("trips").document(tripID ?? "")

        remoteRef.updateData(["items": FieldValue.arrayRemove([item])]) { err in
            if let err = err {
                print("Error deleting item: \(err)!")
            }
        }
    }
    
    func addItem(item: String) {
        let remoteRef = db.collection("trips").document(tripID ?? "")

        remoteRef.updateData(["items": FieldValue.arrayUnion([item])]) { err in
            if let err = err {
                print("Error adding item: \(err)!")
            }
        }
    }
}
