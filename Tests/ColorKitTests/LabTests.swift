//
//  LabTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/26/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import ColorKit
import Foundation
import Testing

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit

#endif

@Suite(.tags(.colors, .kit))
struct LabTests {

    @Test func green() {
        let color = NativeColor.green()

        #expect(color.L == 87.74)
        #expect(color.a == -86.18)
        #expect(color.b == 83.18)
    }

    @Test func white() {
        let color = NativeColor.white

        #expect(color.L == 100.0)
        #expect(color.a == 0.01)
        #expect(color.b == -0.01)
    }

    @Test func arbitrary() {
        let color = NativeColor(red: 129.0 / 255.0, green: 200.0 / 255.0, blue: 10.0 / 255.0, alpha: 1.0)

        #expect(color.L == 73.55)
        #expect(color.a == -46.45)
        #expect(color.b == 72.04)
    }

}
