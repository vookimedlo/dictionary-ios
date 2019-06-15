import os
import sqlite3
import sys

databaseName = r'../../db/EnCz.db'

ORIGINAL = 0
TRANSLATION = 1
NOTES = 2
DETAILS = 3

numberOfThrownAwayRecords = 0

original2translationDict = dict()
translation2originalDict = dict()


def populate_dict(dictionary: dict, record: list, original_id: int, translation_id: int) -> None:
    if record[original_id] in dictionary:
        dictionary[record[original_id]].append([record[translation_id], record[NOTES], record[DETAILS]])
    else:
        dictionary[record[original_id]] = [[record[translation_id], record[NOTES], record[DETAILS]]]


def populate_db(cursor: sqlite3.Cursor, table: str, dictionary: dict) -> None:
    cursor.execute(
        '''create table "''' + table + '''" (Id INTEGER constraint "''' + table + '''_pk" primary key autoincrement,
         Original TEXT, Translation TEXT, Notes TEXT, Details TEXT)''')

    for key in sorted(dictionary.keys()):
        for record in dictionary[key]:
            values = [key]
            values.extend(record)
            cursor.execute('''INSERT INTO "''' + table + '''''''" (Original,Translation,Notes,Details) VALUES(?,?,?,?)''',
                      values)


if __name__ == '__main__':
    try:
        with open(r'../../external/svobodneslovniky/en-cs/en-cs.txt') as inputFile:
            for line in inputFile:
                items = line.split("\t")
                if items is None or items[ORIGINAL] == "" or items[TRANSLATION] == "":
                    numberOfThrownAwayRecords += 1
                    continue
                populate_dict(original2translationDict, items, ORIGINAL, TRANSLATION)
                populate_dict(translation2originalDict, items, TRANSLATION, ORIGINAL)

        if os.path.exists(databaseName):
            os.remove(databaseName)
        conn = sqlite3.connect(databaseName)
        c = conn.cursor()
        populate_db(c, 'en-cs', original2translationDict)
        populate_db(c, 'cs-en', translation2originalDict)

        conn.commit()
        sys.stderr.write("Number of thrown away records: " + str(numberOfThrownAwayRecords) + "\n")
        sys.stderr.write("Database created.\n\n")
    except Exception as e:
        sys.stderr.write("Failure!\n")
        sys.stderr.write(str(type(e)) + "\n")
        sys.stderr.write(str(e) + "\n\n")
        sys.exit(1)
