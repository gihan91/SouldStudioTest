//
//  BookModel.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation

struct Book: Codable {
    let kind: String?
    let totalItems: Int
    let items: [Item]
}

struct Items: Codable {
    
}
