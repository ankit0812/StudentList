//
//  StudentListView.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

final class StudentListView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StudentCell.self, forCellReuseIdentifier: "StudentCell")
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = AppLiterals.SEARCH
        return searchBar
    }()
    
    let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    let tableBackgroundView: GenericBackgroundView = {
        let tableBackgroundView = GenericBackgroundView(image: UIImage(named: "ico_student"), labelText: "No Students!")
        tableBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return tableBackgroundView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = AppColors.DEFAULT_BACKGROUND_COLOR
        
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(loader)
        
        tableView.backgroundView = tableBackgroundView
        tableView.backgroundView?.isHidden = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        searchBar.setTop(with: safeAreaLayoutGuide.topAnchor)
        searchBar.setLeading(with: leadingAnchor)
        searchBar.setTrailing(with: trailingAnchor)

        tableView.setTop(with: searchBar.bottomAnchor)
        tableView.setLeading(with: leadingAnchor)
        tableView.setTrailing(with: trailingAnchor)
        tableView.setBottom(with: bottomAnchor)

        loader.setCenterX()
        loader.setCenterY()
        
        tableBackgroundView.setFullOnSuperView()
    }
}
