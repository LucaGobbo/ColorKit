//
//  DominantColorsTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 5/19/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@MainActor
@Suite(.tags(.colors, .image, .swiftUI))
struct DominantColorsTests {

    @MainActor
    struct Native {

        func check(color: Color, red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, accuracy: CGFloat = 0) -> Bool
        {

            areFloatsEqual(color.red, red, accuracy: accuracy) && areFloatsEqual(color.green, green, accuracy: accuracy)
                && areFloatsEqual(color.blue, blue, accuracy: accuracy)
                && areFloatsEqual(color.opacity, 1, accuracy: accuracy)

        }

        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func greenImage() throws {
            let bundle = Bundle.module
            let image = try #require(NativeImage(named: "Green_Square.jpg", in: bundle, compatibleWith: nil))
            let view = Image(nativeImage: image)
            let dominantColors = try view.dominantColorFrequencies(with: .best)

            #expect(dominantColors.count == 1)
            let distance = try #require(
                dominantColors.first?.color.difference(from: Color.green()),
                "Could not get distance from dominant color.")
            #expect(distance.associatedValue < AverageColorTests.tolerance)
            #expect(dominantColors.first?.frequency == 1.0)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func blackWhiteImage() throws {
            let bundle = Bundle.module
            let image = NativeImage(named: "Black_White_Square.jpg", in: bundle, compatibleWith: nil)!
            let view = Image(nativeImage: image)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 2)
            #expect(dominantColors.contains(where: { color in check(color: color) }))
            #expect(dominantColors.contains(where: { check(color: $0, red: 1, green: 1, blue: 1) }))

            verifySorted(colorsFrequencies: colorFrequencies)

            #expect(colorFrequencies.first?.frequency == 0.5)
            #expect(colorFrequencies[1].frequency == 0.5)
        }

        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenImage() throws {
            let bundle = Bundle.module
            let image = NativeImage(named: "Red_Green_Blue.png", in: bundle, compatibleWith: nil)!
            let view = Image(nativeImage: image)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 3)
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0, accuracy: 0.1)
                }))
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0, accuracy: 0.1)
                }))
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1, accuracy: 0.1)
                }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenBlack() throws {
            let bundle = Bundle.module
            let image = NativeImage(named: "Red_Green_Blue_Black_Mini.png", in: bundle, compatibleWith: nil)!
            let view = Image(nativeImage: image)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 4)
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1) }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenRandom() throws {
            let bundle = Bundle.module
            let image = NativeImage(named: "Red_Green_Blue_Random_Mini.png", in: bundle, compatibleWith: nil)!
            let view = Image(nativeImage: image)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1) }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        private func verifySorted(colorsFrequencies: [ColorFrequency<Color>]) {
            var previousCount: CGFloat?

            colorsFrequencies.forEach { (colorFrequency) in
                guard let oldCount = previousCount else {
                    previousCount = colorFrequency.frequency
                    return
                }

                #expect(oldCount >= colorFrequency.frequency, "The order of the color frenquecy is not correct.")

                previousCount = colorFrequency.frequency
            }
        }

    }

    @MainActor
    struct SwiftUIImage {

        func check(color: Color, red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, accuracy: CGFloat = 0) -> Bool
        {

            areFloatsEqual(color.red, red, accuracy: accuracy) && areFloatsEqual(color.green, green, accuracy: accuracy)
                && areFloatsEqual(color.blue, blue, accuracy: accuracy)
                && areFloatsEqual(color.opacity, 1, accuracy: accuracy)

        }

        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func greenImage() throws {

            let view = Image(.greenSquare)
            let dominantColors = try view.dominantColorFrequencies(with: .best)

            #expect(dominantColors.count == 1)
            let distance = try #require(
                dominantColors.first?.color.difference(from: Color.green()),
                "Could not get distance from dominant color.")
            #expect(distance.associatedValue < AverageColorTests.tolerance)
            #expect(dominantColors.first?.frequency == 1.0)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func blackWhiteImage() throws {

            let view = Image(.blackWhiteSquare)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 2)
            #expect(dominantColors.contains(where: { color in check(color: color) }))
            #expect(dominantColors.contains(where: { check(color: $0, red: 1, green: 1, blue: 1) }))

            verifySorted(colorsFrequencies: colorFrequencies)

            #expect(colorFrequencies.first?.frequency == 0.5)
            #expect(colorFrequencies[1].frequency == 0.5)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenImage() throws {

            let view = Image(.redGreenBlue)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 3)
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0, accuracy: 0.1)
                }))
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0, accuracy: 0.1)
                }))
            #expect(
                dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1, accuracy: 0.1)
                }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenBlack() throws {
            let view = Image(.redGreenBlueBlackMini)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.count == 4)
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1) }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        @Test func redBlueGreenRandom() throws {
            let view = Image(.redGreenBlueRandomMini)
            let colorFrequencies = try view.dominantColorFrequencies(with: .best)
            let dominantColors = colorFrequencies.map({ $0.color })

            #expect(dominantColors.contains(where: { color in check(color: color, red: 1, green: 0, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 1, blue: 0) }))
            #expect(dominantColors.contains(where: { color in check(color: color, red: 0, green: 0, blue: 1) }))
            verifySorted(colorsFrequencies: colorFrequencies)
        }
        @available(iOS 16.0, *)
        @available(tvOS 16.0, *)
        private func verifySorted(colorsFrequencies: [ColorFrequency<Color>]) {
            var previousCount: CGFloat?

            colorsFrequencies.forEach { (colorFrequency) in
                guard let oldCount = previousCount else {
                    previousCount = colorFrequency.frequency
                    return
                }

                #expect(oldCount >= colorFrequency.frequency, "The order of the color frenquecy is not correct.")

                previousCount = colorFrequency.frequency
            }
        }

    }

}
