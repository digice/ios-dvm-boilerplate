//
//  UserManager.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol UserManagerDelegate {
  func didSaveData()
}

class UserManager
{

  // MARK: - Properties

  let data : UserData
  
  var delegate : UserManagerDelegate?
  
  // MARK: - Methods
  
  init() {
    self.data = AppManager.shared.data.user
  }

  func save() {
  
    let am = AppManager.shared
    am.save()
  
    if let d = self.delegate {
      d.didSaveData()
    }
  
  }

}

