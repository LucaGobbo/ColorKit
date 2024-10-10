//
//  ContrastRatio.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension Color {

    /// Computes the contrast ratio between the current color instance, and the one passed in.
    /// Contrast ratios can range from 1 to 21 (commonly written 1:1 to 21:1).
    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public func contrastRatio(with color: Color) -> NativeColor.ContrastRatioResult {
        let myColor = self.nativeColor
        let nativeColor = color.nativeColor
        return myColor.contrastRatio(with: nativeColor)
    }
}
