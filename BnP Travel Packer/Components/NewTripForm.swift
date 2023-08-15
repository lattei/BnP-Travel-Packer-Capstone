//
//  NewTripForm.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/08.
//

import SwiftUI
    
struct NewTripForm: View {
    //    var bags: Int
    //    var carryOn: Bool
    //    var destination: String
    //    var essentialItems: Array<Any>
    //    var items: Array<Any>
    //    var name: String
    //    var personalBag: String
    //    var startDate: Date
    //    var endDate: Date
    
    @EnvironmentObject var tripManager: TripManager
    @State  var selectStartDate = Date.now
    @State  var selectEndDate = Date.now
    @State  var name: String = ""
    @State  var destination: String = ""
    @State  var bags: Int = 0
    @State  var items: [String]
    private var maximumEndDate: Date {
            Calendar.current.date(byAdding: .day, value: 30, to: selectStartDate) ?? Date()
        }
    @ObservedObject var locationService: LocationService

    
//    @State private var essentialItems = [String]()
//    @State private var items = [String]()
    //@State private var carryOn: Bool = false
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                Form {
                    
                    Section(header: Text("Name")) {
                        TextField("Enter your name", text: $name)
                        
                    }
                    
                    Section {
                        DatePicker("Departure Date:", selection: $selectStartDate, displayedComponents: .date)
                        
                        DatePicker("Return Date:", selection: $selectEndDate, displayedComponents: .date)
                                .disabled(Calendar.current.compare(selectStartDate, to: maximumEndDate, toGranularity: .day) == .orderedSame)
                        
                    }
                    
                    Section(header: Text("Any checked bags?")) {
                        Stepper("Number of bags: \(bags)", value: $bags, in: 0...5)
                        
                    }
                    
                    
                    Section(header: Text("Destination")) {
                        ZStack(alignment: .trailing) {
                            TextField("Enter your destination", text: $locationService.queryFragment)
                            // This is optional and simply displays an icon during an active search
                            if locationService.status == .isSearching {
                                Image(systemName: "clock")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    Section(header: Text("Results")) {
                        List {
                            
                            ForEach(locationService.searchResults, id: \.self) { completionResult in
//                                NavigationLink(destination: ConfirmationView() ) {
//                                    Text(completionResult.title)
                                    Button {
                                    tripManager.addTrip(startDate: selectStartDate, endDate: selectEndDate, destination: completionResult.title, name: name, bags: bags, items: ["passport", "phone", "wallet"])
                                } label: {
                                    Text(completionResult.title)
                                }
                            }
                        }
                    }
                    
                        
                        Section() {
                            NavigationLink {
                                ContentView(tripManager: TripManager())
                            } label: {
                                Text("See you on your trip!")
                            }
                        }
                    }
                
                

                
//                Section {
//                    Picker("Select your personal bag:", selection: $selectedPersonalBag, content: {
//                        ForEach(personalBag, id: \.self, content: {bag in Text(bag)
//
//                        })
//                    })
//                }
                
//                Section {
//                    Toggle("Are you bringing a carry-on?", isOn: Binding<Bool>.constant(false).animation())
//                }
                
                
                
               
                

            }
            
            .navigationTitle(Text("Create a New Trip"))
            }
        }
    }

struct NewTripForm_Previews: PreviewProvider {
    static var previews: some View {
        NewTripForm(items: [], locationService: LocationService()).environmentObject(TripManager())
            
            }
        }
