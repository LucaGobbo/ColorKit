//
//  Untitled.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension CIColor {
    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public convenience init?(color: Color) {
        self.init(nativeColor: color.nativeColor)
    }
}

extension Color {

    @available(iOS 15.0, *)
    @available(tvOS 15.0, *)
    public init(nativeColor: NativeColor) {
        #if canImport(UIKit)
            self.init(uiColor: nativeColor)
        #elseif canImport(AppKit)
            self.init(nsColor: nativeColor)
        #else
            self = nativeColor
        #endif
    }

    /// get back the `NativeColor`
    ///
    /// on iOS it's an `UIImage`, on macOS it's an `NSImage`
    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public var nativeColor: NativeColor {
        #if canImport(UIKit)
            guard let cgColor else { return NativeColor.black }
            return UIColor(cgColor: cgColor)
        #elseif canImport(AppKit)
            guard let cgColor else { return NativeColor.black }
            guard let color = NSColor(cgColor: cgColor) else {
                return NativeColor.black
            }
            return color
        #else
            return self
        #endif
    }
}

extension NativeColor {
    /// converts a `NativeColor` into a SwiftUI `Color`
    @available(iOS 15.0, *)
    @available(tvOS 15.0, *)
    public var color: Color {
        return Color(nativeColor: self)
    }
}
