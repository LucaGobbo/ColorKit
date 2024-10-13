//
//  RelativeLuminanceTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 3/13/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing
import SwiftUI
@testable import ColorKit

@Suite(.tags(.colors, .swiftUI))
class RelativeLuminanceTests {

    @available(iOS 14.0, *)
    @Test func white() {
        let color = Color.white
        #expect(color.relativeLuminance == 1.0)
    }
    @available(iOS 14.0, *)
    @Test func black() {
        let color = Color.black
        #expect(color.relativeLuminance == 0.0)
    }
    @available(iOS 14.0, *)
    @Test func orange() {
        let color = Color(red: 98.0 / 255.0, green: 44.0 / 255.0, blue: 8.0 / 255.0, opacity: 1.0)
        #expect(color.relativeLuminance == 0.044)
    }
    @available(iOS 14.0, *)
    @Test func purple() {
        let color = Color(red: 120 / 255.0, green: 90.0 / 255.0, blue: 200.0 / 255.0, opacity: 1.0)
        #expect(color.relativeLuminance == 0.155)
    }

}
