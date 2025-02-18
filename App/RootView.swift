//
//  RootView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
//    let store = Store(initialState: _)
    
    var body: some View {
        NavigationStack {
            AppView()
        }
        .frame(minWidth: 500, minHeight: 350)
        .toolbar {
            Button(action: {
               // Your code here
             }) {
                 HStack {
                     Label("Settings", systemImage: "gearshape.fill")
                     Text("Settings")
                 }
             }
        }
    }
}

#Preview {
    RootView()
}
