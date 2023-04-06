//
//  QiitaRowView.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/11.
//

import SwiftUI

struct QiitaRowView: View {
    
    @State var article: QiitaArticle
    
    var body: some View {
        NavigationStack {
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
        }
    }
}

//struct QiitaRowView_Previews: PreviewProvider {
//    
//    @EnvironmentObject var qiita:QiitaViewModel
//    
//    static var previews: some View {
//        
//        QiitaRowView(
//            
////            article: QiitaArticle(
////            title:"qiitaの記事",
////            createdAt: "2023/3/12",
////            url: (URL(string: "https://qiita.com/goto2023/items/08c5c724a39a78a25d70"),
////            user: User.init(name: T##String, profileImageURL: T##URL)
//
//        )
//    }
//}
