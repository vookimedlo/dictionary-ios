/*

 Licensed under the MIT license:

 Copyright (c) 2019 Michal Duda

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

import UIKit

// swiftlint:disable type_name
class Original2TranslationDictionaryViewController: BaseDictionaryViewController {
    // swiftlint:enable
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let populate = DictionaryRecordLoader(db: Bundle.main.path(forResource: RuntimeSettings.dictionaryDatabase, ofType: "db")!)
        records = populate.populate(table: RuntimeSettings.databaseOriginal2TranslationTable)
        filteredRecords = records
    }

    override func reloadTableViewData() {
        tableView.reloadData()
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
