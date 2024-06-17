//
//  StudentListViewModel.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation

final class StudentListViewModel {
    private var students: [Student] = []
    private var currentPage: Int = 1
    private var isLoading: Bool = false
    var currentQuery: String = AppConstants.EMPTY_STRING

    var filteredStudents: [Student] = []

    var reloadTableViewClosure: (() -> Void)?
    var showLoadingClosure: ((Bool) -> Void)?

    init() {
        loadStudents(query: AppConstants.EMPTY_STRING)
    }

    func loadStudents(query: String) {
        guard !isLoading else { return }
        isLoading = true
        showLoadingClosure?(true)
        currentQuery = query
        
        let request = StudentRequest(query: query)
        
        NetworkManager.shared.performRequest(request) { [weak self] (result: Result<[Student], Error>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let students):
                if self.currentPage == 1 {
                    self.students = students
                } else {
                    self.students.append(contentsOf: students)
                }
                self.filteredStudents = self.students
                self.currentPage += 1
                
            case .failure(let error):
                print("Error fetching students: \(error)")
            }
            self.isLoading = false
            self.showLoadingClosure?(false)
            self.reloadTableViewClosure?()
        }
    }

    func searchStudents(query: String) {
        currentPage = 1
        loadStudents(query: query)
    }
}
