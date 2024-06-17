//
//  StudentListRouter.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation
import UIKit

final class StudentListingRouter {
    
    static func navigateToStudentDetail(from viewController: UIViewController, with student: Student) {
        let detailVC = StudentDetailBuilder.build(with: student)
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
}
