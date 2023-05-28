//
//  APIError.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/05/28.
//

import Foundation

enum APIError: Error {
    case noneValue
    case invalidURL
    case networkError
    case unknown

    var title: String {
        switch self {
        case .noneValue:
            return "値が空で取得されたエラー"
        case .invalidURL:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        default:
            return "不明なエラー"
        }
    }

}
