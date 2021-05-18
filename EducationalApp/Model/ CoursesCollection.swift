//
//   CoursesCollection.swift
//  EducationalApp
//
//  Created by F_Sur on 19/05/2021.
//

import Foundation


struct CoursesCollection {
    
    let courseName: String?
    let courseCode: String?
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

