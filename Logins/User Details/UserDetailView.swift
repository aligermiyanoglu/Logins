//
//  UserDetailView.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import UIKit
import MapKit

final class UserDetailView: UIView {
    private let nameLabel: UILabel = {
        let label: UILabel = UILabel.view()
        label.numberOfLines = 0
        return label
    }()
    
    private let mapView: MKMapView = MKMapView.view()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            topConstraintSubview(nameLabel, constant: 80),
            leadingConstraintSubview(nameLabel, constant: 10),
            nameLabel.widthConstraintLessWidthThan(view: self, constant: -20),
            nameLabel.leadingConstraint(to: mapView, constant: 0),
            heightConstraintSubview(mapView, multiplier: 0.4),
            mapView.constraintBelow(view: nameLabel, constant: 20),
            trailingConstraintSubview(mapView, constant: 10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with user: User) {
        nameLabel.text = "\(user.name)\nAddress: \(user.address.fullAddress)\nlan: \(user.address.geo.lat)\nlng: \(user.address.geo.lng)"
        
        if let lan = Double(user.address.geo.lat), let lng = Double(user.address.geo.lng) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lan, longitude: lng),
                                            latitudinalMeters: 200,
                                            longitudinalMeters: 200)
            mapView.setRegion(region, animated: true)
        }
    }
}

