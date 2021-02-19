//
//  UserDetailViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

final class UserDetailViewController: UIViewController {
    private let user: User
    
    init(user: User) {
        self.user = user
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        let view = UserDetailView()
        
        view.bind(with: user)
        
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
