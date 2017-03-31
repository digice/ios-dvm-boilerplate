//
//  AppManager.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol AppManagerDelegate {
  func didSaveData()
}

class AppManager
{

  // MARK: - Properties

  // singleton
  static let shared : AppManager = AppManager()

  var delegate : AppManagerDelegate?

  var data : AppData
  
  // MARK: - Methods
  
  private init() {

    // attempt to load data from UserDefaulys
    if let storedData = UserDefaults.standard.object(forKey: "data") as? Data {

      // yes, we have data
      self.data = (NSKeyedUnarchiver.unarchiveObject(with: storedData) as? AppData)!

    } else {

      // no data, create a default object and save it
      self.data = AppData()
      self.save()

    }
    
  }

  // save data to UserDefaults
  func save() {

    let ud = UserDefaults.standard
    let dataToSave = NSKeyedArchiver.archivedData(withRootObject: self.data)
    ud.set(dataToSave, forKey: "data")
    ud.synchronize()

    // notify our delegate if we have one
    if let d = self.delegate {
      d.didSaveData()
    }

  }

}
