//
//  HeaderView.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Header")
            .font(.system(size: 50))
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.orange)
            .border(Color.black, width: 2)
    }
}

#Preview {
    HeaderView()
}
