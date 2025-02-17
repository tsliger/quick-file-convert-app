//
//  UploaderView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct UploaderView: View {
    @State private var isDropTargeted = false
    
    var body: some View {
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
            .padding()
            .navigationTitle("Select Files")
    }
    
    func process(urls: [URL]) {
        for url in urls {
            debugPrint("Dropped file: \(url.path)")
        }
    }
    
    func animateDrop(at: CGPoint) {}
}

#Preview {
    UploaderView()
}

