//
//  SwiftBetaCustomCell.swift
//  TestPrueba
//
//  Created by Radmas on 27/02/25.
//

import UIKit

class SwiftBetaCustomCell: UITableViewCell {
    private let deviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let deviceNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(deviceImageView)
        addSubview(deviceNameLabel)
        
        NSLayoutConstraint.activate([
            deviceImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            deviceImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            deviceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0.5),
            deviceImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            deviceImageView.heightAnchor.constraint(equalToConstant: 250),
            
            deviceNameLabel.topAnchor.constraint(equalTo: deviceImageView.bottomAnchor, constant: -40),
            deviceNameLabel.leadingAnchor.constraint(equalTo: deviceImageView.leadingAnchor, constant: 10),
            deviceNameLabel.trailingAnchor.constraint(equalTo: deviceImageView.trailingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Device) {
        deviceImageView.image = UIImage(named: model.imageName)
        deviceNameLabel.text = model.title
    }
}
