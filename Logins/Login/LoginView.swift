//
//  LoginView.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

final class LoginView: UIView {
    
    let mailTextField: UITextField = {
        let textField = LayoutFactory.loginTextField(.emailAddress)
        textField.placeholder = "Email".localized
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = LayoutFactory.loginTextField()
        textField.placeholder = "Password".localized
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let buttonColor: UIColor = .systemBlue
        let button: UIButton = UIButton.view(tintColor: .blue, roundedCorners: 8)
        button.setTitleColor(buttonColor, for: .normal)
        button.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        button.layer.borderColor = buttonColor.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        let textFieldWidthRatio: CGFloat = 0.6
        let loginButtonWidthRatio: CGFloat = 0.4
        NSLayoutConstraint.activate([
            centeredXSubview(mailTextField),
            centeredYSubview(mailTextField, constant: -40),
            centeredXSubview(passwordTextField),
            centeredXSubview(loginButton),
            passwordTextField.constraintBelow(view: mailTextField, constant: 20),
            widthConstraintSubview(mailTextField, multiplier: textFieldWidthRatio),
            widthConstraintSubview(passwordTextField, multiplier: textFieldWidthRatio),
            widthConstraintSubview(loginButton, multiplier: loginButtonWidthRatio),
            loginButton.constraintBelow(view: passwordTextField, constant: 20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
