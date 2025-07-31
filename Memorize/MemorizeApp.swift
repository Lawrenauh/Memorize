//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/12.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorizeGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game)
        }
    }
}
