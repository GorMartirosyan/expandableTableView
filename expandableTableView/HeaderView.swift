//
//  HeaderView.swift
//  expandableTableView
//
//  Created by Gor on 6/12/20.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func callHeader(_ header: HeaderView)
}

let downArrow = UIImage(systemName: "arrowtriangle.down")
let upArrow = UIImage(systemName: "arrowtriangle.up")

class HeaderView: UIView {
    
    var sectionIndex : Int?
    var delegate : HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        button.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        button.setImage(downArrow, for: .normal)
        let buttonWidth = button.frame.width
        let imageWidth = (button.imageView?.image?.size.width)!
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth-imageWidth - 8, bottom: 0, right: 0)
        button.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(clickedHeader), for: .touchUpInside)
        button.addSubview(separator)
        return button
    }()
    
    lazy var separator: UIView = {
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.3))
        separator.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        return separator
    }()
    
    func setUp(with title: String, isExpanded: Bool,sectionIndex : Int) {
        self.sectionIndex = sectionIndex
        self.button.setTitle(title, for: .normal)
        if isExpanded == true {
            self.button.setImage(upArrow, for: .normal)
        }else{
            self.button.setImage(downArrow, for: .normal)
        }
    }
    
    @objc func clickedHeader() {
        delegate?.callHeader(self)
    }
}
