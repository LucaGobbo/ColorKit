//
//  PaletteTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 7/6/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

@testable import ColorKit
import ColorKit
import Foundation
import SwiftUI
import Testing

@Suite(.tags(.colors, .swiftUI))
struct PaletteTests {
    // MARK: - Colors

    struct Colors {
        @Test func noColors() {
            #expect(ColorPalette<Color>(colors: []) == nil)
        }

        @available(iOS 15.0, *)
        @Test func oneColor() {
            #expect(ColorPalette<Color>(colors: [Color.green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func sameColors() {
            #expect(ColorPalette<Color>(colors: [Color.green(), .green(), .green(), .green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteColors() {
            let colorPalette = ColorPalette<Color>(colors: [Color.black, .white])
            #expect(colorPalette?.background === .black)
            #expect(colorPalette?.primary === .white)
            #expect(colorPalette?.secondary == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteColorsBright() {
            let colorPalette = ColorPalette<Color>(colors: [Color.black, .white], darkBackground: false)
            #expect(colorPalette?.background === .white)
            #expect(colorPalette?.primary === .black)
            #expect(colorPalette?.secondary == nil)
        }
        
        

        @available(iOS 15.0, *)
        @Test func closeColors() {
            #expect(ColorPalette<Color>(colors: [Color.blue(), Color(red: 0, green: 0, blue: 0.8, opacity: 1.0)]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func realUseCase() {
            let darkBlue = Color(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, opacity: 1.0)
            let brightBlue = Color(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, opacity: 1.0)
            let orange = Color(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, opacity: 1.0)
            let colorPalette = ColorPalette<Color>(colors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background === darkBlue)
            #expect(colorPalette?.primary === orange)
            #expect(colorPalette?.secondary === brightBlue)
        }

        @available(iOS 15.0, *)
        @Test func realUseCase2() {
            let red = Color(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, opacity: 1.0)
            let darkBlue = Color(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, opacity: 1.0)
            let white = Color.white
            let colorPalette = ColorPalette<Color>(colors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background === white)
            #expect(colorPalette?.primary === darkBlue)
            #expect(colorPalette?.secondary === red)
        }
    }

    // MARK: - Ordered Colors

    struct OrderedColors {
        @available(iOS 14.0, *)
        @Test func noOrderedColors() {
            #expect(ColorPalette<Color>(orderedColors: [Color]()) == nil)
        }

        @available(iOS 15.0, *)
        @Test func oneOrderedColor() {
            #expect(ColorPalette<Color>(orderedColors: [Color.green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func sameOrderedColors() {
            #expect(ColorPalette<Color>(orderedColors: [Color.green(), .green(), .green(), .green()]) == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteOrderedColors() {
            let colorPalette = ColorPalette<Color>(orderedColors: [Color.black, .white])
            #expect(colorPalette?.background === .black)
            #expect(colorPalette?.primary === .white)
            #expect(colorPalette?.secondary == nil)
        }

        @available(iOS 15.0, *)
        @Test func whiteBlackOrderedColorsBright() {
            let colorPalette = ColorPalette<Color>(orderedColors: [Color.white, Color.black], darkBackground: false)
            #expect(colorPalette?.background === .white)
            #expect(colorPalette?.primary === .black)
            #expect(colorPalette?.secondary == nil)
        }

        @available(iOS 15.0, *)
        @Test func blackWhiteOrderedColorsBright() {
            let colorPalette = ColorPalette<Color>(orderedColors: [Color.black, Color.white], darkBackground: false)
            #expect(colorPalette?.background === .black)
            #expect(colorPalette?.primary === .white)
            #expect(colorPalette?.secondary == nil)
        }

        @available(iOS 15.0, *)
        @Test func closeOrderedColors() {
            let palette = ColorPalette<Color>(orderedColors: [.blue(), Color(red: 0, green: 0, blue: 0.8, opacity: 1.0)])
            #expect(palette == nil)
        }

        @available(iOS 15.0, *)
        @Test func realUseCaseOrdered() {
            let darkBlue = Color(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 190.0 / 255.0, opacity: 1.0)
            let brightBlue = Color(red: 110.0 / 255.0, green: 178.0 / 255.0, blue: 200.0 / 255.0, opacity: 1.0)
            let orange = Color(red: 203.0 / 255.0, green: 179.0 / 255.0, blue: 121.0 / 255.0, opacity: 1.0)
            let colorPalette = ColorPalette<Color>(orderedColors: [darkBlue, brightBlue, orange], ignoreContrastRatio: true)
            #expect(colorPalette?.background === darkBlue)
            #expect(colorPalette?.primary === brightBlue)
            #expect(colorPalette?.secondary === orange)
            
            
            
        }

        @available(iOS 15.0, *)
        @Test func realUseCase2Ordered() {
            let red = Color(red: 255.0 / 255.0, green: 21.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0)
            let darkBlue = Color(red: 76.0 / 255.0, green: 101.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
            let white = Color.white
            let colorPalette = ColorPalette(orderedColors: [red, darkBlue, white], darkBackground: false)
            #expect(colorPalette?.background == red)
            #expect(colorPalette?.primary == white)
            #expect(colorPalette?.secondary == nil)
        }
    }
}
