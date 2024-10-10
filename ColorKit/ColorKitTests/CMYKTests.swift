//
//  CMYKTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 6/20/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#endif

@Suite(.tags(.colors))
class CMYKTests {

    @Test func green() {
        let color = NativeColor.green()

        #expect(color.cyan == 1.0)
        #expect(color.magenta == 0.0)
        #expect(color.yellow == 1.0)
        #expect(color.key == 0.0)
    }

    @Test func blue() {
        let color = NativeColor.blue()

        #expect(color.cyan == 1.0)
        #expect(color.magenta == 1.0)
        #expect(color.yellow == 0.0)
        #expect(color.key == 0.0)
    }

    @Test func white() {
        let color = NativeColor.white

        #expect(color.cyan == 0.0)
        #expect(color.magenta == 0.0)
        #expect(color.yellow == 0.0)
        #expect(color.key == 0.0)
    }

    @Test func arbitrary() {
        let color = NativeColor(red: 153.0 / 255.0, green: 71.0 / 255.0, blue: 206.0 / 255.0, alpha: 1.0)

        #expect(areFloatsEqual(color.cyan, 0.26, accuracy: 0.01))

        #expect(areFloatsEqual(color.magenta, 0.66, accuracy: 0.01))
        #expect(color.yellow == 0.0)
        #expect(areFloatsEqual(color.key, 0.19, accuracy: 0.01))

    }

}
