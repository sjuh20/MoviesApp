//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 04/07/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    let controller = [HomeViewController(),SearchViewController(), WatchListViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController()
    }
    
    func tabBarController() {
       
        let tabBarApperance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()
        
        tabBarItemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorTextNormal,
            NSAttributedString.Key.font:UIFont(name: "Roboto-Medium", size: 12) as Any
        ]
        
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorTextSelected,
            NSAttributedString.Key.font:UIFont(name: "Roboto-Medium", size: 12) as Any
        ]
        
        tabBarApperance.backgroundColor = colorScreenBackground

        tabBarApperance.stackedLayoutAppearance = tabBarItemAppearance
        
        tabBar.standardAppearance = tabBarApperance
        tabBar.scrollEdgeAppearance = tabBarApperance
    
        let lineTop = CALayer()
        lineTop.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 2.5)
        lineTop.backgroundColor = colorTextSelected.cgColor
        tabBar.layer.addSublayer(lineTop)
        
        let homeVc = UINavigationController(rootViewController: HomeViewController())
        homeVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let searchVc = UINavigationController(rootViewController: SearchViewController())
        searchVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(named: "search"), tag: 1)

        let watchList = UINavigationController(rootViewController: WatchListViewController())
        watchList.tabBarItem = UITabBarItem.init(title: "Watch list", image: UIImage(named: "bookmark"), tag: 2)
        
        viewControllers = [homeVc,searchVc,watchList]
        
        
    }
}
