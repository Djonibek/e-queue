//
//  PasswordConfirmModel.swift
//  e-queue
//
//  Created by Muslim on 27/01/23.
//

import Foundation

struct PasswordConfirmModel: Codable {
    let code: Int
    let message: String
    let data: PasswordConfirmDataModel?
    let name: String?
    let status: Int?
    let type: String?
}

// MARK: - DataClass
struct PasswordConfirmDataModel: Codable {
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
