//
//  SignupModel.swift
//  e-queue
//
//  Created by Muslim on 27/01/23.
//

import Foundation

struct SignupModel: Codable {
    let code: Int?
    let message: String
    let data: SignupDataModel?
    let name: String?
    let status: Int?
    let type: String?
    let errors: Errors?
}

// MARK: - DataClass
struct SignupDataModel: Codable {
    let id: Int
    let phoneNumber: String
    let status: Int

    enum CodingKeys: String, CodingKey {
        case id
        case phoneNumber = "phone_number"
        case status
    }
}

// MARK: - Errors
struct Errors: Codable {
    let phoneNumber: String

    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
    }
}
