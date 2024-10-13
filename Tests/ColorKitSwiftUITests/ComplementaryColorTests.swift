//
//  ComplementaryColorTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/18/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import SwiftUI
import Testing

@Suite(.tags(.colors, .swiftUI))
struct ComplementaryColorTests {

    @Test func black() {
        let black = Color.black
        let complementaryColor = black.complementaryColor
        #expect(complementaryColor == Color(red: 1, green: 1, blue: 1, opacity: 1.0))
    }

    @Test func white() {
        let white = Color.white
        let complementaryColor = white.complementaryColor
        #expect(complementaryColor == Color(red: 0, green: 0, blue: 0, opacity: 1.0))
    }

    @Test func blue() {
        let blue = Color.blue()
        let complementaryColor = blue.complementaryColor
        #expect(complementaryColor == Color(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 0, opacity: 1.0))
    }

    @Test func yellow() {
        let yellow = Color(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 0, opacity: 1.0)
        let complementaryColor = yellow.complementaryColor
        #expect(complementaryColor == Color.blue())
    }

    @Test func red() {
        let red = Color.red()
        let complementaryColor = red.complementaryColor
        #expect(
            complementaryColor == Color(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, opacity: 1.0))
    }

}
