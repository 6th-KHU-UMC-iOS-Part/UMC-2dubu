//
//  Helpers.swift
//  UMC-2dubu
//
//  Created by 이건우 on 4/9/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let mainColor: UIColor = UIColor(r: 43, g: 193, b: 188)
}

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

extension UIImageView {
    func applyshadowWithCorner(
        containerView: UIView,
        cornerRadius: CGFloat,
        shadowOpacity: Float,
        shadowRadius: CGFloat
    ) {
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOpacity = shadowOpacity
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = shadowRadius
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadius).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
