//
//  En2CzDictionaryViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class En2CzDictionaryViewController: BaseDictionaryViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        records = ["aa", "bb", "cc", "ee", "ff", "gg", "hh", "ii", "jj", "kk", "ll", "mm", "nn", "oo", "pp", "qq", "rr", "ss", "tt", "uu", "vv", "ww", "xx", "yy", "zz"]
        filteredRecords = records
    }
    
    override func reloadTableViewData() {
        tableView.reloadData();
    }
}
