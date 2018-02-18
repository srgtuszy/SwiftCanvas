//
//  UIImage+SwiftyDraw.swift
//  SwiftyDraw
//
//  Created by Michal Tuszynski on 17/02/2018.
//  Copyright © 2018 iapp. All rights reserved.
//

import Foundation

public extension UIImage {
    public static func create(size: CGSize) -> DrawingProxy {
        return CGContextDrawingProxy(size: size)
    }
    
    public func edit() -> DrawingProxy {
        return CGContextDrawingProxy(size: size)
            .draw(image: self)
    }
}
