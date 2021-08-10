//
//  ContentView.swift
//  HelloWorld
//
//  Created by FFFK10 on 2021/08/02.
//

// SwiftUIというフレームワークを使用するためのインポート
import SwiftUI

/**
 * ビューを司る構造体
 */
struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    // インデックスを計算するプロパティ
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        // MapViewとImageViewを垂直に表示をさせる
        VStack {
            // 地図を表示
            // 上部は画面端まで表示させる
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            // イメージ画像を表示
            // offsetとpaddingで画像が上に移動しているように表示
            CircleImage(image: landmark.image)
                .offset(y: -130)    // y軸方向に130だけ上に移動させて表示
                .padding(.bottom, -130)    // 同じ分だけマイナスに余白表示
            
            // VStackがvertical stackのこと
            // 垂直方向にオブジェクトを重ねる
            // alignment: .leading で左寄せ
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        // isFavoriteを切り替える
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                // Stack のネストも可能
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
