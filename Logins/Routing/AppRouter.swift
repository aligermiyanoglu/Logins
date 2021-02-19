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
                                   for user: User, country: String)
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
                                   for user: User, country: String) {
        let userListViewController = UIViewController()
        userListViewController.view.backgroundColor = .cyan
        
        viewController.present(userListViewController, animated: true, completion: nil)
    }
    
    // MARK: CountryListViewControllerDelegate Methods
    
    func countryListViewController(_ viewController: CountryListViewController,
                                   didSelect country: String,
                                   for user: User) {
        showInitialViewController(from: viewController, for: user, country: country)
    }
    
    
}
