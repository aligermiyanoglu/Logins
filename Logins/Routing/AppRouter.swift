//
//  AppRouter.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

protocol AppRouterFlow {
    func initialViewController() -> UIViewController
     
    func showCountries(from viewController: LoginViewController, for user: User)
    
    func showInitialViewController(from viewController: UIViewController,
                                   for user: LoginUser)
}

class AppRouter: AppRouterFlow, CountryListViewControllerDelegate {

    func initialViewController() -> UIViewController {
        return LoginViewController(router: self)
    }
    
    func showCountries(from viewController: LoginViewController, for user: User) {
        let viewModel = CountryListViewModel(user: user, countryList: CountryProvider.countries)
        let countryListViewController = CountryListViewController(viewModel: viewModel,
                                                                  delegate: self)
        viewController.present(countryListViewController,
                               animated: true)
    }
    
    func showInitialViewController(from viewController: UIViewController,
                                   for user: LoginUser) {
        let viewModel = UserListViewModel(user: user)
        let userListViewController = UserListViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: userListViewController)
        
        viewController.present(navigationViewController, animated: true, completion: nil)
    }
    
    // MARK: CountryListViewControllerDelegate Methods
    
    func countryListViewController(_ viewController: CountryListViewController,
                                   didSelect country: Country,
                                   for user: User) {
        showInitialViewController(from: viewController, for: LoginUser(email: user.email, country: country))
    }
    
    
}
