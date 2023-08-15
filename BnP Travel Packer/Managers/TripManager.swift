//
//  TripManager.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/06.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore

class TripManager: ObservableObject {
    @Published private(set) var trips = [Trip]()
    @Published var specificTrip: Trip? = nil
    @Published var items: [String] = []
    
    let db = Firestore.firestore()
    
    init() {
        getTrips()

    }
    //create a func that takes param tripID; returns trip, call variable in view
    func getTrips() {
     //set up a snapshot listener
        
        db.collection("trips").addSnapshotListener { querySnapShot, error in
            
            guard let documents = querySnapShot?.documents else {
                print("Error fetching documents")
                return
            }

            self.trips = documents.compactMap { document -> Trip? in
                do {
                    return try document.data(as: Trip.self)


                } catch {
                    print("Error decoding document into Trip: \(error)")
                    return nil
                }

            }
        }
    }
    func getSpecificTrip(tripID: String) {
        print("Fetching specific trip for ID: \(tripID)")
        let tripID = tripID
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
                print("Current data: \(data)")
        }
        }
    

  
    

    //creating a new entry, if no entry then return
    func addTrip(startDate: Date, endDate: Date, destination: String, name: String, bags: Int, items: [String]) {
        
//        func addTrip(startDate: Date, endDate: Date, destination: String, essentialItems: [String], items: [String], name: String, personalBag: [String], carryOn: Bool, bags: Int) {
        //bags: bags,
        //carryOn: carryOn
        //            essentialItems: essentialItems,
        //            items: items,
        //            personalBag: personalBag,  make this into a new model asap lol
        
        guard !startDate.description.isEmpty else {
            return
        }
        
        let newTrip = Trip(
            bags: bags,
            destination: destination,
            items: items,
            name: name,
            startDate: startDate,
            endDate: endDate)
        //add item to trip, items -> append setData
        do {
            try db.collection("trips").document().setData(from: newTrip)
            
        } catch {
            print("Error adding trip to Firestore: \(error)")
        }
    }
    
    func addItem(toUpdate: Trip, item: String) {
        guard let tripID = toUpdate.id else {
            print("Error, trip not found")
            return
        }
        let remoteRef = db.collection("trips").document(tripID)

        remoteRef.updateData(["items": FieldValue.arrayUnion([item])]) { err in
            if let err = err {
                print("Error adding item: \(err)!")
            }
        }
    }
    
    func removeItem(toUpdate: Trip, item: String) {
        guard let tripID = toUpdate.id else {
            print("Error, trip not found")
            return
        }
        let remoteRef = db.collection("trips").document(tripID)

        remoteRef.updateData(["items": FieldValue.arrayRemove([item])]) { err in
            if let err = err {
                print("Error deleting item: \(err)!")
            }
        }
    }
    
    func deleteTrip(toDelete: Trip) {
        guard let tripID = toDelete.id else {
            print("Error Trip ID missing")
            return
        }
        
        db.collection("trips").document(tripID).delete() { err in
            if let err = err {
                print("Error removing trip: \(err)")
            } else {
                print("Trip \(tripID) successfully deleted.")
            }
        }
    }
}
