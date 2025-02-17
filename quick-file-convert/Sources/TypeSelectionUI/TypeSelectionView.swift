//
//  TypeSelectionUI.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct File: Identifiable {
    let id = UUID()
    var name: String

    var type: String
 }


var files = [
    File(name: "test.png", type: "Image"),
    File(name: "test.mp4", type: "Video"),
    File(name: "audio_file.wav", type: "Audio"),
]

struct TypeSelectionView: View {
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
