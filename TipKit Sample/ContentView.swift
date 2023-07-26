//
//  ContentView.swift
//  TipKit Sample
//
//  Created by Ming on 26/7/2023.
//

import SwiftUI
import TipKit

struct ContentView: View {
    var bookmarkTip = BookmarkTip()
    var body: some View {
        VStack {
            TipView(bookmarkTip, arrowEdge: .bottom)
            Button(action: {}) {
                Label("Bookmark", systemImage: "star")
            }
        }
        .padding()
        // Add task to load the tips config when app launch.
        .task {
            try? await Tips.configure {
                DisplayFrequency(.immediate)
                DatastoreLocation(.applicationDefault)
            }
        }
    }
}

// MARK: - Define tip's content here
struct BookmarkTip: Tip {
    // Set Image Icon
    var asset: Image? {
        Image(systemName: "star")
    }
    // Set Title
    var title: Text {
        Text("Click and Bookmark")
    }
    // Set Message to explain details
    var message: Text? {
        Text("Save this page and return here anytime.")
    }
}

#Preview {
    ContentView()
}
