//
//  RootView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            AppView()
        }
        .frame(minWidth: 500, minHeight: 500)
    }
}

#Preview {
    RootView()
}
