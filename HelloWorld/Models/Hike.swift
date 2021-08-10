//
//  Hike.swift
//  Landmarks
//
//  Created by FFFK10 on 2021/08/11.
//

import SwiftUI

struct Hike: Codable, Hashable, Identifiable {
    var name: String
        var id: Int
        var distance: Double
        var difficulty: Int
        var observations: [Observation]
    
    static var formatter = LengthFormatter()    // 距離の単位を変換するクラス
        
        var distanceText: String {
            return Hike.formatter
                .string(fromValue: distance, unit: .kilometer)
        }
     
        struct Observation: Codable, Hashable {
            var distanceFromStart: Double
            
            var elevation: Range<Double>
            var pace: Range<Double>
            var heartRate: Range<Double>
        }
}
