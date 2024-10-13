//
//  AverageColor.swift
//  ColorKit
//
//  Created by Luca on 12/10/2024.
//

import CoreImage
import SwiftUI
import ColorKit

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


extension View {
    
    
   
  
    /// Computes the average color of the image.
    @available(iOS 16.0, *)
    public func averageColor() throws -> Color {
        
        
        let renderer = ImageRenderer(content: self)
        
        guard let capture = renderer.nativeImage else {
            throw ImageColorError.outputImageFailure
        }
        
        
        let color = try capture.averageColor()
        return Color(color)
        
       
    }
    
}
