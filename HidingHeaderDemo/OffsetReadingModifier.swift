//
//  OffsetReadingModifier.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct OffsetReadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader(content: { geometry in
                    Color.clear
                        .preference(key: ScrollingOffsetKey.self, value: -geometry.frame(in: .named("scroll")).origin.y)
                        .preference(key: TotalContentHeightKey.self, value: geometry.size.height)
                })
            )
    }
}

extension View {
    func trackScrollingOffset() -> some View {
        modifier(OffsetReadingModifier())
    }
}
