//
//  UserData.swift
//  Landmarks
//
//  Created by FFFK10 on 2021/08/06.
//

import SwiftUI
import Combine    // 監視可能オブジェクトObservableObjectを使用するためのフレームワーク

// 監視可能オブジェクト
final class UserData: ObservableObject {
    // 監視下で変更に応じてビューの再描画をしたいプロパティに@Publishedを付与する
    @Published var showFavoriteOnly = false
    @Published var landmarks = landmarkData
}

