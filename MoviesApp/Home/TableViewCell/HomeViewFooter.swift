//
//  HomeVieFooter.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import UIKit

class HomeViewFooter: UITableViewHeaderFooterView {

    static let identifier = "HomeViewFooter"

    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Categories"
        title.font = UIFont(name: "Poppins-SemiBold", size: 18)
        title.textColor = colorTextDefault
        return title
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setupConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView(){
        self.addSubview(self.title)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
            
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20),
            self.title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            self.title.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
