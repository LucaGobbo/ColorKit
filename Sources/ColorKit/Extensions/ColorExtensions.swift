//
//  ColorExtensions.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

extension CIColor {
    public convenience init(nativeColor: NativeColor) {
        #if canImport(UIKit)
            self.init(color: nativeColor)
        #elseif canImport(AppKit)

            self.init(cgColor: nativeColor.cgColor)
        #endif
    }

}

extension CIColor {
    public convenience init?(color: Color) {
        self.init(nativeColor: NativeColor(color))
    }
}
