//
//  Section.swift
//  expandableTableView
//
//  Created by Gor on 6/12/20.
//  Copyright © 2020 user1. All rights reserved.
//

import Foundation


struct Section {
    var header : String
    var sections : [SectionDetails]
    var isExpanded : Bool
}

struct SectionDetails : Codable {
    let name : String
    let price : Int
    let date : Date
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case date = "date"
    }
}
