//
//  TypeSelectionUI.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct TypeSelectionView: View {
    @State private var files: [File] = [
        File(name: "test.png",  ext: "png", type: "Image"),
    ]
    var body: some View {
        List {
            ForEach(files) { file in
                FileRowView(file: file)
            }
        }
        .navigationTitle("File Type Selection")
    }
}

#Preview {
    TypeSelectionView()
}
