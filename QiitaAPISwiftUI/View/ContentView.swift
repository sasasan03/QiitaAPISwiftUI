//
//  ContentView.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/09.
//

import SwiftUI

//    @ObservedObject var qiita = QiitaViewModel()

//    @StateObject var qiita = QiitaViewModel()

struct ContentView: View {
    
    @EnvironmentObject  var qiita: QiitaViewModel
     
    var body: some View {
        NavigationStack {
            List(qiita.articles) { article in
                QiitaRowView(article: article)
            }
            .navigationTitle("Qiitaの記事")
        }
        .task {//画面が非表示となった時に task で実行されている処理が自動的にキャンセルされる。
            //そのため、画面が再表示されたときに処理結果が重複することを避けることができる。←onapperとの違い
            await qiita.fetchQiitaArticles()
            }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QiitaViewModel())
    }
}
