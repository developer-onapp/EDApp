//
//  Student.swift
//  EducationalApp
//
//  Created by F_Sur on 19/05/2021.
//

import Foundation
import FirebaseFirestoreSwift


public struct StudentCollection: Codable {
    
    let firstName: String?
    let lastName: String?
    let idNumber: String?
    let email: String?
    let password: String?
    let lastUpdated: Date?
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case idNumber
        case email
        case password
        case lastUpdated
    }
    
}

