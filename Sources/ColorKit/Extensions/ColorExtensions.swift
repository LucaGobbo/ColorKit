//
//  ColorExtensions.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

public extension CIColor {
    convenience init(nativeColor: NativeColor) {
        #if canImport(UIKit)
            self.init(color: nativeColor)
        #elseif canImport(AppKit)
        
        self.init(cgColor: nativeColor.cgColor)
        #endif
    }
    
  
}

public extension CIColor {
    @available(iOS 14.0, *)
    @available(tvOS 14.0, *)
    convenience init?(color: Color) {
        self.init(nativeColor:  NativeColor(color))
    }
}
