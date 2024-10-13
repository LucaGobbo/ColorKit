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
        let c = NativeColor(color)
        self.init(nativeColor: c)
    }
}




extension Color {

   
    /// get back the `NativeColor`
    ///
    /// on iOS it's an `UIImage`, on macOS it's an `NSImage`
    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    public var nativeColor: NativeColor {
        return NativeColor(self)
    }
}

extension NativeColor {
    /// converts a `NativeColor` into a SwiftUI `Color`
    @available(iOS 15.0, *)
    @available(tvOS 15.0, *)
    public var color: Color {
        Color(self)
    
    }
}
