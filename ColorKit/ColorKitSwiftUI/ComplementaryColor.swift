//
//  ComplementaryColor.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension Color {
    /// Computes the complementary color of the current color instance.
    /// Complementary colors are opposite on the color wheel.
    @available(iOS 15.0, *)
    public var complementaryColor: Color {
        Color(nativeColor: self.nativeColor.complementaryColor)
    }
}
