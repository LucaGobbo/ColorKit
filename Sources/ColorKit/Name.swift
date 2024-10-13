//
//  Name.swift
//  ColorKit
//
//  Created by Boris Emorine on 12/9/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation

extension NativeColor {

    /// This function gives a readable name to the current `NativeColor` instance.
    /// Warning: some languages may not be supported.
    /// - Returns: The name of the color.
    public func name() -> String {
        let colorList = NamedColorList.BasicColors
        var closestColor: (NativeColor, String)?
        var bestMatch: NativeColor.ColorDifferenceResult = .init(value: CGFloat.infinity)

        for color in colorList {
            let difference = self.difference(from: color.0, using: .CIE94)

            if difference < bestMatch {
                closestColor = color
                bestMatch = difference
            }
        }

        guard let color = closestColor?.1 else { return "" }

        let components = color.components(separatedBy: ".")
        guard components.count > 1 else {
            return color
        }

        guard let last = components.last else {
            return color
        }
        return last
    }

}

/// Adds the content of two dictionaries together.
private func += <NativeColor, String>(lhs: [NativeColor: String], rhs: [NativeColor: String]) -> [NativeColor: String] {
    let summedUpDictionay = lhs.reduce(into: rhs) { (result, colorNamePair) in
        result[colorNamePair.key] = colorNamePair.value
    }
    return summedUpDictionay
}

/// A collection of lists of colors and their names.
struct NamedColorList {

    static let BasicColors =
        AdditivePrimaryColors += AdditiveSecondaryColors += AdditiveTertiaryColors += GrayShadeColors

    static let AdditivePrimaryColors = [
        NativeColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.primary.red", bundle: .module, comment: "red"),
        NativeColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.primary.green", bundle: .module, comment: "green"),
        NativeColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.primary.blue", bundle: .module, comment: "blue"),
    ]

    static let AdditiveSecondaryColors = [
        NativeColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.secondary.yellow", bundle: .module, comment: "yellow"),
        NativeColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.secondary.magenta", bundle: .module, comment: "magenta"),
        NativeColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.secondary.cyan", bundle: .module, comment: "cyan"),
    ]

    static let AdditiveTertiaryColors = [
        NativeColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.azure", bundle: .module, comment: "azure"),
        NativeColor(red: 0.5, green: 0.0, blue: 1.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.violet", bundle: .module, comment: "violet"),
        NativeColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.rose", bundle: .module, comment: "rose"),
        NativeColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.orange", bundle: .module, comment: "orange"),
        NativeColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.chartreuse", bundle: .module, comment: "chartreuse"),
        NativeColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0): NSLocalizedString(
            "colorkit.color.name.tertiary.sprint_green", bundle: .module,
            comment: "spring green"),
    ]

    static let GrayShadeColors = [
        NativeColor.black: NSLocalizedString(
            "colorkit.color.name.gray_shade.black", bundle: .module, comment: "black"),
        NativeColor.white: NSLocalizedString(
            "colorkit.color.name.gray_shade.white", bundle: .module, comment: "white"),
        NativeColor.gray: NSLocalizedString(
            "colorkit.color.name.gray_shade.gray", bundle: .module, comment: "gray"),
    ]

}
