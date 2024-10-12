//
//  CGFloatExtensionsTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/26/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

@Suite(.tags(.foundation))
struct CGFloatExtensionsTests {

    @Test func roundedWithPrecision10() {
        let sut: CGFloat = 100.39999999
        let roundedSut = sut.rounded(.toNearestOrEven, precision: 10)
        #expect(roundedSut == 100.4)
    }

    @Test func roundedWithPrecision100() {
        let sut: CGFloat = 100.39999999
        let roundedSut = sut.rounded(.toNearestOrEven, precision: 100)
        #expect(roundedSut == 100.40)
    }

}
