//
//  JobsViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import Foundation

class JobsViewModel: ObservableObject {
    var navigationToDetailJob: ((Job, Bool) -> Void)?
}
