//
//  BookViewModel.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import Foundation
import RxCocoa
import RxSwift

class BookViewModel {
    
    var bookList = BehaviorRelay<[Item]>(value: [Item]())
    
    func getBookList() -> Observable<Book> {
        return Observable.create { [unowned self] (observer) -> Disposable in
            return BookServiceClient.getBookList().subscribe { bookObject in
                observer.onNext(bookObject)
                bookList.accept(bookObject.items)
                observer.onCompleted()
            } onError: { error in
                observer.onError(error)
            }
        }
    }
}

