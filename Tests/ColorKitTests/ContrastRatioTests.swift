//
//  ContrastRatioTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/13/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

@Suite(.tags(.colors, .kit))
struct ContrastRatioTests {

    @Test func blackWhite() {
        let color = NativeColor.white
        let backgroundColor = NativeColor.black
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 21.0)
    }

    @Test func whiteBlack() {
        let color = NativeColor.black
        let backgroundColor = NativeColor.white
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 21.0)
    }

    @Test func orangeOrangeClose() {
        let color = NativeColor(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
        let backgroundColor = NativeColor(red: 222.0 / 255.0, green: 100.0 / 255.0, blue: 10.0 / 255.0, alpha: 1.0)
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 1.26)
    }

    @Test func orangeOrange() {
        let color = NativeColor(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
        let backgroundColor = NativeColor(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 1.0)
    }

    @Test func greenPurple() {
        let green = NativeColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        let blue = NativeColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        let contrastRatioResult = green.contrastRatio(with: blue)
        #expect(contrastRatioResult.associatedValue == 6.27)
    }

}
