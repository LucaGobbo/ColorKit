//
//  CMYKTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 6/20/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing
import SwiftUI

@testable import ColorKit


@Suite(.tags(.colors, .swiftUI))
struct CMYKTests {

    @available(iOS 14.0, *)
    @Test func green() {
        let color = Color.green()

        #expect(color.cyan == 1.0)
        #expect(color.magenta == 0.0)
        #expect(color.yellow == 1.0)
        #expect(color.key == 0.0)
    }
    @available(iOS 14.0, *)
    @Test func blue() {
        let color = Color.blue()

        #expect(color.cyan == 1.0)
        #expect(color.magenta == 1.0)
        #expect(color.yellow == 0.0)
        #expect(color.key == 0.0)
    }
    @available(iOS 14.0, *)
    @Test func white() {
        let color = Color.white

        #expect(color.cyan == 0.0)
        #expect(color.magenta == 0.0)
        #expect(color.yellow == 0.0)
        #expect(color.key == 0.0)
    }
    @available(iOS 14.0, *)
    @Test func arbitrary() {
        let color = Color(red: 153.0 / 255.0, green: 71.0 / 255.0, blue: 206.0 / 255.0, opacity: 1.0)

        #expect(areFloatsEqual(color.cyan, 0.26, accuracy: 0.01))

        #expect(areFloatsEqual(color.magenta, 0.66, accuracy: 0.01))
        #expect(color.yellow == 0.0)
        #expect(areFloatsEqual(color.key, 0.19, accuracy: 0.01))

    }

}
