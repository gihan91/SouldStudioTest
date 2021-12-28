//
//  BookListViewController.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class BookListViewController: UIViewController, Storyboard, UIScrollViewDelegate {
    
    //MARK: - UI Outlets
    @IBOutlet weak var tblBookList: UITableView!
    
    //MARK: - Variables
    weak var coordinator: MainNavigator?
    var bookViewModel = BookViewModel()
    var disposeBag = DisposeBag()
    
    // MARK: - Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDelegates()
        self.bindBookTableView()
        self.tblBookList.rowHeight = 100
        tblBookList.rowHeight = UITableView.automaticDimension
        self.loadMoreData()

    }
    
    private func fetchBookList() {
        bookViewModel.getBookList().subscribe { bookList in }.disposed(by: disposeBag)
    }
    
    private func setupDelegates() {
        self.tblBookList.rx.setDelegate(self).disposed(by: disposeBag)
        tblBookList.register(UINib(nibName: "BookListTableViewCell", bundle: nil), forCellReuseIdentifier: "BookDetailCell")
    }

}

extension BookListViewController {
    
    private func bindBookTableView() {
        self.bookViewModel.bookList.observe(on: MainScheduler.instance).bind(to: self.tblBookList.rx.items){(tableView, row, model) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookDetailCell", for: IndexPath.init(row: row, section: 1)) as!
            BookListTableViewCell
            cell.lblBookTitle.text = model.volumeInfo?.title
            cell.lblBookDescription.text = model.volumeInfo?.description ?? "No Description"
            cell.downloadImage(with: (model.volumeInfo?.imageLinks!.smallThumbnail)!)
            return cell
        }
        
        self.fetchBookList()
    }
    
    private func loadMoreData() {
        tblBookList.rx.didEndDragging.subscribe { [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.tblBookList.contentOffset.y
            let contentHeight = self.tblBookList.contentSize.height
            if offSetY > (contentHeight - self.tblBookList.frame.size.height - 100) {
                self.bookViewModel.loadMoreBooks.accept(true)
                self.bookViewModel.loadMoreBookList().asObservable().subscribe { _ in
                }.disposed(by: self.disposeBag)
            }
        }.disposed(by: disposeBag)
    }
    
}
