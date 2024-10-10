//
//  PaletteTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 7/6/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

#if canImport(UIKit)
    import UIKit
#endif

@Suite(.tags(.colors))
struct PaletteTests {

    // MARK: - Colors

    struct Colors {

        @Test func noColors() {
            #expect(ColorPalette(colors: []) == nil)
        }

        @Test func oneColor() {
            #expect(ColorPalette(colors: [.green()]) == nil)
        }

        @Test func sameColors() {
            #expect(ColorPalette(colors: [.green(), .green(), .green(), .green()]) == nil)
        }

        @Test func blackWhiteColors() {
            let colorPalette = ColorPalette(colors: [.black, .white])
            #expect(colorPalette?.background == .black)
            #expect(colorPalette?.primary == .white)
            #expect(colorPalette?.secondary == nil)
        }

        @Test func blackWhiteColorsBright() {
            let colorPalette = ColorPalette(colors: [.black, .white], darkBackground: false)
            #expect(colorPalette?.background == .white)
            #expect(colorPalette?.primary == .black)
            #expect(colorPalette?.secondary == nil)
        }

        @Test func closeColors() {
            #expect(ColorPalette(colors: [.blue(), NativeColor(red: 0, green: 0, blue: 0.8, alpha: 1.0)]) == nil)
        }

        @Test func realUseCase() {
            let darkBlue = NativeColor(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0)
            let brightBlue = NativeColor(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
            let orange = NativeColor(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, alpha: 1.0)
            let colorPalette = ColorPalette(colors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background == darkBlue)
            #expect(colorPalette?.primary == orange)
            #expect(colorPalette?.secondary == brightBlue)
        }

        @Test func realUseCase2() {
            let red = NativeColor(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0)
            let darkBlue = NativeColor(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
            let white = NativeColor.white
            let colorPalette = ColorPalette(colors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background == white)
            #expect(colorPalette?.primary == darkBlue)
            #expect(colorPalette?.secondary == red)
        }

    }
    // MARK: - Ordered Colors
    struct OrderedColors {
        @Test func noOrderedColors() {
            #expect(ColorPalette(orderedColors: []) == nil)
        }

        @Test func oneOrderedColor() {
            #expect(ColorPalette(orderedColors: [.green()]) == nil)
        }

        @Test func sameOrderedColors() {
            #expect(ColorPalette(orderedColors: [.green(), .green(), .green(), .green()]) == nil)
        }

        @Test func blackWhiteOrderedColors() {
            let colorPalette = ColorPalette(orderedColors: [.black, .white])
            #expect(colorPalette?.background == .black)
            #expect(colorPalette?.primary == .white)
            #expect(colorPalette?.secondary == nil)
        }

        @Test func whiteBlackOrderedColorsBright() {
            let colorPalette = ColorPalette(orderedColors: [.white, .black], darkBackground: false)
            #expect(colorPalette?.background == .white)
            #expect(colorPalette?.primary == .black)
            #expect(colorPalette?.secondary == nil)
        }

        @Test func blackWhiteOrderedColorsBright() {
            let colorPalette = ColorPalette(orderedColors: [.black, .white], darkBackground: false)
            #expect(colorPalette?.background == .black)
            #expect(colorPalette?.primary == .white)
            #expect(colorPalette?.secondary == nil)
        }

        @Test func closeOrderedColors() {
            let palette = ColorPalette(orderedColors: [.blue(), NativeColor(red: 0, green: 0, blue: 0.8, alpha: 1.0)])
            #expect(palette == nil)
        }

        @Test func realUseCaseOrdered() {
            let darkBlue = NativeColor(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0)
            let brightBlue = NativeColor(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
            let orange = NativeColor(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, alpha: 1.0)
            let colorPalette = ColorPalette(orderedColors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background == darkBlue)
            #expect(colorPalette?.primary == brightBlue)
            #expect(colorPalette?.secondary == orange)
        }

        @Test func realUseCase2Ordered() {
            let red = NativeColor(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0)
            let darkBlue = NativeColor(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
            let white = NativeColor.white
            let colorPalette = ColorPalette(orderedColors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background == red)
            #expect(colorPalette?.primary == white)
            #expect(colorPalette?.secondary == nil)
        }
    }
}
