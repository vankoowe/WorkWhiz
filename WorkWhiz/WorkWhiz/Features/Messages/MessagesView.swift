//
//  MessagesView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var viewModel: MessagesViewModel

    var body: some View {
        Text("Messages!")
    }
}

#Preview {
    MessagesView(viewModel: MessagesViewModel())
}
