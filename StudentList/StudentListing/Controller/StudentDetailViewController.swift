//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

final class StudentDetailViewController: UIViewController {
    private let viewModel: StudentDetailViewModel
    
    private let studentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = ColorPalette.primaryText.color
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = ColorPalette.secondaryText.color
        return label
    }()
    
    init(viewModel: StudentDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        view.backgroundColor = AppColors.DEFAULT_BACKGROUND_COLOR
        navigationItem.title = viewModel.student.name
        
        view.addSubview(studentImageView)
        view.addSubview(nameLabel)
        view.addSubview(phoneNumberLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            studentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            studentImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40),
            studentImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40),
            
            nameLabel.topAnchor.constraint(equalTo: studentImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureUI() {
        studentImageView.image = UIImage(named: "ico_student")
        nameLabel.text = viewModel.student.name
        phoneNumberLabel.text = viewModel.student.phone
    }
}
