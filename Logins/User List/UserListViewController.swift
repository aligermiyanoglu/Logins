//
//  UserListViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

final class UserListViewController: UITableViewController {
    private static let basicCellIdentifier = "default"

    private let viewModel: UserListViewModelProtocol
    
    init(viewModel: UserListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UserListViewController.basicCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.userListObservable.bind { [weak self] (_) in
            self?.hideIndicator()
            self?.tableView.reloadData()
        }
        
        showIndicator()
        viewModel.fetchUsers()
    }
    
    // MARK: TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userListObservable.value?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserListViewController.basicCellIdentifier,
                                                 for: indexPath)

        cell.textLabel?.text = viewModel.userListObservable.value?[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
