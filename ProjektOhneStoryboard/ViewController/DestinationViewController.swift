//
//  DestinationViewController.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

class DestinationViewController: UIViewController {
    
    //MARK: - Outlets
        
    private let label = UILabel()
    
    //MARK: - Properties
    
    let name: String
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLabel()

        print("Es wurde der Name: \(name) übergeben.")
    }
    
    //MARK: - Initializer
    
    init(_name: String) {
        
        self.name = _name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Functions
    
    private func setupViews() {
        
        view.addSubview(label)
    }
    
    private func setupLabel() {
        
        label.text = self.name
        label.textAlignment = .center
        label.textColor = .brown
        label.backgroundColor = .green
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let labelConstraints: [NSLayoutConstraint] = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
}
