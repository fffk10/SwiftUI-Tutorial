//
//  Landmark.swift
//  HelloWorld
//
//  Created by FFFK10 on 2021/08/04.
//

import SwiftUI
import CoreLocation

// Hashableは自動でハッシュ値を生成する
// Codableはjsonからオブジェクトを生成する際に役立つプロトコル
// Identifiableはidを識別子として自動で認識する
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    // ファイル隠蔽
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    // 座標データを扱いやすくするプロパティ
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // CaseIterableは全caseをCategory.allCasesで配列として取得できるようにするプロトコル
    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

// extensionでプロパティを追加
extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
