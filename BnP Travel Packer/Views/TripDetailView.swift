//
//  TripDetailView.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/10.
//

import SwiftUI

struct TripDetailView: View {
    @ObservedObject private var tripDetailViewModel: TripDetailViewModel
    @State private var newItem: String = ""
    
       
       init(trip: Trip) {
           self.tripDetailViewModel = TripDetailViewModel(trip: trip)
       }
    
    
    
    
    
    var body: some View {
        ZStack {
            VStack {
                TitleRow()
                HStack(spacing: 20) {
                    Text("Your trip to... \(tripDetailViewModel.trip.destination)!")
                        .bold()
                        .font(.system(size: 22))
                        .foregroundColor(Color("AccentColor"))
                    
                }
                .frame(height: 80)
                //create logic regarding bags, carry-ons can fit up to 5 days of clothing with no overlaps
                //shoes (3), 4 (tops), 2 (pants), two (jackets), 4 (accessories)
                //
                
                DatePicker("Departure Date:", selection:$tripDetailViewModel.trip.startDate, displayedComponents: .date)
                DatePicker("Return Date:", selection:$tripDetailViewModel.trip.endDate, displayedComponents: .date)
                
                List { 
                    //                    // Things to pack list section
                    Section("Items to Pack in Bag") {
                        TextField("Add an items to your bag!", text: $newItem)
                            .onSubmit {
                                print("Submitting!")
                                tripDetailViewModel.addItem(item: newItem)
                                newItem = ""
                                
                            }
                            .submitLabel(.done)
                    }
                    ForEach(tripDetailViewModel.trip.items, id: \.self) { item in
                        HStack {
                            Button {
                                print("packed!")
                            } label: {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                    .foregroundColor(Color("sunsetOrange"))
                            }
                            
                            Text(item)
                                .foregroundColor(Color("Flare"))
                            Spacer()
                            Button {
                                tripDetailViewModel.removeItem(item: item)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                    .foregroundColor(Color("UnselectedTabColor"))
                            }
                        }
                    }

                        
                    }
                }
            }
            
            .background(Color("backgroundColor"))
            .listStyle(SidebarListStyle())
            .frame(minHeight: 400)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                
            }
        }
        
    }
    
    
    
    struct TripDetailView_Previews: PreviewProvider {
        static var previews: some View {
            TripDetailView(trip: Trip(id: "1",
                                      bags: 0,
                                      destination: "Paris, France", items: ["shirt", "pants"],
                                      name: "Ada",
                                      startDate: Date(),
                                      endDate: Date()
                                     ))
            .environmentObject(TripManager())
        }
    }
    

