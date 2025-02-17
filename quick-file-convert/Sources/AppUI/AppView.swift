//
//  AppView.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/16/25.
//

import SwiftUI

struct AppView: View {
    @State private var currentIndex = 0
    let views: [AnyView] = [
        AnyView(UploaderView()),
        AnyView(TypeSelectionUI()),
        AnyView(ScreenThree())
    ]

    var body: some View {
        VStack {
            views[currentIndex]
                .transition(.slide)
                .animation(.easeInOut, value: currentIndex)

            Spacer()
            HStack {
                Button(action: previousScreen) {
                    Text("Previous")
                        .padding(8)
                }
                .disabled(currentIndex == 0)
                .controlSize(.extraLarge)
                .keyboardShortcut(.cancelAction)

                Spacer()

                Button(action: nextScreen) {
                    Text(currentIndex != views.count - 1 ? "Next" : "Convert")
                        .padding(8)
                }
                .controlSize(.extraLarge)
                .buttonStyle(.borderedProminent)
                .keyboardShortcut(.defaultAction)
            }
            .padding()
        }
    }

    func previousScreen() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    func nextScreen() {
        if currentIndex < views.count - 1 {
            currentIndex += 1
        }
    }
}

#Preview {
    AppView()
}

struct ScreenTwo: View {
    var body: some View {
        Text("Screen Two")
            .font(.largeTitle)
            .padding()
    }
}

struct ScreenThree: View {
    var body: some View {
        Text("Screen Three")
            .font(.largeTitle)
            .padding()
    }
}
