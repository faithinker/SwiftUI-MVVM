//
//  NetworkManager.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared           = NetworkManager()
    private let cache           = NSCache<NSString, UIImage>()
    
    static let baseURL          = "https://seanallen-course-backend.herokuapp.com/"
    private let appetizerURL    = baseURL + "swiftui-fundamentals/appetizers"
    
    private override init() {}
    
    /// @escaping(이스케이핑 클로저)을 사용하여 네트워크를 비동기적으로 처리한다.
    /// Result타입과 JSON Decoder를 사용하여 에러처리(예외상황)와 JSON 파싱을 쉽게 처리한다.
    func getAppetizers(completed: @escaping (Result<[AppetizerModel], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
