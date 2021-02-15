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

        NSLayoutConstraint.activate([
            view.centeredXSubview(mailTextField),
            view.centeredYSubview(mailTextField),
            view.centeredXSubview(passwordTextField),
            passwordTextField.constraintBelow(view: mailTextField, constant: 20),
            view.widthConstraintSubview(mailTextField, multiplier: 0.8),
            view.widthConstraintSubview(passwordTextField, multiplier: 0.8)
        ])
        
        self.view = view
    }
    
    @objc func gestureDidRecognize(_ gestureRecognizer: UIGestureRecognizer) {
        guard gestureRecognizer.state == .ended else { return }
        
        self.view.endEditing(true)
    }
}

