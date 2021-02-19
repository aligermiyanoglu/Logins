//
//  UIView+Protocols.swift
//  Utils
//
//  Created by Ali Germiyanoglu on 18.01.2019.
//  Copyright © 2019 Ali Germiyanoglu. All rights reserved.
//

import UIKit

private let IndicatorTag: Int = UUID().hashValue

public protocol IndicatorProtocol {
    @discardableResult
    func showIndicator() -> UIView
    func hideIndicator()
}

fileprivate extension UIView {
    static func defaultIndicatorView(onView: UIView) -> UIView {
        func blackBox() -> UIView {
            let parentHalfWidth = min(onView.bounds.width/2, 160)
            let box = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                           size: CGSize(width: parentHalfWidth, height: parentHalfWidth)))
            box.center = CGPoint(x: onView.bounds.midX, y: onView.bounds.midY)
            box.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            box.clipsToBounds = true
            box.layer.cornerRadius = 10.0
            
            return box
        }
        
        func activityIndicator(inView: UIView) -> UIActivityIndicatorView {
            let indicator = UIActivityIndicatorView(style: .white)
            let yPos = inView.bounds.midY
            indicator.center = CGPoint(x: inView.bounds.midX, y: yPos)
            indicator.startAnimating()
            
            return indicator
        }
        
        func messageLabel(message: String, center: CGPoint) -> UILabel {
            let label = UILabel(frame: CGRect.zero)
            label.textColor = UIColor.white
            label.minimumScaleFactor = 0.7
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            label.center = center
            
            return label
        }
        
        let view = UIView(frame: onView.bounds)
        view.backgroundColor = UIColor.clear
        view.tag = IndicatorTag
        
        let rect = blackBox()
        let indicator = activityIndicator(inView: rect)
                
        rect.addSubview(indicator)
        view.addSubview(rect)
        
        return view
    }
}

extension UIView: IndicatorProtocol {
    @discardableResult
    public func showIndicator() -> UIView {
        let newIndicatorView = UIView.defaultIndicatorView(onView: self)
        let oldIndicatorView = viewWithTag(IndicatorTag)
        oldIndicatorView?.removeFromSuperview()
        
        addSubview(newIndicatorView)
        
        return newIndicatorView
    }
    
    public func hideIndicator() {
        while let indicatorView = viewWithTag(IndicatorTag) {
            indicatorView.removeFromSuperview()
        }
    }
}

extension UIViewController: IndicatorProtocol {
    @discardableResult
    public func showIndicator() -> UIView {
        return view.showIndicator()
    }
    
    public func hideIndicator() {
        guard isViewLoaded else { return }

        view.hideIndicator()
    }
}
