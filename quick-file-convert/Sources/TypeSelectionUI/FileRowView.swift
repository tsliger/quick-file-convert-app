//
//  FileRowView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct FileRowView: View {
    var file: File
    
    var imageTypes = ["png", "jpeg", "webp", "gif", "avif"]
    var videoTypes = ["mp4", "mov", "avi", "webm"]
    var audioTypes = ["mp3", "wav", "aac", "ogg"]
    @State private var selectedValue: String = ""
    
    init(file: File) {
        self.file = file
        
        
        if file.type == "Image" {
            if let index = imageTypes.firstIndex(of: file.ext) {
                imageTypes.remove(at: index)
            }
        } else if file.type == "Video" {
            if let index = videoTypes.firstIndex(of: file.ext) {
                videoTypes.remove(at: index)
            }
        } else if file.type == "Audio" {
            if let index = audioTypes.firstIndex(of: file.ext) {
                audioTypes.remove(at: index)
            }
        }
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(file.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                HStack(spacing: 3) {
                    Label(file.type, systemImage: "doc.plaintext.fill")
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
            }
            Spacer()
            Picker("", selection: $selectedValue) {
                if file.type == "Image" {
                    ForEach(imageTypes, id: \.self) { type in
                        Text(type)
                    }
                } else if file.type == "Video" {
                    ForEach(videoTypes, id: \.self) { type in
                        Text(type)
                    }
                } else if file.type == "Audio" {
                    ForEach(audioTypes, id: \.self) { type in
                        Text(type)
                    }
                }
            }
            .onAppear {
                if file.type == "Image" {
                    let filteredImageTypes = imageTypes
                    selectedValue = filteredImageTypes.first!
                } else if file.type == "Video" {
                    let filteredVideoTypes = videoTypes
                    selectedValue = filteredVideoTypes.first!
                } else if file.type == "Audio" {
                    let filteredAudioTypes = audioTypes
                    selectedValue = filteredAudioTypes.first!
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: 120)
            Button(action: {
                print("Button tapped")
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 10))
                    .padding(5)
                    .foregroundColor(.white)
            }
            .clipShape(Circle())
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    FileRowView(file: File(name: "test", ext: "png", type: "Audio"))
}
