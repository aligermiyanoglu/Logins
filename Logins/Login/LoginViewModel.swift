//
//  LoginViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

protocol LoginViewModelProtocol {
    var error: Observable<Error> { get }
    var loginEnabled: Observable<Bool> { get }
    var authorized: Observable<Bool> { get }
    
    func login(mail: String, password: String)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private(set) var error: Observable<Error> = Observable(nil)
    private(set) var loginEnabled: Observable<Bool> = Observable(false)
    private(set) var authorized: Observable<Bool> = Observable(false)
    
    func login(mail: String, password: String) {
        authorized.value = true
    }
}
