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
    // change image url to my site's demo pic ,cuz the action that fitch the origin pic is too slow
    static var NASA: Dictionary<String, URL> = {
        let NASAURLStrings = [
            "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "https://www.jyc1998.cn/wp-content/uploads/2018/08/cropped-7dc8607c8e5fad10c273abc96f90e123074b31ce-1.jpg@1320w_1320h-1.jpg",
            "Saturn" : "https://www.jyc1998.cn/wp-content/uploads/2018/10/panic.jpg"
        ]
        var urls = Dictionary<String, URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
