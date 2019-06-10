//
//  CZ2EnDictionaryViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class Translation2OriginalDictionaryViewController: BaseDictionaryViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let populate = DictionaryRecordLoader(db: Bundle.main.path(forResource: RuntimeSettings.dictionaryDatabase, ofType: "db")!)
        records = populate.populate(table: RuntimeSettings.databaseTranslation2OriginalTable)
        filteredRecords = records
    }
    
    override func reloadTableViewData() {
        tableView.reloadData();
        tableView.selectRow(at: IndexPath(row: 0, section: 0),
                            animated: true,
                            scrollPosition: UITableView.ScrollPosition.top)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "detail":
            if let consumer = segue.destination as? DictionaryRecordConsumer {
                if let indexPath = tableView.indexPathForSelectedRow {
                    consumer.consume(record: filteredRecords[indexPath.row])
                }
            }
        case "info":
            break
        default:
            debugPrint("unknown segue", segue.identifier ?? "nil")
        }
    }
}
