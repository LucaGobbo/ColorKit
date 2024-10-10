//
//  RelativeLuminance.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension Color {
    /// Computes the relative luminance of the color.
    /// This assume that the color is using the sRGB color space.
    /// This is the relative brightness, normalized where 0 is black and 1 is white.
    @available(iOS 14.0, *)
    public var relativeLuminance: CGFloat {
        nativeColor.relativeLuminance
    }
}
