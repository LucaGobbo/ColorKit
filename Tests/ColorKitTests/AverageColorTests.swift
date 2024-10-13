//
//  AverageColorTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 5/15/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#endif

@Suite(.tags(.colors, .kit))
struct AverageColorTests {
    static let tolerance: CGFloat = 0.5

    /// It should compute a green average color for a green image.
    @Test func greenImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Green_Square.jpg", in: bundle, compatibleWith: nil)!
        let averageColor = try image.averageColor()

        let distance = averageColor.difference(from: NativeColor.green())
        #expect(distance.associatedValue < AverageColorTests.tolerance)
    }

    /// It should compute a purple average color for a purple image.
    @Test func purpleImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Purple_Square.jpg", in: bundle, compatibleWith: nil)!
        let averageColor = try image.averageColor()

        let expectedPurple = NativeColor(red: 208.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        let distance = averageColor.difference(from: expectedPurple)
        #expect(distance.associatedValue < AverageColorTests.tolerance)
    }

    /// It should compute a gray average color for a black & white image.
    @Test func blackWhiteImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Black_White_Square.jpg", in: bundle, compatibleWith: nil)!
        let averageColor = try image.averageColor()

        let expectedGray = NativeColor(red: 188.0 / 255.0, green: 188.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
        let distance = averageColor.difference(from: expectedGray)
        #expect(distance.associatedValue < AverageColorTests.tolerance)
    }
}
