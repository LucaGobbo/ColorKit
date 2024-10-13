//
//  ContrastRatioTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/13/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing
import SwiftUI

@testable import ColorKit

@Suite(.tags(.colors, .swiftUI))
struct ContrastRatioTests {

    @available(iOS 14.0, *)
    @Test func blackWhite() {
        let color = Color.white
        let backgroundColor = Color.black
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 21.0)
    }
    @available(iOS 14.0, *)
    @Test func whiteBlack() {
        let color = Color.black
        let backgroundColor = Color.white
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 21.0)
    }
    @available(iOS 14.0, *)
    @Test func orangeOrangeClose() {
        let color = Color(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, opacity: 1.0)
        let backgroundColor = Color(red: 222.0 / 255.0, green: 100.0 / 255.0, blue: 10.0 / 255.0, opacity: 1.0)
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 1.26)
    }
    @available(iOS 14.0, *)
    @Test func orangeOrange() {
        let color = Color(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, opacity: 1.0)
        let backgroundColor = Color(red: 243.0 / 255.0, green: 120.0 / 255.0, blue: 9.0 / 255.0, opacity: 1.0)
        let contrastRatioResult = color.contrastRatio(with: backgroundColor)
        #expect(contrastRatioResult.associatedValue == 1.0)
    }
    @available(iOS 14.0, *)
    @Test func greenPurple() {
        let green = Color(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 0.0 / 255.0, opacity: 1.0)
        let blue = Color(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, opacity: 1.0)
        let contrastRatioResult = green.contrastRatio(with: blue)
        #expect(contrastRatioResult.associatedValue == 6.27)
    }

}
