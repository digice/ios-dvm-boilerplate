//
//  UserViewController.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UserManagerDelegate {

  // MARK: - Properties

  let manager : UserManager = UserManager()

  // MARK: - Outlets
  
  @IBOutlet weak var usernameField: UITextField!

  @IBOutlet weak var emailField: UITextField!

  @IBOutlet weak var firstField: UITextField!

  @IBOutlet weak var lastField: UITextField!

  // MARK: - UIViewController Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    self.manager.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }

  // MARK: - Custom Methods

  func updateView() {

    if let u = self.manager.data.username {
      self.usernameField.text = u
    }

    if let e = self.manager.data.email {
      self.emailField.text = e
    }

    if let f = self.manager.data.first {
      self.firstField.text = f
    }

    if let l = self.manager.data.last {
      self.lastField.text = l
    }

  }

  // MARK: - UserManagerDelegate Methods

  func didSaveData() {
    // update message label?
  }

  // MARK: - Actions

  @IBAction func saveUserData(_ sender: Any) {

    if let u = self.usernameField.text {
      if u.characters.count > 0 {
        self.manager.data.username = u
      }
    }
    
    if let e = self.emailField.text {
      if e.characters.count > 0 {
        self.manager.data.email = e
      }
    }
    
    if let f = self.firstField.text {
      if f.characters.count > 0 {
        self.manager.data.first = f
      }
    }
    
    if let l = self.lastField.text {
      if l.characters.count > 0 {
        self.manager.data.last = l
      }
    }
    
    self.manager.save()

  }

}
