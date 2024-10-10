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

extension Color {

    @available(iOS 15.0, *)
    public init(nativeColor: NativeColor) {
        #if canImport(UIKit)
            self.init(uiColor: nativeColor)
        #elseif canImport(AppKit)
            self.init(nsColor: nativeColor)
        #else
            self = nativeColor
        #endif
    }

    @available(iOS 14.0, *)
    public var nativeColor: NativeColor? {
        #if canImport(UIKit)
            guard let cgColor else { return nil }
            return UIColor(cgColor: cgColor)

        #elseif canImport(AppKit)
            guard let cgColor else { return nil }
            return NSColor(cgColor: cgColor)
        #else
            return self
        #endif
    }
}

extension CIColor {
    public convenience init?(nativeColor: NativeColor) {
        #if canImport(UIKit)
            self.init(color: nativeColor)
        #elseif canImport(AppKit)
            self.init(color: nativeColor)
        #else
            return nil
        #endif
    }
}
