//
//  Trip.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/01.
//

import Foundation
import FirebaseFirestoreSwift

struct Trip: Identifiable, Codable {
    @DocumentID var id: String?
    var bags: Int
    //var carryOn: Bool
    var destination: String
//    let essentialItems = [String]()
    var items: [String]
    var name: String
//    let personalBag = ["Purse", "Backpack", "Duffle", "Tote", "Briefcase"]
    var startDate: Date
    var endDate: Date
    // having an item model and having just a list of Item, like so [var items: [ItemModel]
    //ItemModel having var of name and quantity, bool isChecked
    //
    
    func formatEntryDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: Date())
        return dateFormatter.string(from: startDate);
    }
    
}
