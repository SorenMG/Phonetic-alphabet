//
//  TabBarController.swift
//  FonetiskeAlfabet
//
//  Created by Søren Møller Gade Hansen on 07/09/2018.
//  Copyright © 2018 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Setup tab bar
        setupTabBarViewController()
    }
    
    func setupTabBarViewController() {
        
        let phoneticViewController = PhoneticViewController()
        
        let phoneticImage = UIImage().resizeImage(image: UIImage(named: "character")!, size: CGSize(width: 30, height: 30))
        phoneticViewController.tabBarItem = UITabBarItem(title: "Fonetisk", image: phoneticImage, tag: 0)
        
        let commandViewController = CommandViewController()
        
        let commandImage = UIImage().resizeImage(image: UIImage(named: "speaker")!, size: CGSize(width: 30, height: 30))
        commandViewController.tabBarItem = UITabBarItem(title: "Befaling", image: commandImage, tag: 1)
        
        let viewControllerList = [phoneticViewController, commandViewController]
        
        viewControllers = viewControllerList
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            // Phonetic
            self.title = "Fonetisk"
        }
        else {
            self.title = "Befaling"
        }
    }
    
}

extension UIImage {
    
    func resizeImage(image: UIImage, size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
}
