//
//  UserListViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

protocol UserListViewModelProtocol: ErrorModel {
    typealias UserListCompletion = (_ users: [User]) -> Void
    var userListObservable: Observable<[User]> { get }
    
    func fetchUsers()
}

final class UserListViewModel: UserListViewModelProtocol {
    private(set) var errorObservable: Observable<Error> = .init(nil)
    private(set) var userListObservable: Observable<[User]> = .init(nil)
    
    private let service: APIService
    
    init(service: APIService = APIClient(), user: LoginUser) {
        self.service = service
    }
    
    func fetchUsers() {
        service.fetchUsers { [weak self] (users, error) in
            DispatchQueue.main.async {
                self?.errorObservable.value = error
                self?.userListObservable.value = users
            }
        }
    }
}
