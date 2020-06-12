//
//  TableViewCell.swift
//  expandableTableView
//
//  Created by Gor on 6/11/20.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.sizeToFit()
    }
    
    func setUpCell(with cell: SectionDetails){
        nameLabel.text = cell.name
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL dd HH:00"
        dateLabel.text = formatter.string(from: cell.date)
        numberLabel.text = String(cell.price) + "AMD"
    }
}
