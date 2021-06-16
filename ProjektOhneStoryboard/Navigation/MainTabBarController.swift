//
//  MainTabBarController.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        setupViews()
    }
    
    //MARK: - Functions
        
        private func setupViews() {
                    
            //First ViewController
            let firstVC = UINavigationController(rootViewController: ViewController())
            firstVC.navigationBar.tintColor = .cyan
            firstVC.navigationBar.prefersLargeTitles = true
            firstVC.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.cyan]
            firstVC.navigationBar.largeTitleTextAttributes = firstVC.navigationBar.titleTextAttributes
            let firstVCItem = UITabBarItem(title: "Liste", image: UIImage(systemName: "scribble"), selectedImage: UIImage(systemName: "scribble.variable"))
            firstVC.tabBarItem = firstVCItem
            
            //Second ViewController
            let secondVC = UINavigationController(rootViewController: SettingsViewController())
            secondVC.navigationBar.prefersLargeTitles = true
            let secondVCItem = UITabBarItem(title: "Einstellungen", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
            secondVC.tabBarItem = secondVCItem
            
            //Tabs
            let controllers = [firstVC, secondVC]
            self.viewControllers = controllers
        }
}

//MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
