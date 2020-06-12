//
//  ViewController.swift
//  expandableTableView
//
//  Created by Gor on 6/11/20.
//  Copyright © 2020 user1. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var sectionArray = [Section]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sectionArray = decodePlist() ?? []
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionArray[section].isExpanded {
            return sectionArray[section].sections.count
        } else {
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.setUpCell(with: sectionArray[indexPath.section].sections[indexPath.row])
        cell!.selectionStyle = .none
        cell!.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sectionArray[indexPath.section].isExpanded {
            return 40
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.delegate = self
        headerView.setUp(with: sectionArray[section].header, isExpanded: sectionArray[section].isExpanded, sectionIndex: section)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

extension TableViewController : HeaderViewDelegate {
    func callHeader(_ headerView: HeaderView) {
        sectionArray[headerView.sectionIndex!].isExpanded.toggle()
        tableView.reloadData()
    }
}
