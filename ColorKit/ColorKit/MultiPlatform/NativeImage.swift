//
//  NativeImage.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

#if canImport(UIKit)
    public import UIKit
#elseif canImport(AppKit)
    public import AppKit
#else
    public import SwiftUI
#endif

#if canImport(UIKit)
    public typealias NativeImage = UIImage
#elseif canImport(AppKit)

    public typealias NativeImage = NSImage

    extension CIImage {
        public convenience init?(image nativeImage: NativeImage) {
            guard let data = nativeImage.tiffRepresentation,
                let bitmap = NSBitmapImageRep(data: data)
            else {
                return nil
            }
            self.init(bitmapImageRep: bitmap)
        }
    }

#else
    public typealias NativeImage = Image
#endif
