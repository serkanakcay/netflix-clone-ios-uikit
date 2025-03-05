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
    static let YoutubeAPI_KEY = "AIzaSyDd8964Vf_cs9JbU8dz05EZHn6WFSMUovM"
    static let YoutubeBaseURL =  "https://youtube.googleapis.com/youtube/v3/search?"
}
enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/movie/day?api_key=\(Constanst.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/tv/day?api_key=\(Constanst.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
                catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
            
            task.resume()
            
        }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constanst.baseURL)/3/movie/upcoming?api_key=\(Constanst.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, _,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constanst.baseURL)/3/movie/popular?api_key=\(Constanst.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, _,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {


        guard let url = URL(string:"\(Constanst.baseURL)/3/movie/popular?api_key=\(Constanst.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, _,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string:" \(Constanst.baseURL)/3/search/movie?api_key=\(Constanst.API_KEY)&query=\(query)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, _,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String,  completion: @escaping (Result<VideoElement, Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constanst.YoutubeBaseURL)q=\(query)&key=\(Constanst.YoutubeAPI_KEY)") else
        {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, _, error in
            guard let data = data, error == nil else {
                return
            }
        
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            }
            catch{
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    }

