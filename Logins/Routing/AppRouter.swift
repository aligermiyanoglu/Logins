//
//  AppRouter.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

protocol AppRouterFlow {
    func initialViewController() -> UIViewController
    
    func login(from viewController: UIViewController)
}

class AppRouter: AppRouterFlow {

    func initialViewController() -> UIViewController {
        return LoginViewController(router: self)
    }
    
    func login(from viewController: UIViewController) {
        let userListViewController = UIViewController()
        userListViewController.view.backgroundColor = .cyan
        viewController.present(userListViewController, animated: true, completion: nil)
    }
}
