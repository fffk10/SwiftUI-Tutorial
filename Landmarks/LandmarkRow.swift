//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by FFFK10 on 2021/08/04.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 30, height: 30)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                // systemNameは標準搭載されているアイコンを呼び出す
                // どんなアイコンがあるかはSF Synbolsで確認できる
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}
 
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // Groupにくくることで複数のObjectを一つのプレビューで表示できる
        // .previewLayoutはGroupに対しても使用できるため、
        // 以下のように記述できて可読性があがる
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
            LandmarkRow(landmark: landmarkData[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
