//
//  ContentView.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/07/27.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                GradientAnimation(hueAdjust: true)
                VStack(spacing: 40) {
                    
                    VStack(spacing: 20) {
                        Text("Travel Packer")
                            .font(.title).bold()
                        Text("'Neither business, nor pleasure'")
                            .font(.caption)
                        Text("Let's Get Packing!")
                            .ourTitle()
                        Text("Get all set for your next adventure!")
                            .foregroundColor(Color("AccentColor"))
                        //                    NavigationLink(destination: BottomTabView()) {
                        //                            Text("Start")
                        //                    }
                        //                    .buttonStyle(.bordered)
                    }
                    
                    NavigationLink {
                        BottomTabView()
                    } label: {
                        PrimaryButton(text: "Start!")
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
//            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
            }
            
            
        }
    }
    
    struct TestView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
}
