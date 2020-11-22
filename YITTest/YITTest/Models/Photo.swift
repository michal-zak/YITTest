//
//  Photo.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import Foundation

var photos: [Photo] = []

struct Photo: Decodable {
    var id: Int
    var name: String
}
