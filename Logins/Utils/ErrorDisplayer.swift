//
//  ErrorDisplayer.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

typealias FetchResultViewModel = ErrorModel & DataFetchModel

protocol ErrorModel {
    var errorObservable: Observable<Error> { get }
}

protocol DataFetchModel {
    associatedtype Data

    var dataObservable: Observable<Data> { get }
    func fetch()
}

protocol ErrorDisplayer {
    func showError(_ error: Error)
}

extension ErrorDisplayer where Self: UIViewController {
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error".localized,
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK".localized,
                                                style: .default,
                                                handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }
}
