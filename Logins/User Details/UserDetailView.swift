//
//  UserDetailView.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit

final class UserDetailView: UIView {
    private let nameLabel: UILabel = {
        let label: UILabel = UILabel.view()
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            topConstraintSubview(nameLabel, constant: 80),
            leadingConstraintSubview(nameLabel, constant: 10),
            nameLabel.widthConstraintLessWidthThan(view: self, constant: -20)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with user: User) {
        nameLabel.text = "\(user.name)\nAddress: \(user.address.fullAddress)"
    }
}
