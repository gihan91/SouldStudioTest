//
//  BookService.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation
import Alamofire

enum BookService: APIConfiguration {
    
    case getBookList(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getBookList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getBookList:
            return "books/v1/volumes"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getBookList:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ServerParams.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getBookList(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        print("url request is \(urlRequest)")
        return urlRequest
    }
}
