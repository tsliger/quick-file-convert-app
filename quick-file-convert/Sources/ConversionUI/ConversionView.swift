//
//  ProgressView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct ConversionView: View {
//    @State private var progress = 0.1
    
    var body: some View {
        VStack {
            Text("Conversion Ready")
                .font(.largeTitle)
                .fontDesign(.serif)
            ProgressView()
                .progressViewStyle(.linear)
                .padding(.vertical, 30)
        }
        .padding()
    }
}

#Preview {
    ConversionView()
}
