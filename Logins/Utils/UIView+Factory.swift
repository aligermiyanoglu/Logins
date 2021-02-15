//
//  UIView+Factory.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

extension UIView {

    static func view<T: UIView>(tintColor: UIColor = .systemBlue, roundedCorners: CGFloat? = nil) -> T {
        let view = T()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = tintColor
        
        if let rounded = roundedCorners {
            view.roundedCorners(rounded)
        }

        return view
    }
}

final class LayoutFactory {
    static func loginTextField(_ type: UIKeyboardType = .default) -> UITextField {
        let textfield: UITextField = UITextField.view()
        textfield.backgroundColor = .lightGray
        textfield.keyboardType = type
        
        return textfield
    }
}
