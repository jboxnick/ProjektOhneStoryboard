//
//  AppController.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

final class AppController {
    
    //MARK: - Properties
    
    static let shared = AppController()
        
    private var window: UIWindow!
    var rootViewController: UIViewController? {
        didSet {
            if let vc = rootViewController {
                window.rootViewController = vc
            }
        }
    }
    
    //MARK: - Initializer
    
    init() {
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(UserDefaultsDidChange),
            name: UserDefaults.didChangeNotification,
            object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    func showInitialView(window: UIWindow?) {
        
        guard let window = window else { return }
        
        self.window = window
        window.tintColor = .orange
        window.backgroundColor = .systemGroupedBackground
        
        updateRootVC()
        
        window.makeKeyAndVisible()
    }
    
     func updateRootVC() {
        
        let status = UserDefaults.standard.bool(forKey: "loginState")
        var rootVC : UIViewController?
       
        if(status == true) {
            rootVC = UIViewController()
        } else {
            rootVC = MainTabBarController()
        }
        self.rootViewController = rootVC
    }
        
    // MARK: - Notifications
        
    @objc internal func UserDefaultsDidChange() {
        
        print("UserDefaults did change or reload")
    }
}

