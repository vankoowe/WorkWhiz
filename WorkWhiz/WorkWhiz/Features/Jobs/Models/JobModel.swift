//
//  JobModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation

struct Job: Codable {
    var image: String
    var posterImage: String
    var posterName: String
    var posterBadge: String
    var title: String
    var description: String
    var rating: Double
    var ratingCount: Int
    var startingPrice: Int
}

extension Job {
    public static var mockJob: Job = .init(image: "mockImage",
                                           posterImage: "mobileApp",
                                           posterName: "vankoowe",
                                           posterBadge: "New Seller",
                                           title: "Integrate KeychainSwift to your project",
                                           description: "The project is about to be integrate KeychainSwift into your project.",
                                           rating: 4.9,
                                           ratingCount: 40,
                                           startingPrice: 15)
}
