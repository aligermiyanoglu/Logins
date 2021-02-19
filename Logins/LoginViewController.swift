//
//  LoginViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

class LoginViewController: UIViewController {
    private let router: AppRouterFlow
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(router: AppRouterFlow) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureDidRecognize(_:)))
        view.addGestureRecognizer(panGestureRecognizer)

        let tapGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let mailTextField = LayoutFactory.loginTextField(.emailAddress)
        let passwordTextField = LayoutFactory.loginTextField()
        passwordTextField.isSecureTextEntry = true
        
        let loginButton: UIButton = {
            let buttonColor: UIColor = .systemBlue
            let button: UIButton = UIButton.view(tintColor: .blue, roundedCorners: 8)
            button.addTarget(self, action: #selector(loginButtonDidPress(_:)), for: .touchUpInside)
            button.setTitleColor(buttonColor, for: .normal)
            button.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
            button.layer.borderColor = buttonColor.cgColor
            button.layer.borderWidth = 1
            
            return button
        }()

        let textFieldWidthRatio: CGFloat = 0.6
        let loginButtonWidthRatio: CGFloat = 0.4
        NSLayoutConstraint.activate([
            view.centeredXSubview(mailTextField),
            view.centeredYSubview(mailTextField, constant: -40),
            view.centeredXSubview(passwordTextField),
            view.centeredXSubview(loginButton),
            passwordTextField.constraintBelow(view: mailTextField, constant: 20),
            view.widthConstraintSubview(mailTextField, multiplier: textFieldWidthRatio),
            view.widthConstraintSubview(passwordTextField, multiplier: textFieldWidthRatio),
            view.widthConstraintSubview(loginButton, multiplier: loginButtonWidthRatio),
            loginButton.constraintBelow(view: passwordTextField, constant: 20)
        ])
        
        self.view = view
    }
    
    @objc func gestureDidRecognize(_ gestureRecognizer: UIGestureRecognizer) {
        guard gestureRecognizer.state == .ended else { return }
        
        self.view.endEditing(true)
    }
    
    @objc func loginButtonDidPress(_ sender: Any) {

    }
}

