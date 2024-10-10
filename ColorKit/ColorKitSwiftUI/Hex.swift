//
//  Hex.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import ColorKit
import SwiftUI

extension Color {

    @available(iOS 14.0, *)
    public var hex: String { nativeColor.hex }

    @available(iOS 15.0, *)
    public init?(hex: String) {
        guard let color = NativeColor(hex: hex)?.color else { return nil }
        self = color
    }

}
