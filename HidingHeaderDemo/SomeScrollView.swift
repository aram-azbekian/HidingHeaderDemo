//
//  SomeScrollView.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct SomeScrollView: View {
    @Binding var isShowingHeader: Bool
    let rollingWindowHeight: CGFloat

    private let threshold: CGFloat = 20
    @State private var lastOffset: CGFloat = .zero
    @State private var totalHeight: CGFloat = .zero

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
            .onPreferenceChange(TotalContentHeightKey.self, perform: { value in
                totalHeight = value
            })
        }
        .coordinateSpace(name: "scroll")
    }

    private func processOffsetChange(_ value: CGFloat) {
        print(value)

        guard value >= 0 && value + rollingWindowHeight <= totalHeight else { return }

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
