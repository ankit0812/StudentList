//
//  StudentDetailBuilder.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation
import UIKit

final class StudentDetailBuilder {
    static func build(with student: Student) -> UIViewController {
        let viewModel = StudentDetailViewModel(student: student)
        let viewController = StudentDetailViewController(viewModel: viewModel)
        return viewController
    }
}
