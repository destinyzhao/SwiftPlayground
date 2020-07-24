//
//  Song.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
    
}
