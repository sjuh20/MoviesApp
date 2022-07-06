//
//  MovieModel.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import Foundation


struct ResultsMovie: Decodable {
    
    var results: [MovieModel] = []
}

struct MovieModel : Decodable{
    
    let id: Int
    let adult: Bool?
    let release_date: String?
    let vote_average: Float?
    let overview: String?
    let vote_count: Int?
    let backdrop_path: String?
    let poster_path: String?
    let title: String?
    var genre_ids: [Int] = []
    
    
    
}



