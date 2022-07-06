//
//  CollectionTableViewCell.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import UIKit

class PosterTableViewCell: UITableViewCell {
    
    static let identifier = "PosterTableViewCell"
    
    var movies : [MovieModel] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        collectionView.backgroundColor = colorScreenBackground
        collectionView.showsHorizontalScrollIndicator = false
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12

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
    
    public func updateMovies(movies: [MovieModel]){
        self.movies = movies
//        collectionView.reloadData()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PosterTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
            return UICollectionViewCell()
        }

        DispatchQueue.global().async { [weak self] in
            guard let posterPath = self?.movies[indexPath.row].poster_path else {return}
            guard let url = URL(string:"https://image.tmdb.org/t/p/w500\(posterPath)") else {
                return
            }
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.posterImage.image = image
                    }
                }
            }
        }

        return cell 
    }
    
    
}
