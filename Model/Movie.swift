//
//  Movie.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
