//
//  ViewController.swift
//  UICollectionView
//
//  Created by Radmas on 25/02/25.
//

import UIKit

struct Device {
    let title: String
    let imageName: String
    let overview: String
}

let movies = [
    Device(title: "Superman", imageName: "superman", overview: "Superman is a superhero who fights crime in Metropolis."),
    Device(title: "Inferno", imageName: "inferno", overview: "Inferno is a superhero who fights crime in Metropolis."),
    Device(title: "Avengers: DoomsDay", imageName: "doomsday", overview: "Avengers: DoomsDay is a superhero who fights crime in Metropolis."),
    Device(title: "DeadPool & Wolverine", imageName: "deadpool3", overview: "DeadPool & Wolverine is a superhero who fights crime in Metropolis."),
    Device(title: "El Conjuro", imageName: "conjuro", overview:"El Conjuro is a superhero who fights crime in Metropolis.")
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "Movies: "
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var refreshButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("Refresh", for: .normal)
          button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
          button.addTarget(self, action: #selector(refresHTTP), for: .touchDown)
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()
    
    
    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countLabel)
        view.addSubview(refreshButton)
        
        devicesTableView.dataSource = self
        devicesTableView.delegate = self
        devicesTableView.register(SwiftBetaCustomCell.self, forCellReuseIdentifier: "SwiftBetaCustomCell")
        
        view.addSubview(devicesTableView)
        
        countLabel.text = "Movies: \(movies.count)"
        
        NSLayoutConstraint.activate([
            
            countLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            refreshButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            devicesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devicesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devicesTableView.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            devicesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftBetaCustomCell", for: indexPath) as! SwiftBetaCustomCell
                
            let model = movies[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let overView = OverView()
               if let sheet = overView.sheetPresentationController {
                   sheet.detents = [.medium(), .large()]
                   sheet.selectedDetentIdentifier = .large
                   sheet.prefersGrabberVisible = true
                   sheet.preferredCornerRadius = 15
               }
               present(overView, animated: true, completion: nil)
        let model = movies[indexPath.row]
        
            overView.configure(model: model)
    }
    
    
    @objc func refresHTTP() {
        
        let activityIndicatorViewController = ActivityIndicatorViewController()
               view.addSubview(activityIndicatorViewController.view)
               addChild(activityIndicatorViewController)
               activityIndicatorViewController.didMove(toParent: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
         
            activityIndicatorViewController.willMove(toParent: nil)
                     activityIndicatorViewController.removeFromParent()
                     activityIndicatorViewController.view.removeFromSuperview()
        }
    }
    
    
}
