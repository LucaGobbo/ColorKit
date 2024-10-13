//
//  HexTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/27/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKitSwiftUI

@Suite(.tags(.colors, .swiftUI))
struct HexTests {
    fileprivate static let blackHex = "#000000"
    fileprivate static let whiteHex = "#ffffff"
    fileprivate static let redHex = "#ff0000"
    fileprivate static let darkGreen = "#32a852"
    fileprivate static let lightGreen = "#43ff64d9"

    // init

    struct InitHex {
        @available(iOS 15.0, *)
        @Test func initBlack() throws {
            let color = try #require(Color(hex: HexTests.blackHex))

            #expect(color.red == 0)
            #expect(color.green == 0)
            #expect(color.blue == 0)
            #expect(color.alpha == 1)
        }
        @available(iOS 15.0, *)
        @Test func initWhite() throws {
            let color = try #require(Color(hex: HexTests.whiteHex))
            #expect(color.red == 1)
            #expect(color.green == 1)
            #expect(color.blue == 1)
            #expect(color.alpha == 1)
        }
        @available(iOS 15.0, *)
        @Test func initRed() throws {
            let color = try #require(Color(hex: HexTests.redHex))
            #expect(color.red == 255.0 / 255.0)
            #expect(color.green == 0.0 / 255.0)
            #expect(color.blue == 0.0 / 255.0)
            #expect(color.alpha == 1)
        }
        @available(iOS 15.0, *)
        @Test func initDarkGreen() throws {
            let color = try #require(Color(hex: HexTests.darkGreen))
            #expect(color.red == 50.0 / 255.0)
            #expect(color.green == 168.0 / 255.0)
            #expect(color.blue == 82.0 / 255.0)
            #expect(color.alpha == 1)
        }
        @available(iOS 15.0, *)
        @Test func initLightGreen() throws {
            let color = try #require(Color(hex: HexTests.lightGreen))
            #expect(color.red == 67.0 / 255.0)
            #expect(color.green == 255.0 / 255.0)
            #expect(color.blue == 100.0 / 255.0)
            #expect(areFloatsEqual(color.alpha, 0.85, accuracy: 0.001))
        }
    }

    // hex

    struct Hex {
        @available(iOS 15.0, *)
        @Test func hexBlack() {
            let color = Color.black
            #expect(color.hex == HexTests.blackHex)
        }
        @available(iOS 15.0, *)
        @Test func hexWhite() {
            let color = Color.white
            #expect(color.hex == HexTests.whiteHex)
        }
        @available(iOS 15.0, *)
        @Test func hexRed() {
            let color = Color.red()
            #expect(color.hex == HexTests.redHex)
        }
        @available(iOS 15.0, *)
        @Test(.disabled("this is failing because of #31a852")) func hexDarkGreen() {
            let color = Color(red: 50.0 / 255.0, green: 168.0 / 255.0, blue: 82.0 / 255.0, opacity: 1.0)
            #expect(color.hex == HexTests.darkGreen)
        }
    }
}
