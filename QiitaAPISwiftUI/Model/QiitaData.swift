//
//  QiitaData.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/11.
//

import Foundation

//Userを内包している記事データ
struct QiitaArticle: Decodable, Identifiable {
    let id = UUID()
    
    let title: String
    let createdAt: String
    let url: URL
    let user: User //入れ子になったものは使える
    
    enum  CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"//これで対応付けができる
        case url
        case user
    }
}

//userdataを取り出すための構造体
struct User: Decodable {
    let name: String
    let profileImageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        //Jsonの場合はこんな感じ
        case profileImageURL = "profile_image_url"
    }
}



//----------------------------------使ってないやつ
//
// struct Qiita: Decodable, Identifiable {
// let id = UUID()
// let title: String
// let createdAt: String
// let user: User? //入れ子になったものは使える
// 
// enum  CodingKeys: String, CodingKey {
// case title
// case createdAt = "created_at"//これで対応付けができる
// case user
// }
// }
// 
// struct User: Decodable {
// let name: String
// let profileImageURL: URL
// 
// enum CodingKeys: String, CodingKey {
// case name
// //Jsonの場合はこんな感じ
// case profileImageURL = "profile_image_url"
// }
// }
// 
