//
//  Conversions.swift
//  ColorKit
//
//  Created by Luca on 13/10/2024.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

struct ConversionTests {
    @available(iOS 15.0, *)
    @Test func red() {
        #expect(Color(red: 1, green: 0, blue: 0) === Color(NativeColor.red))

        let red = NativeColor(Color(red: 1, green: 0, blue: 0))
        #expect(NativeColor.red.red == red.red)
        #expect(NativeColor.red.green == red.green)
        #expect(NativeColor.red.blue == red.blue)
        #expect(NativeColor.red.opacity == red.opacity)

        #expect(NativeColor.red.red == Color.red().red)
        #expect(NativeColor.red.green == Color.red().green)
        #expect(NativeColor.red.blue == Color.red().blue)
        #expect(NativeColor.red.opacity == Color.red().opacity)

        #expect(NativeColor(Color.red()).red == NativeColor.red.red)
        #expect(NativeColor(Color.red()).green == NativeColor.red.green)
        #expect(NativeColor(Color.red()).blue == NativeColor.red.blue)
        #expect(NativeColor(Color.red()).opacity == NativeColor.red.opacity)
    }

    @Test func green() {
        #expect(Color(red: 0, green: 1, blue: 0) === Color(NativeColor.green))

        let red = NativeColor(Color(red: 0, green: 1, blue: 0))
        #expect(NativeColor.green.red == red.red)
        #expect(NativeColor.green.green == red.green)
        #expect(NativeColor.green.blue == red.blue)
        #expect(NativeColor.green.opacity == red.opacity)

        #expect(NativeColor.green.red == Color.green().red)
        #expect(NativeColor.green.green == Color.green().green)
        #expect(NativeColor.green.blue == Color.green().blue)
        #expect(NativeColor.green.opacity == Color.green().opacity)

        #expect(NativeColor(Color.green()).red == NativeColor.green.red)
        #expect(NativeColor(Color.green()).green == NativeColor.green.green)
        #expect(NativeColor(Color.green()).blue == NativeColor.green.blue)
        #expect(NativeColor(Color.green()).opacity == NativeColor.green.opacity)
    }
}
