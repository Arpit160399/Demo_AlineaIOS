//
//  anchorView.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 27/10/20.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,bottom: NSLayoutYAxisAnchor?,left: NSLayoutXAxisAnchor?,right: NSLayoutXAxisAnchor?,size : CGSize = .zero ,padding: UIEdgeInsets = .zero ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left {
            leftAnchor.constraint(equalTo: left ,constant: padding.left).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top ,constant: padding.top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom ,constant: padding.bottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right,constant: padding.right ).isActive = true
        }
        if   size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height ).isActive = true
        }
    }
}

extension UIImage {
    func imageWithInsets(insets: UIEdgeInsets) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let _ = UIGraphicsGetCurrentContext()
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets
    }
}
