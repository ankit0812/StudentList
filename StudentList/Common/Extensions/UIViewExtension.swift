//
//  UIViewExtension.swift
//  StudentList
//
//  Created by KingpiN on 18/06/24.
//

import UIKit

extension UIView {
    
    func setHeight(height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setHeight(height: NSLayoutDimension, multiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: height, multiplier: multiplier).isActive = true
    }
    
    func setWidth(width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setWidth(width: NSLayoutDimension, multiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: width, multiplier: multiplier).isActive = true
    }
    
    func setHeightAndWidth(height: CGFloat, width: CGFloat) {
        setHeight(height: height)
        setWidth(width: width)
    }
    
    func setHeightAndWidth(height: NSLayoutDimension, width: NSLayoutDimension) {
        setHeight(height: height)
        setWidth(width: width)
    }
    
    func setTrailing(with: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
    func setLeading(with: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
    func setTop(with:NSLayoutYAxisAnchor, constant:CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
    func setTopGreaterThanOrEqualTo(with: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(greaterThanOrEqualTo: with, constant: constant).isActive = true
    }
    
    func setTopLessThanOrEqualTo(with: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(lessThanOrEqualTo: with, constant: constant).isActive = true
    }
    
    func setBottom(with: NSLayoutYAxisAnchor,constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: with, constant: constant).isActive = true
    }
    
    func setBottomGreaterThanOrEqualTo(with: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(greaterThanOrEqualTo: with, constant: constant).isActive = true
    }
    
    func setTrailingGreaterThanOrEqualTo(with: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(greaterThanOrEqualTo: with, constant: constant).isActive = true
    }
    
    func setLeadingGreaterThanOrEqualTo(with: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(greaterThanOrEqualTo: with, constant: constant).isActive = true
    }
    
    func setFullOnSuperView(safeArea: Bool = true) {
        if let superViewOfThis = superview {
            self.setTop(with: superViewOfThis.safeAreaLayoutGuide.topAnchor)
            self.setBottom(with: superViewOfThis.safeAreaLayoutGuide.bottomAnchor)
            self.setLeading(with: superViewOfThis.safeAreaLayoutGuide.leadingAnchor)
            self.setTrailing(with: superViewOfThis.safeAreaLayoutGuide.trailingAnchor)
            self.setTop(with: superViewOfThis.topAnchor)
            self.setBottom(with: superViewOfThis.bottomAnchor)
            self.setLeading(with: superViewOfThis.leadingAnchor)
            self.setTrailing(with: superViewOfThis.trailingAnchor)
        }
    }
    
    func setCenterY() {
        if let superViewOfThis = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                self.centerYAnchor.constraint(equalTo: superViewOfThis.safeAreaLayoutGuide.centerYAnchor,
                                              constant: 0).isActive = true
            } else {
                self.centerYAnchor.constraint(equalTo: superViewOfThis.centerYAnchor,
                                              constant: 0).isActive = true
            }
        }
    }
    
    func setCenterY(constant: CGFloat) {
        if let superViewOfThis = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                self.centerYAnchor.constraint(equalTo: superViewOfThis.safeAreaLayoutGuide.centerYAnchor,
                                              constant: constant).isActive = true
            } else {
                self.centerYAnchor.constraint(equalTo: superViewOfThis.centerYAnchor,
                                              constant: constant).isActive = true
            }
        }
    }
    
    func setCenterX() {
        if let superViewOfThis = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                self.centerXAnchor.constraint(equalTo: superViewOfThis.safeAreaLayoutGuide.centerXAnchor,
                                              constant: 0).isActive = true
            } else {
                self.centerXAnchor.constraint(equalTo: superViewOfThis.centerXAnchor,
                                              constant: 0).isActive = true
            }
        }
    }
    
    func setCenterX(constant: CGFloat) {
        if let superViewOfThis = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                self.centerXAnchor.constraint(equalTo: superViewOfThis.safeAreaLayoutGuide.centerXAnchor,
                                              constant: constant).isActive = true
            } else {
                self.centerXAnchor.constraint(equalTo: superViewOfThis.centerXAnchor,
                                              constant: 0).isActive = true
            }
        }
    }
    
    func setCenterXto(xAnchor:NSLayoutXAxisAnchor, constant:CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: xAnchor,
                                      constant: constant).isActive = true
    }
    
    func setCenterYto(yAnchor:NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: yAnchor,
                                      constant: constant).isActive = true
    }
    
    func setCenterXto(with view: UIView,
                      relatedBy: NSLayoutConstraint.Relation = .equal,
                      multiplier: CGFloat = 1,
                      constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self,
                           attribute: .centerX,
                           relatedBy: relatedBy,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: multiplier,
                           constant: constant).isActive = true
    }
    
    func setCenterYto(with view: UIView,
                      relatedBy: NSLayoutConstraint.Relation = .equal,
                      multiplier: CGFloat = 1,
                      constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self,
                           attribute: .centerY,
                           relatedBy: relatedBy,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: multiplier,
                           constant: constant).isActive = true
    }
    
    func setCenter(){
        setCenterX()
        setCenterY()
    }
    
    func setCenter(xConstant: CGFloat, yConstant: CGFloat) {
        setCenterX(constant: xConstant)
        setCenterY(constant: yConstant)
    }

}
