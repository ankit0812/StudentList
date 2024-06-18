//
//  StudentListViewDataSourceDelegate.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

final class StudentListViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    private var viewModel: StudentListViewModel
    private weak var viewController: UIViewController?
    
    init(viewModel: StudentListViewModel, viewController: UIViewController) {
        self.viewModel = viewModel
        self.viewController = viewController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debouncedSearch(searchString: searchText)
    }
    
    private func debouncedSearch(searchString: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(performSearch(_:)), object: searchString)
        perform(#selector(performSearch(_:)), with: searchString, afterDelay: 0.5)
    }
    
    @objc private func performSearch(_ searchString: String) {
        viewModel.searchStudents(searchString: searchString)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        let student = viewModel.students[indexPath.row]
        cell.configure(with: student)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentViewController = viewController else { return }
        let student = viewModel.students[indexPath.row]
        StudentListingRouter.navigateToStudentDetail(from: currentViewController, with: student)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
