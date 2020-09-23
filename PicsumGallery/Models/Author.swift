//
//  Author.swift
//  PicsumGallery
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation

// MARK: - Author
struct Author: Codable {
    let format: String
    let width, height: Int
    let filename: String
    let id: Int
    let author: String
    let authorURL, postURL: String

    enum CodingKeys: String, CodingKey {
        case format, width, height, filename, id, author
        case authorURL = "author_url"
        case postURL = "post_url"
    }
}
