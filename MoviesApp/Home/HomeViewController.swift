//
//  HomeViewController.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 04/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView : HomeViewHeader?
    
    let tableView : UITableView = {
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        table.register(HomeViewHeader.self,
                       forHeaderFooterViewReuseIdentifier: "header")
        return table
    }()
    
    func tableViewDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func loadView() {
        self.homeView = HomeViewHeader()
        self.view = homeView
        tableViewDelegate()
        self.subviews()
//        self.constraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension HomeViewController {
    func subviews() {
        view.addSubview(self.tableView)
    }
//    func constraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//        }
    }

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HomeViewHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

}

