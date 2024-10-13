//
//  NameTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 12/9/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import Testing

#if canImport(UIKit)
    import UIKit
#endif

@Suite(.tags(.colors, .kit))
class NameTests {

    @Test func primaryExact() {
        let color = NativeColor.blue()
        #expect(color.name() == "blue")
    }

    @Test func secondaryExact() {
        let color = NativeColor.purple
        #expect(color.name() == "violet")
    }

    @Test func tertiaryExact() {
        let color = NativeColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
        #expect(color.name() == "chartreuse")
    }

    @Test func close() {
        let color = NativeColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 1.0)
        #expect(color.name() == "red")
    }

    @Test func black() {
        let color = NativeColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        #expect(color.name() == "black")
    }

    @Test func white() {
        let color = NativeColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        #expect(color.name() == "white")
    }

    @Test func gray() {
        let color = NativeColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        #expect(color.name() == "gray")
    }

    @Test func darkGray() {
        let color = NativeColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        #expect(color.name() == "gray")
    }

    @Test func lightGray() {
        let color = NativeColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
        #expect(color.name() == "gray")
    }

    @Test func random() {
        let color = NativeColor.random()
        #expect(color.name() != nil)
    }

}
