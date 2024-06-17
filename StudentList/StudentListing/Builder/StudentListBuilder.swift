//
//  StudentListBuilder.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation
import UIKit

final class StudentListBuilder {
    
    static func build() -> UIViewController {
        let viewModel = StudentListViewModel()
        let viewController = StudentListViewController(viewModel: viewModel)
        return viewController
    }
}
