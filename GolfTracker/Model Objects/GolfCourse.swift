//
//  GolfCourse.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation
import CoreLocation

struct GolfCourse: Codable, Identifiable {
    let id: Int
    let name: String?
    let address: Address?
    let phoneNumber: String?
    let coordinates: CLLocationCoordinate2D

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case phoneNumber = "phonenumber"
        case address
        case coordinates
    }
}

struct Address: Codable {
    let street: String?
    let city: String?
    let state: String?
    let zip: String
    let country: String?
}
