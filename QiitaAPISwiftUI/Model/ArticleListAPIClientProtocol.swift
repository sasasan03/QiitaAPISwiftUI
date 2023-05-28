//
//  ArticleListAPIClientProtocol.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/05/28.
//

import Foundation

protocol ArticleListAPIClientProtocol {
    
    func fetch(completion: @escaping ((Result<[QiitaArticle],APIError>) -> Void ))
    
}
