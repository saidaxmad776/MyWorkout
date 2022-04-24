//
//  MainTabBarController.swift
//  MyWorkout
//
//  Created by Test on 23/04/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupView()
    }
    
    private func setupTabBar() {
        
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLigtBrown.cgColor
    }
    
    private func setupView() {
        
        let mainVC = MainViewController()
        let statisticVC = StaticViewController()
        
        setViewControllers([mainVC, statisticVC], animated: true)
        
        guard let items = tabBar.items else { return }
        items[0].title = "Main"
        items[1].title = "Statistic"
        
        items[0].image = UIImage(named: "mainVC")
        items[1].image = UIImage(named: "statisticVC")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 12) as Any],
                                                         for: .normal)

    }
}
