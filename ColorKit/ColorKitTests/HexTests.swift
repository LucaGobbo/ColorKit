//
//  HexTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/27/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(AppKit)
    import AppKit

#elseif canImport(UIKit)
    import UIKit

#endif

@Suite(.tags(.colors))
struct HexTests {
    fileprivate static let blackHex = "#000000"
    fileprivate static let whiteHex = "#ffffff"
    fileprivate static let redHex = "#ff0000"
    fileprivate static let darkGreen = "#32a852"
    fileprivate static let lightGreen = "#43ff64d9"

    // init

    struct InitHex {
        @Test func initBlack() throws {
            let color = try #require(NativeColor(hex: HexTests.blackHex))

            #expect(color.red == 0)
            #expect(color.green == 0)
            #expect(color.blue == 0)
            #expect(color.alpha == 1)
        }

        @Test func initWhite() throws {
            let color = try #require(NativeColor(hex: HexTests.whiteHex))
            #expect(color.red == 1)
            #expect(color.green == 1)
            #expect(color.blue == 1)
            #expect(color.alpha == 1)
        }

        @Test func initRed() throws {
            let color = try #require(NativeColor(hex: HexTests.redHex))
            #expect(color.red == 255.0 / 255.0)
            #expect(color.green == 0.0 / 255.0)
            #expect(color.blue == 0.0 / 255.0)
            #expect(color.alpha == 1)
        }

        @Test func initDarkGreen() throws {
            let color = try #require(NativeColor(hex: HexTests.darkGreen))
            #expect(color.red == 50.0 / 255.0)
            #expect(color.green == 168.0 / 255.0)
            #expect(color.blue == 82.0 / 255.0)
            #expect(color.alpha == 1)
        }

        @Test func initLightGreen() throws {
            let color = try #require(NativeColor(hex: HexTests.lightGreen))
            #expect(color.red == 67.0 / 255.0)
            #expect(color.green == 255.0 / 255.0)
            #expect(color.blue == 100.0 / 255.0)
            #expect(areFloatsEqual(color.alpha, 0.85, accuracy: 0.001))
        }
    }

    // hex

    struct Hex {
        @Test func hexBlack() {
            let color = NativeColor.black
            #expect(color.hex == HexTests.blackHex)
        }

        @Test func hexWhite() {
            let color = NativeColor.white
            #expect(color.hex == HexTests.whiteHex)
        }

        @Test func hexRed() {
            let color = NativeColor.red()
            #expect(color.hex == HexTests.redHex)
        }

        @Test func hexDarkGreen() {
            let color = NativeColor(red: 50.0 / 255.0, green: 168.0 / 255.0, blue: 82.0 / 255.0, alpha: 1.0)
            #expect(color.hex == HexTests.darkGreen)
        }
    }
}
