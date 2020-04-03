//
//  Variables.swift
//  CloudKitTest
//
//  Created by Andrey Slota on 11/1/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import CloudKit

let record = CKRecord(recordType: "Places")
let privateDatabase = CKContainer.default().privateCloudDatabase

var titles = [PlacesFavorite]()
//var recordIDs = [CKRecord.ID]()

struct PlacesFavorite {
    var recordIDs = [CKRecord.ID]()
    var name: String?
    var address: String?
}
