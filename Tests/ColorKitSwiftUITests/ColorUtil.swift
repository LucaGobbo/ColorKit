//
//  ColorUtil.swift
//  ColorKit
//
//  Created by Luca on 12/10/2024.
//

import SwiftUI

extension Color {
    static func red() -> Color {
        Color(red: 1, green: 0, blue: 0, opacity: 1)
    }

    static func green() -> Color {
        Color(red: 0, green: 1, blue: 0, opacity: 1)
    }

    static func blue() -> Color {
        Color(red: 0, green: 0, blue: 1, opacity: 1)
    }

    static func white() -> Color {
        Color(red: 1, green: 1, blue: 1, opacity: 1)
    }

    static func black() -> Color {
        Color(red: 0, green: 0, blue: 1, opacity: 1)
    }
}

func areFloatsEqual(_ a: CGFloat, _ b: CGFloat, accuracy: CGFloat) -> Bool {
    return abs(a - b) <= accuracy
}
