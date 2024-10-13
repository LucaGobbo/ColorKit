//
//  PaletteTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 7/6/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

@testable import ColorKitSwiftUI
import ColorKit
import Foundation
import SwiftUI
import Testing

@Suite(.tags(.colors, .swiftUI))
struct PaletteTests {
    // MARK: - Colors

    struct Colors {
        @Test func noColors() {
            #expect(ColorPalette(colors: []) == nil)
        }

        @available(iOS 15.0, *)
        @Test func oneColor() {
            #expect(ColorPalette(colors: [Color.green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func sameColors() {
            #expect(ColorPalette(colors: [Color.green(), .green(), .green(), .green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteColors() {
            let colorPalette = ColorPalette(colors: [Color.black, .white])
            #expect(colorPalette?.background.color === .black)
            #expect(colorPalette?.primary.color === .white)
            #expect(colorPalette?.secondary?.color == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteColorsBright() {
            let colorPalette = ColorPalette(colors: [Color.black, .white], darkBackground: false)
            #expect(colorPalette?.background.color === .white)
            #expect(colorPalette?.primary.color === .black)
            #expect(colorPalette?.secondary?.color == nil)
        }

        @available(iOS 15.0, *)
        @Test func closeColors() {
            #expect(ColorPalette(colors: [.blue(), Color(red: 0, green: 0, blue: 0.8, opacity: 1.0)]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func realUseCase() {
            let darkBlue = Color(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, opacity: 1.0)
            let brightBlue = Color(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, opacity: 1.0)
            let orange = Color(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, opacity: 1.0)
            let colorPalette = ColorPalette(colors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background.color === darkBlue)
            #expect(colorPalette?.primary.color === orange)
            #expect(colorPalette?.secondary?.color === brightBlue)
        }

        @available(iOS 15.0, *)
        @Test func realUseCase2() {
            let red = Color(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, opacity: 1.0)
            let darkBlue = Color(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, opacity: 1.0)
            let white = Color.white
            let colorPalette = ColorPalette(colors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background.color === white)
            #expect(colorPalette?.primary.color === darkBlue)
            #expect(colorPalette?.secondary?.color === red)
        }
    }

    // MARK: - Ordered Colors

    struct OrderedColors {
        @available(iOS 14.0, *)
        @Test func noOrderedColors() {
            #expect(ColorPalette(orderedColors: [Color]()) == nil)
        }

        @available(iOS 15.0, *)
        @Test func oneOrderedColor() {
            #expect(ColorPalette(orderedColors: [Color.green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func sameOrderedColors() {
            #expect(ColorPalette(orderedColors: [Color.green(), .green(), .green(), .green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteOrderedColors() {
            let colorPalette = ColorPalette(orderedColors: [Color.black, .white])
            #expect(colorPalette?.background.color == .black)
            #expect(colorPalette?.primary.color == .white)
            #expect(colorPalette?.secondary?.color == nil)
        }

        @available(iOS 15.0, *)
        @Test func whiteBlackOrderedColorsBright() {
            let colorPalette = ColorPalette(orderedColors: [Color.white, Color.black], darkBackground: false)
            #expect(colorPalette?.background.color == .white)
            #expect(colorPalette?.primary.color == .black)
            #expect(colorPalette?.secondary?.color == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteOrderedColorsBright() {
            let colorPalette = ColorPalette(orderedColors: [Color.black, Color.white], darkBackground: false)
            #expect(colorPalette?.background.color == .black)
            #expect(colorPalette?.primary.color == .white)
            #expect(colorPalette?.secondary?.color == nil)
        }

        @available(iOS 15.0, *)
        @Test func closeOrderedColors() {
            let palette = ColorPalette(orderedColors: [.blue(), Color(red: 0, green: 0, blue: 0.8, opacity: 1.0)])
            #expect(palette == nil)
        }

        @available(iOS 15.0, *)
        @Test func realUseCaseOrdered() {
            let darkBlue = Color(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, opacity: 1.0)
            let brightBlue = Color(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, opacity: 1.0)
            let orange = Color(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, opacity: 1.0)
            let colorPalette = ColorPalette(orderedColors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background.color == darkBlue)
            #expect(colorPalette?.primary.color == brightBlue)
            #expect(colorPalette?.secondary?.color == orange)
        }

        @available(iOS 15.0, *)
        @Test func realUseCase2Ordered() {
            let red = Color(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, opacity: 1.0)
            let darkBlue = Color(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, opacity: 1.0)
            let white = Color.white
            let colorPalette = ColorPalette(orderedColors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background.color == red)
            #expect(colorPalette?.primary.color == white)
            #expect(colorPalette?.secondary?.color == nil)
        }
    }
}
