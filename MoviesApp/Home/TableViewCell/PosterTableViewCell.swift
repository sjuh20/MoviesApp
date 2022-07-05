//
//  CollectionTableViewCell.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import UIKit

class PosterTableViewCell: UITableViewCell {
    
    static let identifier = "PosterTableViewCell"
    
    var poster = [UIImage.init(named: "movie-1"),
                  UIImage.init(named: "movie-2"),
                  UIImage.init(named: "movie-3")
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        collectionView.backgroundColor = colorScreenBackground
        collectionView.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        self.configCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    private func configCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
            
    }
}

extension PosterTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.posterImage.image = poster[indexPath.row]

        return cell 
    }
    
    
}
