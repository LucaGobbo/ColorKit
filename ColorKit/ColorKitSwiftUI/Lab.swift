//
//  Lab.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//
import ColorKit
import SwiftUI

extension Color {

    /// The L* value of the CIELAB color space.
    /// L* represents the lightness of the color from 0 (black) to 100 (white).
    @available(iOS 14.0, *)
    public var L: CGFloat {
        let Lab = LabCalculator.convert(RGB: self.rgb)
        return Lab.L
    }

    /// The a* value of the CIELAB color space.
    /// a* represents colors from green to red.
    @available(iOS 14.0, *)
    public var a: CGFloat {
        let Lab = LabCalculator.convert(RGB: self.rgb)
        return Lab.a
    }

    /// The b* value of the CIELAB color space.
    /// b* represents colors from blue to yellow.
    @available(iOS 14.0, *)
    public var b: CGFloat {
        let Lab = LabCalculator.convert(RGB: self.rgb)
        return Lab.b
    }


}
