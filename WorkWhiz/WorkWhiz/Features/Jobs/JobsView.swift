//
//  JobsView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct JobsView: View {
    @StateObject var viewModel: JobsViewModel

    var body: some View {
        Text("Jobs!")
    }
}

#Preview {
    JobsView(viewModel: JobsViewModel())
}
