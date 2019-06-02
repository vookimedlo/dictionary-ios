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
        
        records = ["zz", "bb", "cc", "ee", "ff", "gg", "hh", "ii", "jj", "kk", "ll", "mm", "nn", "oo", "pp", "qq", "rr", "ss", "tt", "uu", "vv", "ww", "xx", "yy", "aa"]
        filteredRecords = records
    }
    
    override func reloadTableViewData() {
        tableView.reloadData();
    }
}
