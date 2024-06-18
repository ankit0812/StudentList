//
//  GenericBackgroundView.swift
//  StudentList
//
//  Created by KingpiN on 18/06/24.
//

import UIKit

class GenericBackgroundView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
    }()
    
    init(image: UIImage?, labelText: String) {
        super.init(frame: .zero)
        setupView()
        imageView.image = image
        label.text = labelText
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        addSubview(imageView)
        addSubview(label)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.setCenterX()
        imageView.setCenterY()
        imageView.setWidth(width: self.widthAnchor, multiplier: 0.8)
        imageView.setHeight(height: self.heightAnchor, multiplier: 0.4)
        
        label.setTop(with: imageView.bottomAnchor, constant: 20)
        label.setCenterX()
        label.setWidth(width: self.widthAnchor, multiplier: 0.8)
    }
}
