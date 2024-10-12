//
//  DominantColorsTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 5/19/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#endif

@Suite(.tags(.colors, .image))
struct DominantColorsTests {

    @Test func greenImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Green_Square.jpg", in: bundle, compatibleWith: nil)!
        let dominantColors = try image.dominantColorFrequencies(with: .best)

        #expect(dominantColors.count == 1)
        let distance = try #require(
            dominantColors.first?.color.difference(from: NativeColor.green()),
            "Could not get distance from dominant color.")
        #expect(distance.associatedValue < AverageColorTests.tolerance)
        #expect(dominantColors.first?.frequency == 1.0)
    }

    @Test func blackWhiteImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Black_White_Square.jpg", in: bundle, compatibleWith: nil)!
        let colorFrequencies = try image.dominantColorFrequencies(with: .best)
        let dominantColors = colorFrequencies.map({ $0.color })

        #expect(dominantColors.count == 2)
        #expect(dominantColors.contains(NativeColor(red: 0, green: 0, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 1, green: 1, blue: 1, alpha: 1)))
        verifySorted(colorsFrequencies: colorFrequencies)

        #expect(colorFrequencies.first?.frequency == 0.5)
        #expect(colorFrequencies[1].frequency == 0.5)
    }

    @Test func redBlueGreenImage() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Red_Green_Blue.png", in: bundle, compatibleWith: nil)!
        let colorFrequencies = try image.dominantColorFrequencies(with: .best)
        let dominantColors = colorFrequencies.map({ $0.color })

        #expect(dominantColors.count == 3)
        #expect(dominantColors.contains(NativeColor(red: 1, green: 0, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 1, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 0, blue: 1, alpha: 1)))
        verifySorted(colorsFrequencies: colorFrequencies)
    }

    @Test func redBlueGreenBlack() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Red_Green_Blue_Black_Mini.png", in: bundle, compatibleWith: nil)!
        let colorFrequencies = try image.dominantColorFrequencies(with: .best)
        let dominantColors = colorFrequencies.map({ $0.color })

        #expect(dominantColors.count == 4)
        #expect(dominantColors.contains(NativeColor(red: 0, green: 0, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 1, green: 0, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 1, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 0, blue: 1, alpha: 1)))
        verifySorted(colorsFrequencies: colorFrequencies)
    }

    @Test func redBlueGreenRandom() throws {
        let bundle = Bundle.module
        let image = NativeImage(named: "Red_Green_Blue_Random_Mini.png", in: bundle, compatibleWith: nil)!
        let colorFrequencies = try image.dominantColorFrequencies(with: .best)
        let dominantColors = colorFrequencies.map({ $0.color })

        #expect(dominantColors.contains(NativeColor(red: 1, green: 0, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 1, blue: 0, alpha: 1)))
        #expect(dominantColors.contains(NativeColor(red: 0, green: 0, blue: 1, alpha: 1)))
        verifySorted(colorsFrequencies: colorFrequencies)
    }

    private func verifySorted(colorsFrequencies: [ColorFrequency]) {
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
