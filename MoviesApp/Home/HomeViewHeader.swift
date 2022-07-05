//
//  HomeView.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 04/07/22.
//

import UIKit

class HomeViewHeader: UITableViewHeaderFooterView {
    static let identifier = "header"
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false 
        title.text = "What do you want to watch?"
        title.font = UIFont(name: "Poppins-SemiBold", size: 18)
        title.textColor = .black
        return title
    }()
    
    lazy var search: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 18
        search.isTranslucent = true
        search.barTintColor = colorTextNormal
        search.placeholder = "Search"
        search.searchTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        search.searchTextField.textColor = colorTextDefault
       return search
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setupConstrains()
        self.backgroundColor = colorScreenBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView(){
        self.addSubview(self.title)
        self.addSubview(self.search)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
            
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20),
            self.title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            
            self.search.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 20),
            self.search.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            self.search.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            self.search.heightAnchor.constraint(equalToConstant: 42)
            
        ])
        
    }
    
}
