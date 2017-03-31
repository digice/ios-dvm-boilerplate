//
//  LocationViewController.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/31/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, LocationManagerDelegate {

  // MARK: - Properties

  let manager : LocationManager = LocationManager()

  // MARK: - Outlets

  @IBOutlet weak var latitudeLabel: UILabel!

  @IBOutlet weak var longitudeLabel: UILabel!

  @IBOutlet weak var toggleButton: UIButton!

  // MARK: - UIViewController Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    self.manager.delegate = self
    self.updateView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: - Custom Methods

  func updateView() {

    if let x = self.manager.data.latitude {
      self.latitudeLabel.text = "\(x)"
    }

    if let y = self.manager.data.longitude {
      self.longitudeLabel.text = "\(y)"
    }

    if self.manager.isUpdating == true {
      self.toggleButton.setTitle("Stop Updating", for: .normal)
    } else {
      self.toggleButton.setTitle("Start Updating", for: .normal)
      self.latitudeLabel.text = ""
      self.longitudeLabel.text = ""
    }

  }

  // MARK: - Actions

  @IBAction func toggleStatus(_ sender: Any) {
    self.manager.toggleStatus()
    self.updateView()
  }

  // MARK: - LocationManagerDelegate Methods

  func didUpdateLocation() {
    self.updateView()
  }

  func didChangeAuthorizationStatus() {
    // show alert?
  }

  func didSaveLocationData() {
    // set a message label?
    // update remote API?
  }

}
