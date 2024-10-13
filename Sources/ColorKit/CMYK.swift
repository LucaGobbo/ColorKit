//
//  CMYK.swift
//  ColorKit
//
//  Created by Boris Emorine on 6/20/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import Foundation

extension ColorProviding {
    /// The cyan (C) channel of the CMYK color space.
    public var cyan: CGFloat {
        (1 - red - key) / (1 - key)
    }

    /// The magenta (M) channel of the CMYK color space.
    public var magenta: CGFloat {
        (1 - green - key) / (1 - key)
    }

    /// The yellow (Y) channel of the CMYK color space.
    public var yellow: CGFloat {
        (1 - blue - key) / (1 - key)
    }

    /// The key (black) (K) channel of the CMYK color space.
    public var key: CGFloat {
        1 - max(red, green, blue)
    }
}
