//
//  TypeSelectionUI.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct TypeSelectionView: View {
    let store: StoreOf<Uploader>
    
    var body: some View {
        List {
            ForEach(store.files) { file in
                FileRowView(file: file)
            }
        }
        .navigationTitle("File Type Selection")
    }
}

#Preview {
    TypeSelectionView(store: Store(initialState: Uploader.State(), reducer: { Uploader() }))
}
