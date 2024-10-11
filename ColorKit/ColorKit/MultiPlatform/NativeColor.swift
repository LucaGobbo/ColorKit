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
#endif

#if canImport(UIKit)
    public typealias NativeColor = UIColor
#elseif canImport(AppKit)
    public typealias NativeColor = NSColor
#endif
