//
//  DemoURL.swift
//  Cassini
//
//  Created by JoyChan on 2018/10/29.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import Foundation

struct DemoURL {
    static let MyFavorite = URL(string: "https://www.jyc1998.cn/img/aaa.jpg")
    
    static var NASA: Dictionary<String, URL> = {
        let NASAURLStrings = [
            "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String, URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
