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
        debouncedSearch(query: searchText)
    }
    
    private func debouncedSearch(query: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(performSearch(_:)), object: query)
        perform(#selector(performSearch(_:)), with: query, afterDelay: 0.5)
    }
    
    @objc private func performSearch(_ query: String) {
        viewModel.searchStudents(query: query)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        let student = viewModel.filteredStudents[indexPath.row]
        cell.configure(with: student)
        
        if indexPath.row == viewModel.filteredStudents.count - 1 {
            viewModel.loadStudents(query: viewModel.currentQuery)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentViewController = viewController else { return }
        let student = viewModel.filteredStudents[indexPath.row]
        StudentListingRouter.navigateToStudentDetail(from: currentViewController, with: student)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
