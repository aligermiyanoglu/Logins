//
//  UserListViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

final class UserListViewController: UITableViewController {
    private static let basicCellIdentifier = "default"

    private let viewModel: UserListViewModel
    private let router: AppRouterFlow
    
    init(viewModel: UserListViewModel, router: AppRouterFlow) {
        self.viewModel = viewModel
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UserListViewController.basicCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.dataObservable.bind { [weak self] (_) in
            self?.hideIndicator()
            self?.tableView.reloadData()
        }
        
        showIndicator()
        viewModel.fetch()
    }
    
    // MARK: TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataObservable.value?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserListViewController.basicCellIdentifier,
                                                 for: indexPath)

        cell.textLabel?.text = viewModel.dataObservable.value?[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let user = viewModel.dataObservable.value?[indexPath.row] else { return }
        
        router.showDetails(of: user, from: self)
    }
}
