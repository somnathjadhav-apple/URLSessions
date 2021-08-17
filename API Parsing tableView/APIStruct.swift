//
//  APIStruct.swift
//  API Parsing tableView
//
//  Created by Somnath on 12/07/21.
//

import Foundation
import UIKit

struct Album: Codable {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
