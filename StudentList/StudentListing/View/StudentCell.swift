//
//  StudentCell.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import UIKit

final class StudentCell: UITableViewCell {
    private let studentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorPalette.primaryText.color
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorPalette.secondaryText.color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(studentImageView)
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        studentImageView.setLeading(with: leadingAnchor, constant: 16)
        studentImageView.setCenterY()
        studentImageView.setWidth(width: 40)
        studentImageView.setHeight(height: 40)

        nameLabel.setLeading(with: studentImageView.trailingAnchor, constant: 16)
        nameLabel.setTop(with: topAnchor, constant: 8)

        phoneNumberLabel.setLeading(with: nameLabel.leadingAnchor)
        phoneNumberLabel.setTop(with: nameLabel.bottomAnchor, constant: 4)
        phoneNumberLabel.setBottom(with: bottomAnchor, constant: -8)
    }
    
    func configure(with student: Student) {
        studentImageView.image = UIImage(named: "ico_student")
        nameLabel.text = student.name
        phoneNumberLabel.text = student.phone
    }
}
