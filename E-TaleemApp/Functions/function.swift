//
//  function.swift
//  E-TaleemApp
//
//  Created by apple on 10/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
import UIKit
final class function
{
    static let shared = function()
    
    func topViewRoundCorner(bounds: CGRect) -> CAShapeLayer
    {
        let rectShape = CAShapeLayer()
        rectShape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: 30, height: 20)).cgPath
        return rectShape
    }
}
