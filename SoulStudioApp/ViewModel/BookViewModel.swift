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
    
    //ViewModel Variables
    var bookList = BehaviorRelay<[Item]>(value: [Item]())
    var loadMoreBooks = BehaviorRelay<Bool>(value: false)
    var bookListItem: Int = 0
    
    func getBookList() -> Observable<Book> {
        return Observable.create { [unowned self] (observer) -> Disposable in
            return BookServiceClient.getBookList(startIndex: 0).subscribe { bookObject in
                observer.onNext(bookObject)
                bookList.accept(bookObject.items)
                observer.onCompleted()
            } onError: { error in
                observer.onError(error)
            }
        }
    }
    
    //Pagination Logic
    func loadMoreBookList() -> Observable<[Item]> {
        return Observable.create { [unowned self] (observer) -> Disposable in
            if loadMoreBooks.value {
                bookListItem += 1
            } else {
                bookListItem -= 1
            }
            return BookServiceClient.getBookList(startIndex: bookListItem).subscribe { bookList in
                observer.onNext(bookList.items)
                self.bookList.accept(self.bookList.value + bookList.items)
                observer.onCompleted()
            } onError: { error in
                observer.onError(error)
            }
        }
    }
}

