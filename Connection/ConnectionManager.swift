//
//  ConnectionManager.swift
//  DVM-Demo
//
//  Created by Digices LLC on 3/31/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol ConnectionManagerDelegate {
  func didSendRequest()
  func didReceiveResponse()
  func didReceiveError()
}

class ConnectionManager {
  
  // MARK: Properties
  
  var delegate : ConnectionManagerDelegate?
  
  var request : URLRequest?
  
  var response : [String:String] = [:]
  
  var error : Error?

  let url : URL = URL(string: "https://<#api-address#>")!
  
  // MARK: Custom Methods
  
  func setRequest(httpBody: String) {

    self.request = URLRequest(url: self.url)
    self.request!.httpMethod = "POST"
    self.request!.httpBody = httpBody.data(using: .utf8)

  }

  func parse(data: Data) -> Bool {
    
    self.response = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:String]
    
    if self.response.count > 0 {
      return true
    } else {
      return false
    }
    
  }

  func completionHandler(data: Data?, response: URLResponse?, error: Error?) {
    
    // this just takes advantage of being on a background thread to save the application data
    let am = AppManager.shared
    am.save()
    
    if let receivedError = error {
      self.error = receivedError
      if let d = self.delegate {
        OperationQueue.main.addOperation {
          d.didReceiveError()
        }
      }
    }
    
    if let receivedData = data {
      if self.parse(data: receivedData) == true {
        if let d = self.delegate {
          OperationQueue.main.addOperation {
            d.didReceiveResponse()
          }
        }
      }
    }

  }

  func sendRequest() {

    if let r = self.request {
      let session = URLSession.shared
      let task = session.dataTask(with: r, completionHandler: self.completionHandler)
      task.resume()
      if let d = self.delegate {
        d.didSendRequest()
      }
    }

  }
  
}
