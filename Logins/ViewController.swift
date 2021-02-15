//
//  ViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import UIKit

class ViewController: UIViewController {
    private let router: AppRouterFlow
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(router: AppRouterFlow) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

}

