//
//  Item.swift
//  Todoeym
//
//  Created by Jorge Baralt on 2/6/19.
//  Copyright © 2019 Jorge Baralt. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
