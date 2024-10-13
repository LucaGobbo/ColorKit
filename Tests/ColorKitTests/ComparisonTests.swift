//
//  ComparisonTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing

@testable import ColorKit

@Suite(.tags(.colors, .kit))
struct ComparisonTests {

    // MARK: - Euclidean

    struct Euclidean {

        @Test func whiteWhite() {
            let color1 = NativeColor.white
            let color2 = NativeColor.white

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func purplePurple() {
            let color1 = NativeColor.purple
            let color2 = NativeColor.purple

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func whiteBlack() {
            let color1 = NativeColor.white
            let color2 = NativeColor.black

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 441.67)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func random() {
            let color1 = NativeColor(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 171.06)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func close() {
            let color1 = NativeColor(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 36.29)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
    }
    // MARK: - CIE76
    struct CIE76 {
        @Test func whiteWhite() {
            let color1 = NativeColor.white
            let color2 = NativeColor.white

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func purplePurple() {
            let color1 = NativeColor.purple
            let color2 = NativeColor.purple

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func whiteBlack() {
            let color1 = NativeColor.white
            let color2 = NativeColor.black

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 100.0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func random() {
            let color1 = NativeColor(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 67.55)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func close() {
            let color1 = NativeColor(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 14.25)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
    }
    // MARK: - CIE94

    struct CIE94 {
        @Test func whiteWhite() {
            let color1 = NativeColor.white
            let color2 = NativeColor.white

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func purplePurple() {
            let color1 = NativeColor.purple
            let color2 = NativeColor.purple

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func whiteBlack() {
            let color1 = NativeColor.white
            let color2 = NativeColor.black

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 100.0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }

        @Test func random() {
            let color1 = NativeColor(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 48.31)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == 43.99)
        }

        @Test func close() {
            let color1 = NativeColor(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
            let color2 = NativeColor(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 9.5)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == 9.6)
        }
    }

}
