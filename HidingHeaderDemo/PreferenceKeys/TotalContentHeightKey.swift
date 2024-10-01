//
//  TotalContentHeightKey.swift
//  HidingHeaderDemo
//
//  Created by Арам on 01.10.2024.
//

import SwiftUI

struct TotalContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
