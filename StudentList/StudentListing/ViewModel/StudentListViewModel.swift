//
//  StudentListViewModel.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation

final class StudentListViewModel {
    private var offset: Int = AppConstants.PAGE_LIMIT
    private var isLoading: Bool = false
    var searchString: String = AppConstants.EMPTY_STRING
    var students: [Student] = []
    var shouldHideBackgroundView: Bool = true

    var reloadTableViewClosure: (() -> Void)?
    var showLoadingClosure: ((Bool) -> Void)?

    init() {
        loadStudents(searchString: AppConstants.EMPTY_STRING)
    }

    func loadStudents(searchString: String) {
        guard isLoading == false else { return }
        isLoading = true
        showLoadingClosure?(true)
        let query = ["search" : searchString]
        let request = StudentRequest(queryParams: query)
        
        NetworkManager.shared.performRequest(request) { [weak self] (result: Result<[Student], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let students):
                self.students.append(contentsOf: students)
                self.offset += students.count
            case .failure(let error):
                print("Error fetching students: \(error)")
            }
            self.isLoading = false
            self.showLoadingClosure?(false)
            self.shouldHideBackgroundView = self.students.count > 0
            self.reloadTableViewClosure?()
        }
    }

    func searchStudents(searchString: String) {
        offset = 0
        students = []
        loadStudents(searchString: searchString)
    }
}
