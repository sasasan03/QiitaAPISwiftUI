//
//  ArticleListAPIClient.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/05/28.
//

import Foundation

class ArticleListAPIClient: ArticleListAPIClientProtocol {
    func fetch(completion: @escaping ((Result<[QiitaArticle], APIError>) -> Void)) {
        //urlにどこからデータをとってきたいのか、ページ場所を書いたURLを格納する。
        //（公式）URLRequestは、ロード要求の2つの重要なプロパティ、ロードするURLとそれをロードするために使用されるポリシーをカプセル化します。
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1") else {
            //データをとってこれなかった場合,guardで早期退出させる。
            return completion(.failure(.invalidURL))
        }
        //URLRequestはリクエストに関する情報のみ
        let request = URLRequest(url: url)
        //URLSessionを使用してrequestをサーバーに送信する。
        URLSession.shared.dataTask(with: request) { (data, _ , error ) in//_ ←は本来responseが入っていたが、使用しないので今回はアンダースコアにしている。
            do {
                //正しくdataをとってこれているかチェック。
                guard let data = data else { throw APIError.noneValue }
                //とってきた情報をデコードする。圏外になるなどして、正しくデコードできないことが想定されるためエラーの可能性があるtryを記述。
                guard let articleList = try? JSONDecoder().decode([QiitaArticle].self, from: data) else {
                    throw APIError.noneValue
                }
                //情報を取得できた順に配列に追加していく。
                DispatchQueue.main.async {
                    completion(.success(articleList))
                }
            } catch {
                //エラー処理。
                if error as? APIError == APIError.networkError {
                    completion(.failure(.networkError))
                } else if error as? APIError == APIError.noneValue {
                    completion(.failure(.noneValue))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()//タスクが中断されている場合、再開する
    }
}
