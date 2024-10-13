//
//  XYZ.swift
//  ColorKit
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import SwiftUI
import ColorKit

extension Color {

    /// The X value of the XYZ color space.
    @available(iOS 14.0, *)
    public var X: CGFloat {
        let XYZ = XYZCalculator.convert(rgb: self.rgb)
        return XYZ.X
    }

    /// The Y value of the XYZ color space.
    @available(iOS 14.0, *)
    public var Y: CGFloat {
        let XYZ = XYZCalculator.convert(rgb: self.rgb)
        return XYZ.Y
    }

    /// The Z value of the XYZ color space.
    @available(iOS 14.0, *)
    public var Z: CGFloat {
        let XYZ = XYZCalculator.convert(rgb: self.rgb)
        return XYZ.Z
    }

}
