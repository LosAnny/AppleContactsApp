//
//  Contact.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 04.10.2022.
//

import Foundation

struct Contact {
    
    var profileImage: String?
    var firstName: String
    var secondName: String?
    var isElected: Bool = false
    var nameCompany: String?
    var phoneNumber: [Int]?
    var emailAddress: String?
    var notes: String?
}
