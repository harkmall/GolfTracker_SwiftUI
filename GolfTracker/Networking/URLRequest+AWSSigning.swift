//
//  URLRequest+AWSSigning.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation
import AWSSigner
import NIOHTTP1

extension URLRequest {
    var signed: URLRequest {
        guard let url = self.url else {
            fatalError("url is nil")
        }
        let awsAccount = StaticCredential(accessKeyId: NetworkingSecrets.accessKey.rawValue, secretAccessKey: NetworkingSecrets.secretKey.rawValue)
        let signer = AWSSigner(credentials: awsAccount, name: "execute-api", region: "us-east-1")
        //this API is only GET
        let signedHeaders = signer.signHeaders(url: url, method: .GET, headers: .init([("x-api-key", NetworkingSecrets.apiKey.rawValue)]))

        var urlRequest = URLRequest(url: url)
        signedHeaders.forEach {
            urlRequest.addValue($0.1, forHTTPHeaderField: $0.0)
        }
        return urlRequest
    }
}
