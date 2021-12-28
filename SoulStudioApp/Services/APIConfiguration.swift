//
//  APIConfiguration.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
