//
//  User.swift
//  RXSwiftDemo
//
//  Created by mac on 05/12/2022.
//

import Foundation


// MARK: - User
struct User: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [UserDetails]?
    let support: Support?
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage
        case total
        case totalPages
        case data, support
    }
}

// MARK: - Datum
struct UserDetails: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}


// MARK: - Support
struct Support: Codable {
    let url: String?
    let text: String?
}


