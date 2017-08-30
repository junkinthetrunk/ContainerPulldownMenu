//
//  UIButton + Convenience.swift
//  Pulldown
//
//  Created by Maria Gomez on 9/21/15.
//  Copyright © 2015 Maria Gomez. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// Makes the ``imageView`` appear just to the right of the ``titleLabel``.
    func alignImageRight() {
        if let titleLabel = self.titleLabel, let imageView = self.imageView {
            // Force the label and image to resize.
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            imageView.contentMode = .scaleAspectFill
            
            // Set the insets so that the title appears to the left and the image appears to the right.
            // Make the image appear slightly off the top/bottom edges of the button.
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -1 * imageView.frame.size.width,
                bottom: 0,
                right: imageView.frame.size.width
            )
            self.imageEdgeInsets = UIEdgeInsets(
                top: 4,
                left: titleLabel.frame.size.width + 8,
                bottom: 4,
                right: -1 * titleLabel.frame.size.width
            )
        }
    }
}

