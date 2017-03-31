//
// LocationManager.swift
// DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationManagerDelegate {
  func didUpdateLocation()
  func didChangeAuthorizationStatus()
  func didSaveLocationData()
}

class LocationMangager : NSObject, CLLocationManagerDelegate {
  
  // MARK: - Properties
  
  let manager : CLLocationManager
  
  var delegate : LocationManagerDelegate?
  
  let data : LocationData
  
  // MARK: - NSObject Methods
  
  override init() {
    self.manager = CLLocationManager()
    self.data = AppManager.shared.data.location
  }

  // MARK: - CLLocationManagerDelegate Methods

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    // extract coordinates
    let coords = locations[0].coordinate
    self.data.latitude = coords.latitude
    self.data.longitude = coords.longitude

    // notify delegate if we have one
    if let d = self.delegate {
      d.didUpdateLocation()
    }

  }

  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

    // how do you want to handle this?
    if CLLocationManager.authorizationStatus() != .authorizedAlways {
      manager.requestAlwaysAuthorization()
    }

    // notify delegate if we have one
    if let d = self.delegate {
      d.didChangeAuthorizationStatus()
    }

  }

  // MARK: - Manager Methods

  func save() {

    // ask the AppManager to save all its data
    let am = AppManager.shared
    am.save()
    
    // notify delegate if we have one
    if let d = self.delegate {
      d.didSaveLocationData()
    }

  }

}
