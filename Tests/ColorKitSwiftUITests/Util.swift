//
//  Util.swift
//  ColorKit
//
//  Created by Luca on 13/10/2024.
//

import ColorKit
import SwiftUI
import Testing

extension Color {
    @available(iOS 14.0, *)
    static func === (lhs: Color, rhs: Color) -> Bool {
        return lhs.isEqualTo(rhs)
    }

    @available(iOS 14.0, *)
    static func === (lhs: Color?, rhs: Color) -> Bool {
        guard let lhs else { return false }
        return lhs.isEqualTo(rhs)
    }

    @available(iOS 14.0, *)
    func isEqualTo(_ otherColor: Color, source _: SourceLocation = #_sourceLocation) -> Bool {
        // Compare RGBA values with a tolerance for floating-point precision
        let tolerance: CGFloat = 0.001

        let isRedEqual = areFloatsEqual(red, otherColor.red, accuracy: tolerance)
        let isGreenEqual = areFloatsEqual(green, otherColor.green, accuracy: tolerance)
        let isBlueEqual = areFloatsEqual(blue, otherColor.blue, accuracy: tolerance)
        let isAlphaEqual = areFloatsEqual(opacity, otherColor.opacity, accuracy: tolerance)

        return isRedEqual && isGreenEqual && isBlueEqual && isAlphaEqual
    }
}
