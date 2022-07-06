//
//  PosterCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PosterCollectionViewCell"
    
     var posterImage: UIImageView = {
        let posterImage = UIImageView()

//         posterImage.frame.size = CGSize(width: 115, height: 167)
         posterImage.layer.cornerRadius = 16
        return posterImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = contentView.bounds
        posterImage.backgroundColor = colorScreenBackground
        posterImage.layer.cornerRadius = 16
        posterImage.layer.masksToBounds = true
    }
    
    
}
