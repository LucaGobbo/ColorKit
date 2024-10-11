//
//  util.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//
import Foundation
import Testing

func areFloatsEqual(_ a: CGFloat, _ b: CGFloat, accuracy: CGFloat) -> Bool {
    return abs(a - b) <= accuracy
}

@Suite(.tags(.foundation))
struct UitlTets {

    @Test(arguments: [
        (0, 0.1),
        (0, 0.01),
        (0, 0.02),
        (0, 0.03),
        (0, 0.04),
        (0, 0.05),
        (0, 0.06),
        (0, 0.07),
        (0, 0.08),
        (0, 0.09),
        (12, 11.9),
        (12, 11.91),
        (12, 11.92),

    ])
    func accuracy_01(params: (CGFloat, CGFloat)) {
        #expect(areFloatsEqual(params.0, params.1, accuracy: 0.1))
    }

    @Test(arguments: [
        (0, 0.1),
        (0, 0.02),
        (0, 0.03),
        (0, 0.04),
        (0, 0.05),
        (0, 0.06),
        (0, 0.07),
        (0, 0.08),
        (0, 0.09),
        (12, 11.9),
        (12, 11.91),
        (12, 11.92),

    ])
    func invalid_accuracy_001(params: (CGFloat, CGFloat)) {
        #expect(!areFloatsEqual(params.0, params.1, accuracy: 0.01))
    }

    @Test(arguments: [
        (1, 0.991),
        (0, 0.001),

    ])
    func accuracy_check_001(params: (CGFloat, CGFloat)) {
        #expect(areFloatsEqual(params.0, params.1, accuracy: 0.01))
    }

    @Test(arguments: [
        (0, 0.1),
        (0, 0.01),
        (0, 0.02),
        (0, 0.03),
        (0, 0.04),
        (0, 0.05),
        (0, 0.06),
        (0, 0.07),
        (0, 0.08),
        (0, 0.09),
        (12, 11.9),
        (12, 11.91),
        (12, 11.92),
    ])
    func accuracy_001(params: (CGFloat, CGFloat)) {
        #expect(!areFloatsEqual(params.0, params.1, accuracy: 0.001))
    }

}
