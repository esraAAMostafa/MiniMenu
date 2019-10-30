//
//  NetworkManager.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func callAPI<T: Codable>(_ output: T, endPoint: EndPoint, completionHandler: @escaping (T) -> Void, failHandler: @escaping (LocalError) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func callAPI<T: Codable>(_ output: T, endPoint: EndPoint, completionHandler: @escaping (T) -> Void, failHandler: @escaping (LocalError) -> Void) {

        let method = HTTPMethod(rawValue: endPoint.method)

        Alamofire.request(endPoint.url, method: method ?? .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if (200 ... 299).contains(response.response!.statusCode) {
                    guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                        failHandler(LocalError(message: "Mapping Failed"))
                        return
                    }
                    completionHandler(response)
                } else {
                    guard let error = try? JSONDecoder().decode(APIError.self, from: response.data!) else {
                        failHandler(LocalError(message: "fail to map error response"))
                        return
                    }
                    failHandler(error.errors[0])
                }
            case .failure(let error):
                failHandler(LocalError(message: error.localizedDescription))
            }
        }
    }
}

