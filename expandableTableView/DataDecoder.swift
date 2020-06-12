//
//  DataDecoder.swift
//  expandableTableView
//
//  Created by Gor on 6/12/20.
//  Copyright © 2020 user1. All rights reserved.
//

import Foundation

func decodePlist() -> [Section]? {
    guard let path = Bundle.main.path(forResource: "expenses", ofType: "plist") else { return nil }
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    guard var sections = try? PropertyListDecoder().decode([SectionDetails].self, from: data) else { return nil }
    sections.sort(by: { $0.date < $1.date })
    
    var dict = [String: [SectionDetails]]()
    for sectionDetail in sections {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL yyyy"
        let key = dateFormatter.string(from: sectionDetail.date)
        dict[key, default: []].append(sectionDetail)
    }
    
    var result = [Section]()
    for (key,value) in dict {
        result.append(Section(header: key, sections: value, isExpanded: false))
    }
    result.sort(by: { $0.sections[0].date > $1.sections[0].date })
    return result
}
