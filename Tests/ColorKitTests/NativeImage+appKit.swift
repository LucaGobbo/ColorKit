//
//  NativeImage+bundleInit.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

@testable import ColorKit

#if canImport(AppKit)

    import AppKit

    extension NativeImage {
        convenience init?(named: String, in bundle: Bundle, compatibleWith _: String?) {
            if #available(macOS 14.0, *) {
                self.init(resource: ImageResource(name: named, bundle: bundle))
            } else {
                return nil
            }
        }
    }

#endif



extension NativeColor {
    static func red() -> NativeColor {
        NativeColor(red: 1, green: 0, blue: 0, alpha: 1)
    }

    static func green() -> NativeColor {
        NativeColor(red: 0, green: 1, blue: 0, alpha: 1)
    }

    static func blue() -> NativeColor {
        NativeColor(red: 0, green: 0, blue: 1, alpha: 1)
    }
}
