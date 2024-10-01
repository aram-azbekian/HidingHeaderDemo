//
//  ContentView.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingHeader: Bool = true
    @State private var rollingWindowHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                if isShowingHeader {
                    HeaderView()
                }
                SomeScrollView(isShowingHeader: $isShowingHeader, rollingWindowHeight: rollingWindowHeight)
            }
            .onAppear(perform: {
                rollingWindowHeight = geo.size.height
            })
        }
    }
}

#Preview {
    ContentView()
}
