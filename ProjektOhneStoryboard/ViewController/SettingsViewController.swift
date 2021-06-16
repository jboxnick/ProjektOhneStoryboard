//
//  SettingsViewController.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    //MARK: - Setup Functions
    
    private func setupViews() {
        
        title = "Einstellungen"
    }

    private func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
    }
    
    //MARK: - @objc Functions
    
    @objc func logoutTapped() {
        
        print("Logout wurde gedrückt")
    }
}
