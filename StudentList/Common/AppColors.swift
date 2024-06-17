//
//  AppColors.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

struct AppColors {
    static var DEFAULT_BACKGROUND_COLOR: UIColor = UIColor.white
}

enum ColorPalette {
    
    case primaryBackground
    case primaryText
    
    case secondaryBackground
    case secondaryText
        
    var color: UIColor {
        switch self {
        case .primaryBackground:
            return .white
        case .primaryText:
            return .black
            
        case .secondaryBackground:
            return .white
        case .secondaryText:
            return .gray
            
        }
    }
}
