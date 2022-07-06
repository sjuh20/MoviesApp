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
    
    lazy var segmentMovies: UISegmentedControl = {
        let items: [String] = ["Now playing", "Upcoming", "Top rated", "Popular"]
        let segment = UISegmentedControl(items: items)


        segment.setTitleTextAttributes([
            NSAttributedString.Key.strokeColor: colorScreenBackground,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont(name: "Poppins-Medium", size: 14) as Any],
                                            for: .normal)

        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = UIColor(red: 0.227, green: 0.247, blue: 0.278, alpha: 1)
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        return segment
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
        self.addSubview(self.segmentMovies)
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
            
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            
            
            self.segmentMovies.topAnchor.constraint(equalTo: self.title.bottomAnchor,constant: 10),
            self.segmentMovies.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            self.segmentMovies.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
        ])
    }
}
