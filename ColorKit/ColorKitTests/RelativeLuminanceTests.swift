//
//  RelativeLuminanceTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/13/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

@Suite(.tags(.colors))
class RelativeLuminanceTests {

    @Test func white() {
        let color = NativeColor.white
        #expect(color.relativeLuminance == 1.0)
    }

    @Test func black() {
        let color = NativeColor.black
        #expect(color.relativeLuminance == 0.0)
    }

    @Test func orange() {
        let color = NativeColor(red: 98.0 / 255.0, green: 44.0 / 255.0, blue: 8.0 / 255.0, alpha: 1.0)
        #expect(color.relativeLuminance == 0.044)
    }

    @Test func purple() {
        let color = NativeColor(red: 120 / 255.0, green: 90.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
        #expect(color.relativeLuminance == 0.155)
    }

}
