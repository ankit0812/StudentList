//
//  StudentListViewController.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

final class StudentListViewController: UIViewController {
    private var viewModel: StudentListViewModel
    private let studentListView = StudentListView()
    private var viewDelegate: StudentListViewDelegate!
    
    init(viewModel: StudentListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = studentListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = AppLiterals.STUDENTS
        setupDelegates()
    }
    
    private func setupDelegates() {
        viewDelegate = StudentListViewDelegate(viewModel: viewModel, viewController: self)
        studentListView.searchBar.delegate = viewDelegate
        studentListView.tableView.dataSource = viewDelegate
        studentListView.tableView.delegate = viewDelegate
    }
    
    private func setupBindings() {
        viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.studentListView.tableView.backgroundView?.isHidden = self?.viewModel.shouldHideBackgroundView ?? true
                self?.studentListView.tableView.reloadData()
            }
        }
        
        viewModel.showLoadingClosure = { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.studentListView.loader.startAnimating()
                } else {
                    self?.studentListView.loader.stopAnimating()
                }
            }
        }
    }
}
