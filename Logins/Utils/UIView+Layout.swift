//
//  UIView+Layout.swift
//  Heroes
//
//  Created by CTW00708-Admin on 08/02/2021.
//  Copyright © 2021 Ali Germiyanoglu. All rights reserved.
//

import UIKit

extension UIView {
    func addEdgedSubview(_ subview: UIView, edgeInsets: UIEdgeInsets = .zero) {
        addSubview(subview)

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: subview.leadingAnchor, constant: edgeInsets.left),
            trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: edgeInsets.right),
            topAnchor.constraint(equalTo: subview.topAnchor, constant: edgeInsets.top),
            bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: edgeInsets.bottom)
        ])
    }
    
    func topConstraintSubview(_ subview: UIView, constant: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)

        return topConstraint(to: subview, constant: constant)
    }
    
    func leadingConstraintSubview(_ subview: UIView, constant: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)

        return leadingConstraint(to: subview, constant: constant)
    }
    
    func trailingConstraintSubview(_ subview: UIView, constant: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)

        return trailingConstraint(to: subview, constant: constant)
    }
    
    func constraintsWidth(_ width: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalToConstant: width)
    }
    
    func widthConstraint(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant)
    }
    
    func widthConstraintLessWidthThan(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: constant)
    }
    
    func constraintsHeight(_ height: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalToConstant: height)
    }
    
    func bottomConstraintSubview(_ subview: UIView, constant: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)

        return bottomConstraint(to: subview, constant: constant)
    }
    
    func widthConstraintSubview(_ subview: UIView, multiplier: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)
        
        return subview.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier)
    }
    
    func heightConstraintSubview(_ subview: UIView, multiplier: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)
        
        return subview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier)
    }
    
    func centeredXSubview(_ subview: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        addSubview(subview)
        
        return centerX(view: subview, constant: constant)
    }
    
    func centeredYSubview(_ subview: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        addSubview(subview)
        
        return centerY(view: subview, constant: constant)
    }
    
    func topConstraint(to view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return topAnchor.constraint(equalTo: view.topAnchor, constant: -constant)
    }
    
    func leadingConstraint(to view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant)
    }
    
    func trailingConstraint(to view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
    }
    
    func bottomConstraint(to view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
    }
    
    func constraintToAfter(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return view.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -constant)
    }
    
    func constraintBefore(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant)
    }
    
    func centerY(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        return view.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: constant)
    }
    
    func centerX(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        return view.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: constant)
    }
    
    func centerYSubview(_ subview: UIView, constant: CGFloat) -> NSLayoutConstraint {
        addSubview(subview)

        return centerY(view: subview, constant: constant)
    }
    
    func constraintBelow(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
    }
    
    func constraintDistancedBottom(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        view.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: constant)
    }
    
    func aspectRatio(multiplier: CGFloat) -> NSLayoutConstraint{
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
    }
    
    @discardableResult
    func verticallyHuggingPrioritized(priority: UILayoutPriority = .defaultHigh) -> Self {
        setContentHuggingPriority(priority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func verticallyResistancePrioritized(priority: UILayoutPriority = .defaultHigh) -> Self {
        setContentCompressionResistancePriority(priority, for: .vertical)

        return self
    }
    
    @discardableResult
    func horizontallyResistancePrioritized(priority: UILayoutPriority = .defaultHigh) -> Self {
        setContentCompressionResistancePriority(priority, for: .horizontal)

        return self
    }
    
    @discardableResult
    func horizontallyHuggingPrioritized(priority: UILayoutPriority = .defaultHigh) -> Self {
        setContentHuggingPriority(priority, for: .horizontal)
        
        return self
    }
    
    func roundedCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
