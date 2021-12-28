//
//  BookServiceClient.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class BookServiceClient {
    
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible)
                .validate(statusCode: 200..<300)
                .responseDecodable { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }.asObservable()
    }
    
    static func getBookList(startIndex: Int) -> Observable<Book> {
        return request(BookService.getBookList(parameters: ["q": "flowers", "startIndex": startIndex, "maxResults": 10]))
    }
}
