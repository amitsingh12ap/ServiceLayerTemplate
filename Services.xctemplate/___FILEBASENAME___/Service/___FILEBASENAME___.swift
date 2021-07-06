//
//  ServiceManager.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___Protocol {
    static let shared = ___FILEBASENAMEASIDENTIFIER___()
    private init() {}
    
    func callApi(with endPoint: ___VARIABLE_productName:identifier___Endpoints, parameters:inout Parameters, headers: HTTPHeaders?, requestType: ___VARIABLE_productName:identifier___HttpMethod, completion: @escaping NetworkRequestCompletion) {
        
        guard let url = URL(string: "\(endPoint.path)") else {
            return
        }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        do {
            try self.encode(urlRequest: &request, with: parameters)
            request.httpMethod = requestType.rawValue
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,                            // is there data
                      let response = response as? HTTPURLResponse,  // is there HTTP response
                      (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                      error == nil else {
                    completion(nil,nil,___VARIABLE_productName:identifier___Errors.invalidRequest) // was there no error, otherwise ...
                    return
                }
                completion(data,response,nil)
            }
            task.resume()
        } catch {
            completion(nil,nil,___VARIABLE_productName:identifier___Errors.invalidRequest)
        }
        
    }
    
    
    
}
