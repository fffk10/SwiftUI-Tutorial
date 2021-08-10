//
//  LandmarkList.swift
//  Landmarks
//
//  Created by FFFK10 on 2021/08/05.
//

import SwiftUI

struct LandmarkList: View {
    // 環境オブジェクト、全てのビューに共通して影響を与える
    @EnvironmentObject var userData: UserData
    
    // showFavoriteOnlyは変更されたらすぐにビューの再描画が行われなければならない
    // @Stateをつけることで前述の動作を実装できる
    //    @State var showFavoriteOnly: Bool = false    監視可能オブジェクトに委譲したためコメントアウト
    
    var body: some View {
        // リスト(LandmarkList)と各観光地データ(LandmarkDetail)を繋げる
        // これをナビゲーションと言って、NavigationViewで囲む
        NavigationView {
            // ListもVStackのように垂直のビューを積み上げる構造体
            // こちらはあらかじめリストデザインが決められていて、スクロールが可能
            // List(...) { }でオブジェクト配列を扱う場合は、
            // 各オブジェクトが常に識別可能である必要がある
            // 理由は、オブジェクトのプロパティが変更になった場合に、ビューの再描画をすぐに行うため
            // つまり、各オブジェクトは一意に定まるidなどのキーが必要
            // List(landmarkData, id: \.id) { landmark in    *本来はこの記述が必要
            // List(landmarkData) { landmark in  //LandmarkのプロトコルにIdentidiableを追加
            List {
                // $showFavoriteOnlyは@Stateを付与したプロパティで使用できる特殊な変数
                // 変更に応じてビューの再描画を促す
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("Favorite Only")
                }
                
                // ForEachでリストに渡すオブジェクト配列を捌く
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            // 前ページへ戻るリンクテキストとして扱われている
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // プレビュー表示する端末を複数選択できる
        ForEach(["iPhone SE", "iPhone X"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(UserData())
        }
    }
}
