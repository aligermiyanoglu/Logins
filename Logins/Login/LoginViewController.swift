//
//  LoginViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

class LoginViewController: UIViewController {
    private let router: AppRouterFlow
    
    private let viewModel: LoginViewModelProtocol
    
    private var loginView: LoginView? {
        view as? LoginView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(router: AppRouterFlow, viewModel: LoginViewModel = LoginViewModel()) {
        self.router = router
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: View Life Cycle
    
    override func loadView() {
        let view = LoginView()

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureDidRecognize(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        let tapGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        view.loginButton.addTarget(self, action: #selector(loginButtonDidPress(_:)), for: .touchUpInside)
        view.mailTextField.addTarget(self, action: #selector(textFieldContentChange), for: .editingChanged)
        view.passwordTextField.addTarget(self, action: #selector(textFieldContentChange), for: .editingChanged)
        
        bindViewModel(to: view)

        self.view = view
    }
    
    // MARK: IBAction Methods
    
    @objc func gestureDidRecognize(_ gestureRecognizer: UIGestureRecognizer) {
        guard gestureRecognizer.state == .ended else { return }
        
        self.view.endEditing(true)
    }
    
    @objc func loginButtonDidPress(_ sender: Any) {
        guard let mail = loginView?.mailTextField.text,
              let password = loginView?.passwordTextField.text else {
            assert(false, "fix me")
        }
        
        showIndicator()
        viewModel.login(mail: mail, password: password)
    }
    
    @objc func textFieldContentChange(_ sender: Any) {
        viewModel.inputValidation(mail: loginView?.mailTextField.text, password: loginView?.passwordTextField.text)
    }
    
    // MARK: Private Methods

    private func bindViewModel(to view: LoginView) {
        viewModel.error.bind { [unowned self] (observation) in
            hideIndicator()
            
            guard let error = observation else { return }

            let alertController = UIAlertController(title: "Error".localized,
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK".localized,
                                                    style: .default,
                                                    handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }
        
        viewModel.authorized.bind { [unowned self] (observation) in
            hideIndicator()

            guard let value = observation, value else { return }
            
            self.router.login(from: self)
        }
        
        viewModel.loginEnabled.bind { (observation) in
            guard let enabled = observation else { return }
            
            view.loginButton.alpha = enabled ? 1.0 : 0.2
            view.loginButton.isEnabled = enabled
        }
    }
}
