//
//  NativeColor.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

#if canImport(UIKit)
    public import UIKit
#elseif canImport(AppKit)
    public import AppKit
#else
    public import SwiftUI
#endif

#if canImport(UIKit)
    public typealias NativeColor = UIColor
#elseif canImport(AppKit)
    public typealias NativeColor = NSColor
#else
    public typealias NativeColor = Color

#endif
