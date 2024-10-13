//
//  ImageExtensions.swift
//  ColorKit
//
//  Created by Boris Emorine on 5/30/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

extension NativeImage {
    var resolution: CGSize {
        #if canImport(UIKit)
            return CGSize(width: size.width * scale, height: size.height * scale)
        #elseif canImport(AppKit)
            return CGSize(width: size.width, height: size.height)
        #endif
    }

    #if canImport(UIKit)
        func resize(to targetSize: CGSize) -> NativeImage {
            guard targetSize != resolution else { return self }

            let format = UIGraphicsImageRendererFormat()
            format.scale = 1
            format.opaque = true
            let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
            let resizedImage = renderer.image { _ in
                self.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))
            }

            return resizedImage
        }

    #elseif canImport(AppKit)
        func resize(to targetSize: CGSize) -> NativeImage {
            guard targetSize != size else {
                return self
            }

            let newImage = NSImage(size: targetSize)
            newImage.lockFocus()
            let context = NSGraphicsContext.current
            context?.imageInterpolation = .high
            draw(
                in: NSRect(origin: .zero, size: targetSize),
                from: NSRect(origin: .zero, size: size),
                operation: .copy,
                fraction: 1.0
            )
            newImage.unlockFocus()

            return newImage
        }
    #endif
}

public extension Image {
    init(nativeImage: NativeImage) {
        #if canImport(UIKit)
            self.init(uiImage: nativeImage)
        #elseif canImport(AppKit)
            self.init(nsImage: nativeImage)
        #endif
    }
}
