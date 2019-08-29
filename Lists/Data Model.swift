//
//  Data Model.swift
//  Lists
//
//  Created by Brandon Fong on 7/18/19.
//  Copyright © 2019 Fiesta Togo Inc. All rights reserved.
//

import UIKit

class ListItem {
    
    var title: String
    var checked: Bool
    
    init?(itemTitle: String, checked: Bool = false) {
        if itemTitle == "" {
            return nil
        }
        self.title = itemTitle
        self.checked = checked
    }
}

class List {
    var title: String
    var items = [ListItem]() {
        didSet {
            items.sort(by: { $0.title < $1.title })
        }
    }
    
    init?(listTitle: String, items: [ListItem] = []) {
        if listTitle == "" { return nil }
        self.title = listTitle
        self.items = items
    }
}

var lists = [List]() {
    didSet {
        lists.sort(by: { $0.title < $1.title })
    }
}

func loadLists() {
    guard let retrievedData = UserDefaults.standard.dictionary(forKey: "DictionaryOfLists") else { return }
    
    lists.removeAll()
    
    let dictionaryOfLists = retrievedData as! [String : [ [Any] ] ]
    
    for (listTitle, listItems) in dictionaryOfLists {
        let newList = List(listTitle: listTitle)!
        for array in listItems {
            newList.items.append(ListItem(itemTitle: array[0] as! String, checked: array[1] as! Bool)!)
        }
        lists.append(newList)
    }
    
}

func saveLists() {
    //  Format of data: [
    //  Groceries: [ [Eggs, true], [Cabbage, false], [milk, true] ],
    //  Todo: [ [Sing, true], [Dance, false], [Drink Coffee, true] ]
    //  ]
    var dictionaryOfLists: [String : [ [Any] ] ] = [:]
    
    for list in lists {
        var arrayOfArrays: [[Any]] = []
        for item in list.items {
            arrayOfArrays.append([item.title, item.checked])
        }
        dictionaryOfLists[list.title] = arrayOfArrays
    }
    
    UserDefaults.standard.set(dictionaryOfLists, forKey: "DictionaryOfLists")
}
