//
//  QiitaViewModel.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/11.
//

import Foundation
//キータ通信API
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
