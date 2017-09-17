//
//  Model.swift
//  FakeMe
//
//  Created by Maksim Akifev on 9/16/17.
//  Copyright © 2017 Maksim Akifev. All rights reserved.
//

import UIKit
import Foundation

// http://uinames.com/api/?ext

class Model: NSObject {
    
    func loadInfo() -> String {
        var returnInfo: String = ""
        let url = NSURL(string: "http://uinames.com/api/?ext")!
        let data = NSData(contentsOf: url as URL)
        
         let dict = try? JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            
         let dateOfBirth = (dict?.object(forKey: "birthday") as! NSDictionary).object(forKey: "mdy") as! String
         let email = dict?.object(forKey: "email") as! String
         let region = dict?.object(forKey: "region") as! String
         let name = dict?.object(forKey: "name") as! String
         let gender = dict?.object(forKey: "gender") as! String
         let phone = dict?.object(forKey: "phone") as! String
         let surname = dict?.object(forKey: "surname") as! String
         returnInfo = "name: \(name) \(surname) \n DOB: \(dateOfBirth) \n email: \(email) \n region: \(region) \n gender: \(gender) \n phone: \(phone)"
        
        //print(dict)
        
        return returnInfo
    }
    
    func loadPicture() -> String {
        var photoUrl: String = ""
        let url = NSURL(string: "http://uinames.com/api/?ext")!
        let data = NSData(contentsOf: url as URL)
        let dict = try? JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        let photo = dict?.object(forKey: "photo") as! String
        photoUrl = photo
        
        return photoUrl
    }
}
