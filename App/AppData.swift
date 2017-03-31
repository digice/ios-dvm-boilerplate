//
//  AppData.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class AppData : NSObject, NSCoding {

  // MARK: - Properties

  let device : DeviceData

  let location : LocationData

  let user : UserData

  // MARK: NSObject Methods

  override init() {
    self.device = DeviceData()
    self.location = LocationData()
    self.user = UserData()
  }

  // MARK: - NSCoding Methods

  required init?(coder aDecoder: NSCoder) {
    self.device = aDecoder.decodeObject(forKey: "device") as! DeviceData
    self.location = aDecoder.decodeObject(forKey: "location") as! LocationData
    self.user = aDecoder.decodeObject(forKey: "user") as! UserData
  }

  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.device, forKey: "device")
    aCoder.encode(self.location, forKey: "location")
    aCoder.encode(self.user, forKey: "user")
  }

}
