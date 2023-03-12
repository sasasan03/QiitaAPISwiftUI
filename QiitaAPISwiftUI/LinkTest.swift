//
//  LinkTest.swift
//  QiitaAPISwiftUI
//
//  Created by sako0602 on 2023/03/12.
//

import SwiftUI

struct LinkTest: View {
    var body: some View {
                if let url = URL(string: "https://www.apple.com/") {
                    Link("アップルのホームページが開きます", destination: url)
                }
            }
        }

struct LinkTest_Previews: PreviewProvider {
    static var previews: some View {
        LinkTest()
    }
}
