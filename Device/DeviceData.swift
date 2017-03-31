//
//  DeviceData.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

class DeviceData : NSObject, NSCoding {

  // MARK: - Properties

  // unique device identifier
  let uuid : String
  
  // optional device name
  var name : String?
  
  // optional device token
  var token : String?
  
  // creates a default object
  override init() {
    self.uuid = UUID().uuidString
  }

  // MARK: - NSCoding Methods

  // creates object from userdefaults
  required init?(coder aDecoder: NSCoder) {

    self.uuid = aDecoder.decodeObject(forKey: "uuid") as! String

    let n = aDecoder.decodeObject(forKey: "name") as! String
    if n != "Unnamed Device" {
      self.name = n
    }
    
    let t = aDecoder.decodeObject(forKey: "token") as! String
    if t != "nil" {
      self.token = t
    }
    
  }

  // stores object in defaults
  func encode(with aCoder: NSCoder) {

    aCoder.encode(self.uuid, forKey: "uuid")

    // conditionally store device name
    if let n = self.name {
      aCoder.encode(n, forKey: "name")
    } else {
      aCoder.encode("Unnamed Device", forKey: "name")
    }
    
    // conditionally store device name
    if let t = self.token {
      aCoder.encode(t, forKey: "token")
    } else {
      aCoder.encode("nil", forKey: "token")
    }
    
  }

  // MARK: - Custom Methods

  // returns a string to use as the body of an API request
  func httpBody() -> String {

    // initialize empty dictionary
    var params : [String:String] = [:]
    
    // define params
    params["i"] = self.uuid

    if let n = self.name {
      params["n"] = n
    }

    if let t = self.token {
      params["t"] = t
    }
    
    // build string
    var returnStr = ""
    var i = 1
    let c = params.count
    for (key, value) in params {
      returnStr.append("\(key)=\(value)")
      if i < c {
        returnStr.append("&")
      }
      i += 1
    }
    
    return returnStr

  }

  // update local properties from a dictionary, i.e. from an API response
  func updateFromDict(dict: [String:String]) {
    
    if let t = dict["token"] {
      self.token = t
    }
    
    if let n = dict["name"] {
      self.name = n
    }
    
  }
  
}
