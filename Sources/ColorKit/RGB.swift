//
//  RGB.swift
//  ColorKit
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit

#endif

package struct RGB {
    package let R: CGFloat
    package let G: CGFloat
    package let B: CGFloat

    package init(R: CGFloat, G: CGFloat, B: CGFloat) {
        self.R = R
        self.G = G
        self.B = B
    }
}

extension NativeColor {

    // MARK: - Public

    /// The red (R) channel of the RGB color space as a value from 0.0 to 1.0.
    public var red: CGFloat {
        CIColor(nativeColor: self)?.red ?? 0
    }

    /// The green (G) channel of the RGB color space as a value from 0.0 to 1.0.
    public var green: CGFloat {
        CIColor(nativeColor: self)?.green ?? 0
    }

    /// The blue (B) channel of the RGB color space as a value from 0.0 to 1.0.
    public var blue: CGFloat {
        CIColor(nativeColor: self)?.blue ?? 0
    }

    /// The alpha (a) channel of the RGBa color space as a value from 0.0 to 1.0.
    public var alpha: CGFloat {
        CIColor(nativeColor: self)?.alpha ?? 0
    }

    // MARK: Internal

    var red255: CGFloat {
        self.red * 255.0
    }

    var green255: CGFloat {
        self.green * 255.0
    }

    var blue255: CGFloat {
        self.blue * 255.0
    }

    var rgb: RGB {
        return RGB(R: self.red, G: self.green, B: self.blue)
    }

}
