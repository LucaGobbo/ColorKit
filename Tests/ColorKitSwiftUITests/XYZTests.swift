//
//  XYZTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@Suite(.tags(.colors, .swiftUI))
struct XYZTests {

    @Test func green() {
        let color = Color.green()

        #expect(color.X == 35.76)
        #expect(color.Y == 71.52)
        #expect(color.Z == 11.92)
    }

    @Test func white() {
        let color = Color.white

        #expect(color.X == 95.05)
        #expect(color.Y == 100.0)
        #expect(color.Z == 108.9)
    }

    @Test func arbitrary() {
        let color = Color(red: 129.0 / 255.0, green: 200.0 / 255.0, blue: 10.0 / 255.0, opacity: 1.0)

        #expect(color.X == 29.76)
        #expect(color.Y == 46.0)
        #expect(color.Z == 7.6)
    }

}
