//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by FFFK10 on 2021/08/02.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            LandmarkList()    // トップビュー
                .environmentObject(UserData())
        }
    }
}
