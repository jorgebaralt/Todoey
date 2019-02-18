//
//  Category.swift
//  Todoeym
//
//  Created by Jorge Baralt on 2/6/19.
//  Copyright © 2019 Jorge Baralt. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String?
    // specifies that each category, can have a number of items
    let items = List<Item>()
}
