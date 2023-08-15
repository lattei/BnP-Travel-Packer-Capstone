//
//  Title.swift
//  BnP Travel Packer
//
//  Created by Carline Senat on 2023/08/08.
//

import SwiftUI

struct TitleRow: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("Travel Packer")
                .font(.title).bold()
                .frame(maxWidth: .infinity)
            Text("neither business nor pleasure")
                .font(.caption)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("backgroundColor"))
    }
}
