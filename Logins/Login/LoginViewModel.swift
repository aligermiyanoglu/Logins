//
//  LoginViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

protocol LoginViewModelProtocol: ErrorModel {
    var loginStateObservable: Observable<Bool> { get }
    var authorizedUserObservable: Observable<User?> { get }
    
    func login(mail: String, password: String)
    
    func validate(mail: String?, password: String?)
}

final class LoginViewModel: LoginViewModelProtocol {
    enum LoginError: String, LocalizedError {
        case hint
        
        var errorDescription: String? {
            switch self {
            case .hint:
                return "Hint: Try 'backdoor' as password".localized
            }
        }
    }
    
    private(set) var errorObservable: Observable<Error> = Observable(nil)
    private(set) var loginStateObservable: Observable<Bool> = Observable(false)
    private(set) var authorizedUserObservable: Observable<User?> = Observable(nil)
    private let userStorage: StorageAPI
    
    init(userStorage: StorageAPI = StorageHandler()) {
        self.userStorage = userStorage
    }
    
    func login(mail: String, password: String) {
        userStorage.validate(for: UserCrededentials(email: mail, password: password)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(true):
                    let address = Address(street: "", geo: Geo(lat: "", lng: ""), city: "", zipcode: "", suite: "")
                    self.authorizedUserObservable.value = User(id: 1,
                                                               name: "",
                                                               username: "",
                                                               email: "",
                                                               address: address)
                case .success:
                    self.errorObservable.value = LoginError.hint
                case .failure(let error):
                    self.errorObservable.value = error
        
                }
            }
        }
    }
    
    func validate(mail: String?, password: String?) {
        func validate() -> Bool {
            guard let mailText = mail, mailText.isEmpty == false else {
                return false
            }
            
            guard let passwordText = password, passwordText.isEmpty == false else {
                return false
            }
            
            return StringValidator().isValid(email: mailText)
        }
        
        loginStateObservable.value = validate()
    }
}

