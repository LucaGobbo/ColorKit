//
//  Util.swift
//  ColorKit
//
//  Created by Luca on 13/10/2024.
//
import SwiftUI
import ColorKit
import ColorKitSwiftUI
extension Color {
    
    @available(iOS 14.0, *)
    static func === (lhs: Color, rhs: Color) -> Bool {
        return lhs.isEqualTo(rhs)
    }
    
    @available(iOS 14.0, *)
    static func === (lhs: Color?, rhs: Color) -> Bool {
        guard let lhs else {return false}
        return lhs.isEqualTo(rhs)
    }
    
    
    
    @available(iOS 14.0, *)
    private func isEqualTo(_ otherColor: Color) -> Bool {
        // Convert both colors to UIColor
        let uiColor1 = NativeColor(self)
        let uiColor2 = NativeColor(otherColor)
        
        // Extract RGBA components from both UIColor instances
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        uiColor1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        uiColor2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        // Compare RGBA values with a tolerance for floating-point precision
        let tolerance: CGFloat = 0.001
        return abs(r1 - r2) < tolerance &&
        abs(g1 - g2) < tolerance &&
        abs(b1 - b2) < tolerance &&
        abs(a1 - a2) < tolerance
    }
    
}


