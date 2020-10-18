//
//  ResponseWrapper.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let resources: [T]
}
