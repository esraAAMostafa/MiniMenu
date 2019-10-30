//
//  NetworkManager.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManager {
    func call<T: Codable>(endPoint: EndPoint, for output: T, completionHandler: @escaping (T) -> Void, failHandler: @escaping (LocalError) -> Void)
}

class NetworkManagerImpl: NetworkManager {
    
    func call<T: Codable>(endPoint: EndPoint, for output: T, completionHandler: @escaping (T) -> Void, failHandler: @escaping (LocalError) -> Void) {

        
        guard let urlString = endPoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            print("wrong request url")
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue

        Alamofire.request(urlRequest).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if (200 ... 299).contains(response.response!.statusCode) {
                    guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                        print("fail to map object response")
                        return
                    }
                    completionHandler(response)
                } else {
                    guard let error = try? JSONDecoder().decode(APIError.self, from: response.data!) else {
                        print("fail to map error response")
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

