//
//  ComparisonTests.swift
//  ColorKitTests
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import Testing
import SwiftUI

@testable import ColorKit
@testable import ColorKitSwiftUI

@Suite(.tags(.colors, .swiftUI))
struct ComparisonTests {

    // MARK: - Euclidean

    
    struct Euclidean {

        @available(iOS 14.0, *)
        @Test func whiteWhite() {
            let color1 = Color.white
            let color2 = Color.white

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func purplePurple() {
            let color1 = Color.purple
            let color2 = Color.purple

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func whiteBlack() {
            let color1 = Color.white
            let color2 = Color.black

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 441.67)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func random() {
            let color1 = Color(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, opacity: 1.0)
            let color2 = Color(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 171.06)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func close() {
            let color1 = Color(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, opacity: 1.0)
            let color2 = Color(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .euclidean).associatedValue
            #expect(difference == 36.29)

            let reversedDifference = color2.difference(from: color1, using: .euclidean).associatedValue
            #expect(reversedDifference == difference)
        }
    }
    // MARK: - CIE76
    struct CIE76 {
        @available(iOS 14.0, *)
        @Test func whiteWhite() {
            let color1 = Color.white
            let color2 = Color.white

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func purplePurple() {
            let color1 = Color.purple
            let color2 = Color.purple

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func whiteBlack() {
            let color1 = Color.white
            let color2 = Color.black

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 100.0)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func random() {
            let color1 = Color(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, opacity: 1.0)
            let color2 = Color(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 67.55)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func close() {
            let color1 = Color(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, opacity: 1.0)
            let color2 = Color(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .CIE76).associatedValue
            #expect(difference == 14.25)

            let reversedDifference = color2.difference(from: color1, using: .CIE76).associatedValue
            #expect(reversedDifference == difference)
        }
    }
    // MARK: - CIE94

    struct CIE94 {
        @available(iOS 14.0, *)
        @Test func whiteWhite() {
            let color1 = Color.white
            let color2 = Color.white

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func purplePurple() {
            let color1 = Color.purple
            let color2 = Color.purple

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func whiteBlack() {
            let color1 = Color.white
            let color2 = Color.black

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 100.0)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == difference)
        }
        @available(iOS 14.0, *)
        @Test func random() {
            let color1 = Color(red: 76.5 / 255.0, green: 127.5 / 255.0, blue: 178.5 / 255.0, opacity: 1.0)
            let color2 = Color(red: 127.5 / 255.0, green: 25.5 / 255.0, blue: 51.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 48.31)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == 43.99)
        }
        @available(iOS 14.0, *)
        @Test func close() {
            let color1 = Color(red: 196.0 / 255.0, green: 199.0 / 255.0, blue: 46.0 / 255.0, opacity: 1.0)
            let color2 = Color(red: 171.0 / 255.0, green: 173.0 / 255.0, blue: 50.0 / 255.0, opacity: 1.0)

            let difference = color1.difference(from: color2, using: .CIE94).associatedValue
            #expect(difference == 9.5)

            let reversedDifference = color2.difference(from: color1, using: .CIE94).associatedValue
            #expect(reversedDifference == 9.6)
        }
    }

}
