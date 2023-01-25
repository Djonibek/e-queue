//
//  LoginModel.swift
//  e-queue
//
//  Created by Fedya on 25/01/23.
//

import Foundation

struct LoginModel: Codable {
    let code: Int
    let message: String
    let data: LoginDataModel?
    let errors: ErrorModel?
}

// MARK: - DataClass
struct LoginDataModel: Codable {
    let id: Int
    let token, firstName, lastName: String
    let status, createdAt, updatedAt: Int
    let phoneNumber: String
    let role, step: Int
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, token
        case firstName = "first_name"
        case lastName = "last_name"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case phoneNumber = "phone_number"
        case role, step, avatar
    }
}

struct ErrorModel: Codable {
    let password: String
}
