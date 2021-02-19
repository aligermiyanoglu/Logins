//
//  Observable.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

class Observable<T> {
    typealias Listener = (T?) -> ()
    
    private var listeners: [Listener] = []
    var value: T? {
        didSet{
            listeners.forEach{
                $0(value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }

    func bind(_ listener: @escaping Listener) {
        self.listeners.append(listener)
        
        listener(value)
    }
}
