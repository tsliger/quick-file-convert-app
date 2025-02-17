//
//  FileRowView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct FileRowView: View {
    var file: File
    
    var friuts = ["apple", "banana", "orange", "kiwi"]
    @State private var selectedFruit: String = "banana"


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
            Picker("", selection: $selectedFruit) {
                ForEach(friuts, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: 120)
        }
        .padding(.vertical, 6)
    }
}

