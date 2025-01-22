//
//  APICaller.swift
//  netflix-clone-ios-uikit
//
//  Created by serkan on 17.01.2025.
//

import Foundation
struct Constanst{
    static let API_KEY = "331e93728a505ed448bf74d2a52933fd"
    static let baseURL = "https://api.themoviedb.org"
}
enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/all/day?api_key=\(Constanst.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
