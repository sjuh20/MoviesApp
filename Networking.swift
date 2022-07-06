//
//  Networking.swift
//  MoviesApp
//
//  Created by Ana Julia Brito de Souza on 05/07/22.
//

import Foundation

struct Networking {
    static let sharedInstance = Networking()
    let session = URLSession.shared
    
    let trendingMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=8eb6c777ec4afbd830c7340eca705fd1&language=pt-BR&page=1"
    
    
    func getTrendingMovies(completion: @escaping (ResultsMovie) -> Void){
        guard let TrendingMoviesURL = URL(string: trendingMoviesURL) else {
            return
        }
        
        let task = session.dataTask(with: TrendingMoviesURL) { data, response, error in
            guard let jsonData = data else {
                completion(ResultsMovie())
                return
            }
            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(ResultsMovie.self, from: jsonData)
                completion(movieResponse)
            } catch {
                debugPrint(error)
                completion(ResultsMovie())
            }
        }
        
        task.resume()
    }
}
