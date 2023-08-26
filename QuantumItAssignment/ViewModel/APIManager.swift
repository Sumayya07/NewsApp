//
//  APIManager.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 26/08/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let newsApi = "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=e5cc2701a68b4a54b8d2abe2fcf548f3"

    
    func load<T: Decodable>(urlRequest: URLRequest, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // Set the date decoding strategy to match the format in the API response
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
