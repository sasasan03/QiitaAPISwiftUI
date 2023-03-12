//
//  ContentView.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var qiita = QiitaViewModel()

    @StateObject var qiita = QiitaViewModel()
    
    var body: some View {
        NavigationStack {
            List(qiita.articles) { article in
                HStack{
                    Link(article.title, destination: article.url)
                    Spacer()
                    AsyncImage(url: article.user.profileImageURL){ image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100)
                }
                
//                    VStack(alignment: .leading) {
//                        HStack {
//                            Text(article.title)
//                                .font(.headline)
//                            Spacer()
//
//                        }
//                        Text(article.createdAt)
//                    }
                
            }
            .navigationTitle("Qiitaの記事")
        }
        .task {//画面が非表示となった時に task で実行されている処理が自動的にキャンセルされる。
            //そのため、画面が再表示されたときに処理結果が重複することを避けることができる。
                await qiita.fetchQiitaArticles()
            }
//        .onAppear { //でも可能
//            
//        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
