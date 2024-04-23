//
//  ProfileView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        Text("Profile!")
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
