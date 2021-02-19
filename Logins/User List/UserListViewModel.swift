//
//  UserListViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

final class UserListViewModel: FetchResultViewModel {
    private(set) var errorObservable: Observable<Error> = .init(nil)
    private(set) var dataObservable: Observable<[User]> = .init(nil)
    
    private let service: APIService
    
    init(service: APIService = APIClient(), user: LoginUser) {
        self.service = service
    }
    
    func fetch() {
        service.fetchUsers { [weak self] (users, error) in
            DispatchQueue.main.async {
                self?.errorObservable.value = error
                self?.dataObservable.value = users
            }
        }
    }
}
