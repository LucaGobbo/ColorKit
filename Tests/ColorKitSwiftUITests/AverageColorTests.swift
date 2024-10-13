//
//  AverageColorTests.swift
//  ColorKit
//
//  Created by Luca on 12/10/2024.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#endif

@MainActor
@Suite(.tags(.colors, .swiftUI))
struct AverageColorTests {
    static let tolerance: CGFloat = 0.5

    @MainActor
    struct Native {
        /// It should compute a green average color for a green image.
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func greenImage() throws {
            let bundle = Bundle.module
            let nativeImage = try #require(NativeImage(named: "Green_Square.jpg", in: bundle, compatibleWith: nil))
            let image = Image(nativeImage: nativeImage)
            let averageColor = try image.averageColor()

            let distance = averageColor.difference(from: Color.green())
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }

        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        /// It should compute a purple average color for a purple image.
        @Test func purpleImage() throws {
            let bundle = Bundle.module
            let nativeImage = try #require(NativeImage(named: "Purple_Square.jpg", in: bundle, compatibleWith: nil))
            let image = Image(nativeImage: nativeImage)
            let averageColor = try image.averageColor()

            let expectedPurple = Color(red: 208.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, opacity: 1.0)
            let distance = averageColor.difference(from: expectedPurple)
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }

        /// It should compute a gray average color for a black & white image.
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func blackWhiteImage() throws {
            let bundle = Bundle.module
            let image = try #require(NativeImage(named: "Black_White_Square.jpg", in: bundle, compatibleWith: nil)!)
            let averageColor = try Image(nativeImage: image).averageColor()

            let expectedGray = Color(red: 188.0 / 255.0, green: 188.0 / 255.0, blue: 188.0 / 255.0, opacity: 1.0)
            let distance = averageColor.difference(from: expectedGray)
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }
    }

    @MainActor
    struct SwiftUIImage {
        /// It should compute a green average color for a green image.
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func greenImage() throws {

            let image = Image(.greenSquare)
            let averageColor = try image.averageColor()

            let distance = averageColor.difference(from: Color.green())
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }

        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        /// It should compute a purple average color for a purple image.
        @Test func purpleImage() throws {

            let image = Image(.purpleSquare)
            let averageColor = try image.averageColor()

            let expectedPurple = Color(red: 208.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, opacity: 1.0)
            let distance = averageColor.difference(from: expectedPurple)
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }

        /// It should compute a gray average color for a black & white image.
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func blackWhiteImage() throws {
            let image = Image(.blackWhiteSquare)
            let averageColor = try image.averageColor()

            let expectedGray = Color(red: 188.0 / 255.0, green: 188.0 / 255.0, blue: 188.0 / 255.0, opacity: 1.0)
            let distance = averageColor.difference(from: expectedGray)
            #expect(distance.associatedValue < AverageColorTests.tolerance)
        }
    }
}
