//
//  Model.swift
//  masterDetailOrigin
//
//  Created by 菊池 重夫 on 2016/02/17.
//  Copyright © 2016年 sigepon. All rights reserved.
//

import UIKit
import RealmSwift

class Model: Object {
    dynamic var id = 0
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    dynamic var name: String = ""
//    dynamic var timeStamp = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
