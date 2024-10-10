//
//  Random.swift
//  ColorKit
//
//  Created by Luca on 10/10/2024.
//

import SwiftUI

extension Color {
    public static func random(randomizeAlpha: Bool = false) -> Color {
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        let a = randomizeAlpha ? 1 : CGFloat.random(in: 0...1)
        
        return Color(red: r, green: g, blue: b, opacity: a)
    }
    
    public static var random: Color {
        Self.random(randomizeAlpha: false)
    }
}
