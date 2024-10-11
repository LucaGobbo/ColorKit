//
//  ColorPalette.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension ColorPalette {

    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public init?(orderedColors: [Color], darkBackground: Bool = true, ignoreContrastRatio: Bool = false) {
        self.init(
            orderedColors: orderedColors.map { $0.nativeColor },
            darkBackground: darkBackground,
            ignoreContrastRatio: ignoreContrastRatio
        )
    }

    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public init?(colors: [Color], darkBackground: Bool = true, ignoreContrastRatio: Bool = false) {
        self.init(
            orderedColors: colors.map { $0.nativeColor },
            darkBackground: darkBackground,
            ignoreContrastRatio: ignoreContrastRatio
        )
    }
}
