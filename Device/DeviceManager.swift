//
//  DeviceManager.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol DeviceManagerDelegate {
  func didSaveDeviceData()
}

class DeviceManager {

  var delegate : DeviceManagerDelegate?

  let data : Device

  init() {
    self.data = AppDataManager.shared.data.device
  }

  // MARK: - Custom Methods

  func save() {

    let am = AppManager.shared
    am.save()

    if let d = self.delegate {
      d.didSaveDeviceData()
    }

  }

}
