//
//  SomeScrollView.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct SomeScrollView: View {
    @Binding var isShowingHeader: Bool

    private let threshold: CGFloat = 20
    @State private var lastOffset: CGFloat = .zero

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(0...100, id: \.self) { num in
                    Text("\(num)")
                        .font(.system(size: 35))
                }
            }
            .trackScrollingOffset()
            .onPreferenceChange(ScrollingOffsetKey.self, perform: { value in
                processOffsetChange(value)
            })
        }
        .coordinateSpace(name: "scroll")
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
    }

    private func processOffsetChange(_ value: CGFloat) {
        print(value)

        let currentDifference = lastOffset - value
        guard abs(currentDifference) > threshold else { return }

        if currentDifference < 0 {
            if isShowingHeader {
                isShowingHeader = false
            }
        } else {
            if !isShowingHeader {
                isShowingHeader = true
            }
        }

        lastOffset = value
    }
}

#Preview {
    SomeScrollView(isShowingHeader: .constant(true))
}
