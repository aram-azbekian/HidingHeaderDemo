//
//  ScrollingOffsetKey.swift
//  HidingHeaderDemo
//
//  Created by Арам on 29.09.2024.
//

import SwiftUI

struct ScrollingOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
