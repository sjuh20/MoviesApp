//
//  TabBarController.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 04/07/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tabBarController() {
        
        let tabBarController = UITabBarController()
        let font = UIFont(name: "Roboto-Medium", size: 12)
        tabBarController.tabBar.backgroundColor = UIColor(red: 36/255, green: 42/255, blue: 50/255, alpha: 100)
        tabBarController.tabBar.tintColor = UIColor(red: 2/255, green: 150/255, blue: 229/255, alpha: 100)
        UITabBarItem.appearance().setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key: font ?? ""], for: .normal)
        
        let homeVc = UINavigationController(rootViewController: HomeViewController())
        homeVc.tabBarItem.title = "Home"
        homeVc.tabBarItem.image = UIImage(named: "home")
       
        let searchVc = UINavigationController(rootViewController: SearchViewController())
        searchVc.tabBarItem.title = "Search"
        searchVc.tabBarItem.image = UIImage(named: "search")
       
        let watchList = UINavigationController(rootViewController: WatchListViewController())
        watchList.tabBarItem.title = "Watch list"
        watchList.tabBarItem.image = UIImage(named: "bookmark")
        
        tabBarController.viewControllers = [homeVc,searchVc,watchList]
       
        
    }
}
