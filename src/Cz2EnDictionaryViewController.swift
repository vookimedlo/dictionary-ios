//
//  CZ2EnDictionaryViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class CZ2EnDictionaryViewController: BaseDictionaryViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let populate = DictionaryRecordLoader(db: Bundle.main.path(forResource: "EnCz", ofType: "db")!)
        records = populate.populate(table: "cs-en")
        filteredRecords = records
    }
    
    override func reloadTableViewData() {
        tableView.reloadData();
    }
}
