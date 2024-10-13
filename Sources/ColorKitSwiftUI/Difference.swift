//
//  Comparison.swift
//  ColorKit
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import ColorKit
import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

extension Color {

    public typealias DeltaEFormula = NativeColor.DeltaEFormula
    public typealias ColorDifferenceResult = NativeColor.ColorDifferenceResult
    /// Computes the difference between the passed in `NativeColor` instance.
    ///
    /// - Parameters:
    ///   - color: The color to compare this instance to.
    ///   - formula: The algorithm to use to make the comparaison.
    /// - Returns: The different between the passed in `NativeColor` instance and this instance.
    @available(iOS 14.0, *)
    public func difference(from color: Color, using formula: DeltaEFormula = .CIE94) -> ColorDifferenceResult {
        return self.nativeColor.difference(from: color.nativeColor, using: formula)
    }

   

}
