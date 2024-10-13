//
//  DominantColorQualityTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 5/30/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

@Suite(.tags(.image, .colors, .kit))
struct DominantColorQualityTests {

    /// It should return the exact same size (original size) if the quality is set to best.
    @Test func bestQuality() {
        let quality = NativeImage.DominantColorQuality.best
        let originalSize = CGSize(width: CGFloat.random(in: 0...10000), height: CGFloat.random(in: 0...10000))
        let targetSize = quality.targetSize(for: originalSize)

        #expect(targetSize == originalSize)
    }

    /// It should return the exact same size (original size) if the original size is smaller than the size we're trying to reach.
    @Test func lowerArea() {
        let quality = NativeImage.DominantColorQuality.fair
        let originalSize = CGSize(width: 1, height: 1)
        let targetSize = quality.targetSize(for: originalSize)

        #expect(targetSize == originalSize)
    }

}
