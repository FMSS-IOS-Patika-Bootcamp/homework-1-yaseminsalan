//
//  PersonContactsModel.swift
//  patikadevHomeworkOne
//
//

import Foundation
class PersonContactsModel{
    var firsName:String
    var lastName:String
    var dateOfBirth:Date
    var weight:Int
    var gender:String
    
    
    init(){
        self.firsName = ""
        self.lastName = ""
        self.dateOfBirth = Date.now
        self.weight = 40
        self.gender = ""
    }
}
