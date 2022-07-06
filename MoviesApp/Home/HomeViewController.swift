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
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeViewHeader.self,
                       forHeaderFooterViewReuseIdentifier: HomeViewHeader.identifier)
        table.register(PosterTableViewCell.self,
                       forCellReuseIdentifier:PosterTableViewCell.identifier)
        table.register(HomeViewFooter.self,
                       forHeaderFooterViewReuseIdentifier: HomeViewFooter.identifier)
        table.backgroundColor = colorScreenBackground
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
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
        return 1
       }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier, for: indexPath) as? PosterTableViewCell else {
            return UITableViewCell()
        }
        
        Networking.sharedInstance.getTrendingMovies { movies in
            cell.updateMovies(movies: movies.results)
        }
        
        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeViewHeader.identifier) as? HomeViewHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeViewFooter.identifier) as? HomeViewFooter
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }

}

