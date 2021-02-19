//
//  CountryListViewController.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

protocol CountryListViewControllerDelegate: class {
    func countryListViewController(_ viewController: CountryListViewController, didSelect country: String, for user: User)
}

final class CountryListViewController: UITableViewController {
    private weak var delegate: CountryListViewControllerDelegate?
    private let viewModel: CountryListViewModel
    private static let basicCellIdentifier = "default"
    
    init(viewModel: CountryListViewModel,
         delegate: CountryListViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CountryListViewController.basicCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListViewController.basicCellIdentifier,
                                                 for: indexPath)
        
        cell.textLabel?.text = viewModel.countryList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.countryListViewController(self,
                                            didSelect: viewModel.countryList[indexPath.row],
                                            for: viewModel.user)
    }
}
