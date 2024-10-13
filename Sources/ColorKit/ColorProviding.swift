//
//  ColorProviding.swift
//  ColorKit
//
//  Created by Luca on 13/10/2024.
//
import Foundation

public protocol ColorProviding: Equatable {
    var red: CGFloat { get }
    var green: CGFloat { get }
    var blue: CGFloat { get }
    var opacity: CGFloat { get }

    init(
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat
    )

}

extension ColorProviding {
    var alpha: CGFloat {
        opacity
    }
}


