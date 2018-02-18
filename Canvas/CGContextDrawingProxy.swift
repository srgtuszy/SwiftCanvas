//
//  CGContextDrawingProxy.swift
//  SwiftyDraw
//
//  Created by Michal Tuszynski on 17/02/2018.
//  Copyright © 2018 iapp. All rights reserved.
//

import Foundation
import CoreGraphics

final class CGContextDrawingProxy: DrawingProxy {
    private let context: CGContext
    private let size: CGSize
    
    // MARK: Init & teardown
    
    init(size: CGSize) {
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("Cannot aquire CGContext reference")
        }
        self.context = context
        self.size = size
    }
    
    deinit {
        UIGraphicsEndImageContext()
    }
    
    // MARK: DrawingProxy
    
    func flipVertical() -> DrawingProxy {
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -size.height)
        
        return self
    }
    
    func flipHorizontal() -> DrawingProxy {
        context.scaleBy(x: -1, y: 1)
        context.translateBy(x: -size.width, y: 0)
        
        return self
    }
    
    func stroke(rect: CGRect, with color: UIColor, width: CGFloat) -> DrawingProxy {
        context.performRetainingState {
            self.context.setStrokeColor(color.cgColor)
            self.context.stroke(rect, width: width)
        }
        
        return self
    }
    
    func fill(with color: UIColor) -> DrawingProxy {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return fill(rect: rect, with: color)
    }
    
    func fill(rect: CGRect, with color: UIColor) -> DrawingProxy {
        context.performRetainingState {
            self.context.setFillColor(color.cgColor)
            self.context.fill(rect)
        }
        
        return self
    }
    
    func draw(image: UIImage) -> DrawingProxy {
        image.draw(at: .zero)
        
        return self
    }
    
    func render() -> UIImage {
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            fatalError("Failed to render image")
        }
        
        return image
    }
}

private extension CGContext {
    func performRetainingState(block: () -> Void) {
        saveGState()
        block()
        restoreGState()
    }
}
