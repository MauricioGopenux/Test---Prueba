//
//  ActivityIndicatorViewController.swift
//  TestPrueba
//
//  Created by Radmas on 27/02/25.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .black
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading Movies ..."
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var refreshButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("Refresh", for: .normal)
          button.isEnabled = false
          button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        view.addSubview(loadingLabel)
        view.addSubview(refreshButton)

        NSLayoutConstraint.activate([
            
            loadingLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            loadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            loadingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            refreshButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
