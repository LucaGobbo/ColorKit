//
//  RGB.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension Color {

    /// The red (R) channel of the RGB color space as a value from 0.0 to 1.0.
    @available(iOS 14.0, *)
    public var red: CGFloat {
        CIColor(color: self)?.red ?? 0
    }

    /// The green (G) channel of the RGB color space as a value from 0.0 to 1.0.
    @available(iOS 14.0, *)
    public var green: CGFloat {
        CIColor(color: self)?.green ?? 0
    }

    /// The blue (B) channel of the RGB color space as a value from 0.0 to 1.0.
    @available(iOS 14.0, *)
    public var blue: CGFloat {
        CIColor(color: self)?.blue ?? 0
    }

    /// The alpha (a) channel of the RGBa color space as a value from 0.0 to 1.0.
    @available(iOS 14.0, *)
    public var alpha: CGFloat {
        CIColor(color: self)?.alpha ?? 0
    }

    @available(iOS 14.0, *)
    var rgb: RGB {
        RGB(R: self.red, G: self.green, B: self.blue)
    }
}
