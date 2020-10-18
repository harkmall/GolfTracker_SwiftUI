//
//  Scorecard.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation
import CoreLocation

struct Scorecard: Codable {
    let courseId: Int
    let courseName: String
    let teeBoxes: [TeeBox]

    enum CodingKeys: String, CodingKey {
        case courseId = "courseid"
        case courseName = "coursename"
        case teeBoxes = "holeteeboxes"
    }
}

struct TeeBox: Codable {
    let holeId: Int
    let holeNumber: Int?
    let teeBoxType: String?
    let color: String?
    let length: Int?
    let par: Int?
    let handicap: Int?
    let coordinates: CLLocationCoordinate2D

    enum CodingKeys: String, CodingKey {
        case holeId = "holeId"
        case holeNumber = "holeNumber"
        case teeBoxType = "teeboxtype"
        case color
        case length
        case par
        case handicap
        case coordinates
    }
}
