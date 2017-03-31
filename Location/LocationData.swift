//
//  Location.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation
import CoreLocation

class LocationData : NSObject, NSCoding
{

  // MARK: - Optional Properties

  var latitude : Double?

  var longitude : Double?

  var region : CLRegion?

  // MARK: - NSObject Methods

  override init() {
    super.init()
  }

  // MARK: - NSCoder Methods

  required init?(coder aDecoder: NSCoder) {

    // decode latitude
    let x = aDecoder.decodeDouble(forKey: "latitude")
    if x < 200 {
      self.latitude = x
    }

    // decode longitude
    let y = aDecoder.decodeDouble(forKey: "longitude")
    if y < 200 {
      self.longitude = y
    }

    // decode region
    let r = aDecoder.decodeObject(forKey: "region")
    if r as? String == "nil" {
      // do nothing
    } else {
      self.region = r as? CLRegion
    }
    
  }

  func encode(with aCoder: NSCoder) {

    // encode latitude
    if let x = self.latitude {
      aCoder.encode(x, forKey: "latitude")
    } else {
      aCoder.encode(999.9, forKey: "latitude")
    }

    // encode longitiude
    if let y = self.longitude {
      aCoder.encode(y, forKey: "longitude")
    } else {
      aCoder.encode(999.9, forKey: "longitude")
    }
    
    if let r = self.region {
      aCoder.encode(r, forKey: "region")
    } else {
      aCoder.encode("nil", forKey: "region")
    }

  }

  // MARK: - Custom Methods

  func httpBody() -> String {

    // make sure we have longitude and latitude
    if let x = self.latitude {
      if let y = self.longitude {
        if let r = self.region {
          // optionally include region identifier
          return "x=\(x)&y=\(y)&r=\(r.identifier)"
        } else {
          // 
          return "x=\(x)&y=\(y)&r=unknown"
        }
      }
    }
    
    // return default string with recognizably invalid parameters
    return "x=999.9&y=999.9&r=unknown"

  }

}
