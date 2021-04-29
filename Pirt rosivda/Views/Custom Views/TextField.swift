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
    
    private var tapGesture: UITapGestureRecognizer {
       let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
       return gesture
    }
   
    var leftViewCallback: (() -> ())?
       
    @objc private func imageTapped() {
       leftViewCallback?()
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
       var textRect = super.leftViewRect(forBounds: bounds)
       textRect.origin.x += leftPadding
       return textRect
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = color
            imageView.addGestureRecognizer(tapGesture)
            imageView.isUserInteractionEnabled = true
            imageView.image = image
            leftView = imageView
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: leftView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: leftView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
 }
