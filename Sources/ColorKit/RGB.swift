//
//  RGB.swift
//  ColorKit
//
//  Created by Boris Emorine on 2/24/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit

#endif

package struct RGB {
    package let R: CGFloat
    package let G: CGFloat
    package let B: CGFloat

    package init(R: CGFloat, G: CGFloat, B: CGFloat) {
        self.R = R
        self.G = G
        self.B = B
    }
}


extension ColorProviding {
    // MARK: Internal
    
    var red255: CGFloat {
        self.red * 255.0
    }
    
    var green255: CGFloat {
        self.green * 255.0
    }
    
    var blue255: CGFloat {
        self.blue * 255.0
    }
    
    var rgb: RGB {
        return RGB(R: self.red, G: self.green, B: self.blue)
    }

}



extension NativeColor: ColorProviding {
    public var opacity: CGFloat {
        alpha
    }

    
    
    // MARK: - Public
    
    /// The red (R) channel of the RGB color space as a value from 0.0 to 1.0.
    public var red: CGFloat {
        CIColor(nativeColor: self).red 
    }
    
    /// The green (G) channel of the RGB color space as a value from 0.0 to 1.0.
    public var green: CGFloat {
        CIColor(nativeColor: self).green 
    }
    
    /// The blue (B) channel of the RGB color space as a value from 0.0 to 1.0.
    public var blue: CGFloat {
        CIColor(nativeColor: self).blue 
    }
    
    /// The alpha (a) channel of the RGBa color space as a value from 0.0 to 1.0.
    public var alpha: CGFloat {
        CIColor(nativeColor: self).alpha 
    }
}
extension Color: ColorProviding {
    
    public var red: CGFloat {
        if #available(iOS 14.0, *) {
            return CIColor(color: self)?.red ?? 0
        } else {
            return 0
        }
    }
    
    public var green: CGFloat {
        if #available(iOS 14.0, *) {
            return CIColor(color: self)?.green ?? 0
        } else {
            return 0
        }
        
    }
    
    public var blue: CGFloat {
        if #available(iOS 14.0, *) {
            return CIColor(color: self)?.blue ?? 0
        } else {
            return 0
        }
    }
    
    public var opacity: CGFloat {
        if #available(iOS 14.0, *) {
            return CIColor(color: self)?.alpha ?? 0
        } else {
            return 0
        }
    }
    
    
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
