//
//  OverView.swift
//  TestPrueba
//
//  Created by Radmas on 27/02/25.
//

import UIKit

class OverView: UIViewController {

    private let overviewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let overviewTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .black)
        label.numberOfLines = 2
        label.text = "OverView"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewResumen: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(overviewTitle)
        view.addSubview(overviewImage)
        view.addSubview(overviewLabel)
        view.addSubview(overviewResumen)
        
        NSLayoutConstraint.activate([
            
            overviewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            overviewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            overviewImage.heightAnchor.constraint(equalToConstant: 250),
            
            overviewTitle.topAnchor.constraint(equalTo: overviewImage.bottomAnchor, constant: 15),
            overviewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            overviewLabel.topAnchor.constraint(equalTo: overviewTitle.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            overviewResumen.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 15),
            overviewResumen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewResumen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            overviewResumen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
            
            
        ])
        

        // Do any additional setup after loading the view.
    }
    
    func configure(model: Device) {
        overviewImage.image = UIImage(named: model.imageName)
        overviewTitle.text = model.title
        overviewResumen.text = model.overview
    }

}
