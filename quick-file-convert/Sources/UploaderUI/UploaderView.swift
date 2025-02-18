//
//  UploaderView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct UploaderView: View {
    let store: StoreOf<Uploader>
    @State private var isDropTargeted = false
    @State private var importing = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Add Files") {
                    importing = true
                }
                .fileImporter(
                    isPresented: $importing,
                    allowedContentTypes: [.image, .video, .audio]
                ) { result in
                    switch result {
                    case .success(let file):
                        print(file.absoluteString)
                        let url = file.absoluteURL
                        store.send(.addFile(url))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .controlSize(.extraLarge)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Files: \(store.files.count)")
                    .font(.subheadline)
            }
            .padding(.horizontal)
            
            Text("Drop Files Here")
                .fontWeight(.semibold)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, minHeight: 200)
                .dropDestination(for: URL.self) { receivedURLs, location in
                    animateDrop(at: location)
                    process(urls: receivedURLs)
                    return true
                } isTargeted: {
                    isDropTargeted = $0
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 3)
                        .opacity(isDropTargeted ? Double(0.5) : Double(0.15))
                        .animation(.easeInOut(duration: 0.2), value: isDropTargeted)
                )
                .cornerRadius(CGFloat(8))
                .padding(.horizontal)
                .navigationTitle("Select Files")
            
        }
        .padding(.vertical)
    }
    
    func process(urls: [URL]) {
        for url in urls {
            store.send(.addFile(url))
        }
    }
    
    func animateDrop(at: CGPoint) {}
}

#Preview {
    UploaderView(store: Store(initialState: Uploader.State(), reducer: { Uploader() }))
}
