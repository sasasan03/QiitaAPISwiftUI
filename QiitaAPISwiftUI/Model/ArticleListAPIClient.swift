//
//  ArticleListAPIClient.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/05/28.
//

import Foundation

class ArticleListAPIClient: ArticleListAPIClientProtocol {
    func fetch(completion: @escaping ((Result<[QiitaArticle], APIError>) -> Void)) {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1") else {
            return completion(.failure(.invalidURL))
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error ) in
            do {
                guard let data = data else { throw APIError.noneValue }
                guard let articleList = try? JSONDecoder().decode([QiitaArticle].self, from: data) else {
                    throw APIError.noneValue
                }
                DispatchQueue.main.async {
                    completion(.success(articleList))
                }
            } catch {
                if error as? APIError == APIError.networkError {
                    completion(.failure(.networkError))
                } else if error as? APIError == APIError.noneValue {
                    completion(.failure(.noneValue))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
    
    
}
