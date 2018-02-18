//
//  DrawingProxy.swift
//  SwiftyDraw
//
//  Created by Michal Tuszynski on 17/02/2018.
//  Copyright © 2018 iapp. All rights reserved.
//

import Foundation
import UIKit

public protocol DrawingProxy {
    func flipVertical() -> DrawingProxy
    func flipHorizontal() -> DrawingProxy
    func draw(image: UIImage) -> DrawingProxy
    func stroke(rect: CGRect, with color: UIColor, width: CGFloat) -> DrawingProxy
    func fill(rect: CGRect, with color: UIColor) -> DrawingProxy
    func fill(with: UIColor) -> DrawingProxy
    func render() -> UIImage
}

public extension DrawingProxy {
    func stroke(rect: CGRect) -> DrawingProxy {
        return stroke(rect: rect, with: Constants.defaultStrokeColor, width: Constants.defaultLineWidth)
    }
    
    func stroke(rect: CGRect, with color: UIColor) -> DrawingProxy {
        return stroke(rect: rect, with: color, width: Constants.defaultLineWidth)
    }
    
    func stroke(rect: CGRect, width: CGFloat) -> DrawingProxy {
        return stroke(rect: rect, with: Constants.defaultStrokeColor, width: width)
    }
    
    func fill(rect: CGRect) -> DrawingProxy {
        return fill(rect: rect, with: Constants.defaultFillColor)
    }
}

private struct Constants {
    static let defaultStrokeColor: UIColor = .black
    static let defaultFillColor: UIColor = .white
    static let defaultLineWidth: CGFloat = 1
}
