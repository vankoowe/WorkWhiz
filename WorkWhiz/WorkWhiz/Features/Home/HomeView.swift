//
//  HomeView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 22.04.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        Text("Home!")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
