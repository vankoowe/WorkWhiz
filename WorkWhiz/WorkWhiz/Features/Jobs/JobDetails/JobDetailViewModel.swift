//
//  JobDetailViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation

class JobDetailViewModel: ObservableObject {
    var job: Job
    @Published var isSaved: Bool
    var goBack: Event

    init(job: Job, isSaved: Bool, goBack: @escaping Event) {
        self.job = job
        self.isSaved = isSaved
        self.goBack = goBack
    }
}
