//
//  LoadingView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    let loadingText: String
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text(loadingText)
                    ProgressView().progressViewStyle(.circular)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundStyle(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }
}

#Preview {
    LoadingView(isShowing: .constant(true), loadingText: "test", content: { Text("") })
}
