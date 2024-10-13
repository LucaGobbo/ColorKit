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
    @available(tvOS 15.0, *)
    public var complementaryColor: Color {
        Color(
            red: (255.0 - red255) / 255.0,
            green: (255.0 - green255) / 255.0,
            blue: (255.0 - blue255) / 255.0,
            opacity: alpha)
    }

   

}
