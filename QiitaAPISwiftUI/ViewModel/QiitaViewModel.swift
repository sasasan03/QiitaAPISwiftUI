//
//  QiitaViewModel.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/11.
//

import Foundation
//キータ通信API　async/awaitで処理
class QiitaViewModel: ObservableObject {

    @Published var articles:[QiitaArticle] = []

    @MainActor func fetchQiitaArticles() async {
        do {
            guard let url = URL(string: "https://qiita.com/api/v2/items?page=1") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            articles = try JSONDecoder().decode([QiitaArticle].self, from: data)
        } catch {
            print("Error")
        }
    }
}
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//class QiitaViewModel: ObservableObject {
//
//    @Published var articles:[QiitaArticle] = []
//
//    func fetchQiitaArticles(){
//        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: url) { (data, _ , error) -> Void in
//            if let err = error {
//                print("情報の取得に失敗しました :", err)
//                return
//            }
//
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                    print("json:", json)
//                } catch(let err) {
//                    print("情報の取得に失敗しました", err)
//                }
//            }
//        }
//    }
//
//}



//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//enum APIError: Error {
//    case errorType
//    var title: String{
//        switch self {
//        case .errorType:
//            return "エラー"
////        default:
////            return "不明なエラー"
//        }
//    }
//}
////デバック（表示するところ）・でバッカー（ツール）
//class QiitaViewModel: ObservableObject {
//
//    @Published var articles:[QiitaArticle] = []
//
//    @MainActor func fetchQiitaArticles(completion: @escaping ((Result<[QiitaArticle],APIError>) ->  Void)) {
//        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1") else {
//            return completion(.failure(.errorType))
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { (data, urlResponse, error)  in
//            do {
//                guard let data = data else { throw APIError.errorType }
//                guard let articleList = try? JSONDecoder().decode([QiitaArticle].self, from: data) else {
//                    throw APIError.errorType
//                }
//                DispatchQueue.main.async {
//                    completion(.success(articleList))
//                }
//            } catch {
//                if error as? APIError == APIError.errorType {
//                    completion(.failure(.errorType))
//                }
//            }
//        }
//        .resume()
//    }
//}
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーー使っていないやつ

//    func onApper() { かいくんに習ったやつ
//        Task {
//            fetchQiitaArticles()
//        }
//    }

//class QiitaViewModel: ObservableObject, Identifiable {
//    let id = UUID()
//    @Published var qiitas:[Qiita] = []
//
//    func fetchQiitaArticle() async {
//        Task {
//            let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=10")!
//            let (data, _ ) = try await URLSession.shared.data(from: url)
//
//            DispatchQueue.main.async { [weak self] in
//                do {
//                    self?.qiitas = try JSONDecoder().decode([Qiita].self, from: data)
//                } catch {
//
//                }
//            }
//        }
//    }
//}
