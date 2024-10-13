//
//  RGBTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

@Suite(.tags(.colors, .kit))
struct RGBTests {

    @Test func red() {
        let red: NativeColor = NativeColor.red()
        #expect(red.red == 1.0)
        #expect(red.green == 0.0)
        #expect(red.blue == 0.0)
        #expect(red.alpha == 1.0)
    }

    @Test func green() {
        let green = NativeColor.green()
        #expect(green.red == 0.0)
        #expect(green.green == 1.0)
        #expect(green.blue == 0.0)
        #expect(green.alpha == 1.0)
    }

    @Test func blue() {
        let blue = NativeColor.blue()
        #expect(blue.red == 0.0)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 1.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func white() {
        let blue = NativeColor.white
        #expect(blue.red == 1.0)
        #expect(blue.green == 1.0)
        #expect(blue.blue == 1.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func black() {
        let blue = NativeColor.black
        #expect(blue.red == 0.0)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 0.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func gray() {
        let blue = NativeColor.gray
        #expect(blue.red == 0.5)
        #expect(blue.green == 0.5)
        #expect(blue.blue == 0.5)
        #expect(blue.alpha == 1.0)
    }

    @Test func purple() {
        let blue = NativeColor.purple
        #expect(blue.red == 0.5)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 0.5)
        #expect(blue.alpha == 1.0)
    }

}
