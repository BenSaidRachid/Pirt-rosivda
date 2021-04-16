//
//  TextField.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 16/04/2021.
//

import UIKit

@IBDesignable class TextField: UITextField {
    @IBInspectable var leftImage: UIImage? {
         didSet {
             updateView()
         }
     }

    @IBInspectable var leftPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
            didSet {
                updateView()
            }
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
       var textRect = super.leftViewRect(forBounds: bounds)
       textRect.origin.x += leftPadding
       return textRect
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
 }
