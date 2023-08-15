//
//  Extensions.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/07/28.
//

import Foundation
import SwiftUI

extension Text {
    func ourTitle() -> some View {
        self.font(.custom("Travel November", size: 28))
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
