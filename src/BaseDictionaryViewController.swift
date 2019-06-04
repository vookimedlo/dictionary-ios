//
//  DictionaryViewController.swift
//  dictionary
//
//  Created by Michal Duda on 04/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class BaseDictionaryViewController: UIViewController,
                                    UITableViewDataSource,
                                    UITableViewDelegate,
                                    UISearchBarDelegate {
    var records: [DictionaryRecord] = []
    var filteredRecords: [DictionaryRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredRecords = records
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        
        let record = filteredRecords[indexPath.row]
        cell.textLabel?.text = record.originalText
        cell.detailTextLabel?.text = record.translation
        return cell
    }
    
    func reloadTableViewData() {
        preconditionFailure("Must be overridden")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRecords = records.filter({ (record) -> Bool in
            record.originalText.prefix(searchText.count).compare(searchText, options: String.CompareOptions.caseInsensitive) == ComparisonResult.orderedSame
        })
        
        if (searchText.count == 0) {
            filteredRecords = records
        }
        
        reloadTableViewData()
    }
}
