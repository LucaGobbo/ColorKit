//
//  ComplementaryColorTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/18/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import Testing

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

@Suite(.tags(.colors))
struct ComplementaryColorTests {

    @Test func black() {
        let black = NativeColor.black
        let complementaryColor = black.complementaryColor
        #expect(complementaryColor == NativeColor(red: 1, green: 1, blue: 1, alpha: 1.0))
    }

    @Test func white() {
        let white = NativeColor.white
        let complementaryColor = white.complementaryColor
        #expect(complementaryColor == NativeColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    }

    @Test func blue() {
        let blue = NativeColor.blue()
        let complementaryColor = blue.complementaryColor
        #expect(complementaryColor == NativeColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 0, alpha: 1.0))
    }

    @Test func yellow() {
        let yellow = NativeColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 0, alpha: 1.0)
        let complementaryColor = yellow.complementaryColor
        #expect(complementaryColor == NativeColor.blue())
    }

    @Test func red() {
        let red = NativeColor.red()
        let complementaryColor = red.complementaryColor
        #expect(
            complementaryColor == NativeColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0))
    }

}
