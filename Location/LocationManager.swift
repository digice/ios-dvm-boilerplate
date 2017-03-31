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

class LocationManager : NSObject, CLLocationManagerDelegate {
  
  // MARK: - Properties
  
  var delegate : LocationManagerDelegate?
  
  let data : LocationData
  
  let manager : CLLocationManager
  
  var authStatus : CLAuthorizationStatus
  
  var isUpdating : Bool = false
  
  // MARK: - NSObject Methods
  
  override init() {
    self.data = AppManager.shared.data.location
    self.manager = CLLocationManager()
    self.authStatus = CLLocationManager.authorizationStatus()
    super.init()
    self.manager.delegate = self
  }

  // MARK: - Custom Methods
  
  func toggleStatus() {

    if self.authStatus == .authorizedAlways {
      if self.isUpdating == true {
        self.manager.stopUpdatingLocation()
        self.isUpdating = false
      } else {
        self.manager.startUpdatingLocation()
        self.isUpdating = true
      }
    } else {
      self.manager.requestAlwaysAuthorization()
      // you may want to use a callback to try again. In this version, updating is not automatic
    }

  }

  // MARK: - CLLocationManagerDelegate Methods
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    // extract coordinates
    self.isUpdating = true
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
    self.authStatus = CLLocationManager.authorizationStatus()
    
    // notify delegate if we have one
    if let d = self.delegate {
      d.didChangeAuthorizationStatus()
    }

  }

}
