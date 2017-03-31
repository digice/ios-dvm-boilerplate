//
//  UserData.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class UserData : NSObject, NSCoding {

  // MARK: - Properties

  var username : String?
  
  var password : String?
  
  var email : String?
  
  var first : String?
  
  var last : String?
  
  // MARK: - NSOBject Methods
  
  override init() {
    super.init()
  }

  // MARK: - NSCoding Methods

  required init?(coder aDecoder: NSCoder) {

    let u = aDecoder.decodeObject(forKey: "username") as! String
    if u != "Anonymous" {
      self.username = u
    }

    let e = aDecoder.decodeObject(forKey: "email") as! String
    if e != "nil" {
      self.email = e
    }

    let f = aDecoder.decodeObject(forKey: "first") as! String
    if f != "nil" {
      self.first = f
    }

    let l = aDecoder.decodeObject(forKey: "last") as! String
    if l != "nil" {
      self.last = l
    }

  }

  func encode(with aCoder: NSCoder) {

    if let u = self.username {
      aCoder.encode(u, forKey: "username")
    } else {
      aCoder.encode("Anonymous", forKey: "username")
    }

    if let e = self.email {
      aCoder.encode(e, forKey: "email")
    } else {
      aCoder.encode("nil", forKey: "email")
    }

    if let f = self.first {
      aCoder.encode(f, forKey: "first")
    } else {
      aCoder.encode("nil", forKey: "first")
    }

    if let l = self.last {
      aCoder.encode(l, forKey: "last")
    } else {
      aCoder.encode("nil", forKey: "last")
    }

  }

}
