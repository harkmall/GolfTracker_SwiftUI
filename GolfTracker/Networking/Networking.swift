//
//  Networking.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation
import Combine
import AWSSigner

struct Networking {

    enum NetworkingError: Error {
        case signingFailed
    }

    static func getCourses(query: String?) -> AnyPublisher<[GolfCourse], Error> {
        let queryItems = [URLQueryItem(name: "name", value: query)]
        var url = URLComponents(string:"https://api.golfbert.com/v1/courses")!
        url.queryItems = queryItems
        let urlRequest = URLRequest(url: url.url!).signed

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: ResponseWrapper<GolfCourse>.self, decoder: JSONDecoder())
            .map { $0.resources }
            .eraseToAnyPublisher()
    }
}
