//
//  DeviceViewController.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController, DeviceManagerDelegate {

  // MARK: - Properties

  let manager : DeviceManager = DeviceManager()

  // MARK: - Outlets

  @IBOutlet weak var uuidLabel: UILabel!

  @IBOutlet weak var nameField: UITextField!

  @IBOutlet weak var tokenLabel: UILabel!

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

    self.uuidLabel.text = self.manager.data.uuid

    if let name = self.manager.data.name {
      self.nameField.text = name
    }

    if let token = self.manager.data.token {
      self.tokenLabel.text = token
    } else {
      self.tokenLabel.text = "Please log in for remote access."
      self.tokenLabel.textColor = .darkGray
    }

  }

  // MARK: - DeviceManagerDelegate Methods

  func didSaveDeviceData() {
    // show a message?
  }

  // MARK: - Actions

  @IBAction func saveDevice(_ sender: Any) {

    if let nameText = self.nameField.text {
      if nameText.characters.count > 0 {
        self.manager.data.name = nameText
      }
    }

    self.manager.save()

  }

}
