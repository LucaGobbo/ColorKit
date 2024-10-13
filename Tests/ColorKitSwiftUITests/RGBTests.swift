//
//  RGBTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@Suite(.tags(.colors, .swiftUI))
struct RGBTests {

    @Test func red() {
        let red: Color = Color.red()
        #expect(red.red == 1.0)
        #expect(red.green == 0.0)
        #expect(red.blue == 0.0)
        #expect(red.alpha == 1.0)
    }

    @Test func green() {
        let green = Color.green()
        #expect(green.red == 0.0)
        #expect(green.green == 1.0)
        #expect(green.blue == 0.0)
        #expect(green.alpha == 1.0)
    }

    @Test func blue() {
        let blue = Color.blue()
        #expect(blue.red == 0.0)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 1.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func white() {
        let blue = Color.white
        #expect(blue.red == 1.0)
        #expect(blue.green == 1.0)
        #expect(blue.blue == 1.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func white2() {
        let blue = Color.white()
        #expect(blue.red == 1.0)
        #expect(blue.green == 1.0)
        #expect(blue.blue == 1.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func black() {
        let blue = Color.black
        #expect(blue.red == 0.0)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 0.0)
        #expect(blue.alpha == 1.0)
    }

    @Test func gray() {
        let blue = Color(NativeColor.gray)
        #expect(blue.red == 0.5)
        #expect(blue.green == 0.5)
        #expect(blue.blue == 0.5)
        #expect(blue.alpha == 1.0)
    }

    @Test func purple() {
        let blue = Color(NativeColor.purple)
        #expect(blue.red == 0.5)
        #expect(blue.green == 0.0)
        #expect(blue.blue == 0.5)
        #expect(blue.alpha == 1.0)
    }

}
