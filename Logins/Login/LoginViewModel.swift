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
    var authorized: Observable<User?> { get }
    
    func login(mail: String, password: String)
    
    func inputValidation(mail: String?, password: String?)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private(set) var error: Observable<Error> = Observable(nil)
    private(set) var loginEnabled: Observable<Bool> = Observable(false)
    private(set) var authorized: Observable<User?> = Observable(nil)
    
    func login(mail: String, password: String) {
        authorized.value = User(id: "", name: "", username: "", email: "")
    }
    
    func inputValidation(mail: String?, password: String?) {
        func validate() -> Bool {
            guard let mailText = mail, mailText.isEmpty == false else {
                return false
            }
            
            guard let passwordText = password, passwordText.isEmpty == false else {
                return false
            }
            
            return StringValidator().isValid(email: mailText)
        }
        
        loginEnabled.value = validate()
    }
}
