//
//  AppetizerModel.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import Foundation

struct AppetizerModel: Identifiable, Decodable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String
    let description: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [AppetizerModel]
}


struct MockData {
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let sampleAppetizer = AppetizerModel(id: 0000002,
                                           name: "Blackened Shrimp",
                                           price: 6.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
                                           description: "Seasoned shrimp from the depths of the Atlantic Ocean.",
                                           calories: 450,
                                           carbs: 3,
                                           protein: 4)
}
