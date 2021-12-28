//
//  BookModel.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation

//MARK: - BOOK MODEL
struct Book: Codable {
    let kind: String?
    let totalItems: Int
    let items: [Item]
}

struct Item: Codable {
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let description: String?
    let imageLinks: ImageLinks?
}

struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}
