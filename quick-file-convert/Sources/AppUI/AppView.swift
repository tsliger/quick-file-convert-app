//
//  AppView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @State private var currentIndex = 0
//    let store = Store(initialState: Uploader.State(), reducer: { Uploader() })
    private let store: Store<Uploader.State, Uploader.Action>
    private let views: [AnyView]
    
    init() {
        self.store = Store(initialState: Uploader.State(), reducer: { Uploader() })
        self.views = [
            AnyView(UploaderView(store: store)),
            AnyView(TypeSelectionView()),
            AnyView(ProgressView())
        ]
    }
    
    var body: some View {
        VStack {
            ZStack {
                views[currentIndex]
                    .transition(.opacity)
                    .animation(.easeInOut, value: currentIndex)
                    .id(currentIndex)
            }
            
            Spacer()
            HStack {
                Button(action: previousScreen) {
                    Text("Previous")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .frame(width: 100)
                .disabled(currentIndex == 0)
                .controlSize(.extraLarge)
                .keyboardShortcut(.cancelAction)

                Spacer()

                Button(action: nextScreen) {
                    Text(currentIndex != views.count - 1 ? "Next" : "Convert")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .contentTransition(.numericText())
                }
                .keyboardShortcut(.defaultAction)
                .frame(width: 100)
                .buttonStyle(.borderedProminent)
                .tint(currentIndex == views.count - 1 ? .pink : .primary)
                .controlSize(.extraLarge)
                
            }
            .padding()
        }
    }

    func previousScreen() {
        withAnimation {
            if currentIndex > 0 {
                currentIndex -= 1
            }
        }
    }

    func nextScreen() {
        withAnimation {
           if currentIndex < views.count - 1 {
               currentIndex += 1
           }
       }
    }
}

#Preview {
    AppView()
}
