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
    
    func showDetails(of user: User, from viewController: UserListViewController)
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
        let userListViewController = UserListViewController(viewModel: viewModel, router: self)
        let navigationViewController = UINavigationController(rootViewController: userListViewController)
        
        viewController.present(navigationViewController, animated: true, completion: nil)
    }
    
    func showDetails(of user: User, from viewController: UserListViewController) {
        guard let navigationController = viewController.navigationController else {
            assert(false, "Layout validation error")
        }
        
        let detailViewController = UserDetailViewController(user: user)
        
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    // MARK: CountryListViewControllerDelegate Methods
    
    func countryListViewController(_ viewController: CountryListViewController,
                                   didSelect country: Country,
                                   for user: User) {
        showInitialViewController(from: viewController, for: LoginUser(email: user.email, country: country))
    }
    
    
}
