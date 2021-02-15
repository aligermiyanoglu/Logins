//
//  AppRouter.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

protocol AppRouterFlow {
    func initialViewController() -> UIViewController
}

class AppRouter: AppRouterFlow {

    func initialViewController() -> UIViewController {
        return LoginViewController(router: self)
    }
}
