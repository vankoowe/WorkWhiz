//
//  SignInView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel: SignInViewModel

    var body: some View {
        Text("Sign In!")
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
