//
//  ContentView.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingHeader: Bool = true

    var body: some View {
        VStack {
            if isShowingHeader {
                HeaderView()
            }
            SomeScrollView(isShowingHeader: $isShowingHeader)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
