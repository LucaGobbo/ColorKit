//
//  DominantColors.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

@available(tvOS 16.0, *)
@available(iOS 16.0, *)
extension ImageRenderer {
    @MainActor
    var nativeImage: NativeImage? {
        #if canImport(UIKit)
            return self.uiImage
        #elseif canImport(AppKit)
            return self.nsImage
        #endif
    }
}

@available(tvOS 16.0, *)
@available(iOS 16.0, *)
extension View {

    public typealias DominantColorQuality = NativeImage.DominantColorQuality
    public typealias DominantColorAlgorithm = NativeImage.DominantColorAlgorithm
    typealias ImageColorError = NativeImage.ImageColorError

    /// Uses a `ImageRender` to snapshot you view, and create dominant colors
    ///
    /// Attempts to computes the dominant colors of the image.
    /// This is not the absolute dominent colors, but instead colors that are similar are groupped together.
    /// This avoids having to deal with many shades of the same colors, which are frequent when dealing with compression artifacts (jpeg etc.).
    /// - Parameters:
    ///   - quality: The quality used to determine the dominant colors. A higher quality will yield more accurate results, but will be slower.
    ///   - algorithm: The algorithm used to determine the dominant colors. When using a k-means algorithm (`kMeansClustering`), a `CIKMeans` CIFilter isused. Unfortunately this filter doesn't work on the simulator.
    /// - Returns: The dominant colors as array of `NativeColor` instances. When using the `.iterative` algorithm, this array is ordered where the first color is the most dominant one.
    @MainActor
    public func dominatColors(
        with quality: DominantColorQuality = .fair,
        algorithm: DominantColorAlgorithm = .iterative
    ) throws -> [Color] {

        let renderer = ImageRenderer(content: self)

        guard let capture = renderer.nativeImage else {
            throw ImageColorError.outputImageFailure
        }
        let colors = try capture.dominantColors(with: quality, algorithm: algorithm)

        return colors.map { Color(nativeColor: $0) }
    }

}
