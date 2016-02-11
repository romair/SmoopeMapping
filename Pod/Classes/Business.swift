/*
* Copyright 2016 smoope GmbH
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation

public class Business: Identified {
  
  public var name: String
  
  public var description: String?
  
  public var telephone: String?
  
  public var email: String?
  
  public var address: String?
  
  public var smsSender: String?
  
  public var coordinates: GeoLocation?
  
  public private(set) var states: [BusinessState] = []

  public var statusMessage: String?
  
  public private(set) var tags: [String] = []
  
  public required init(data: Dictionary<String, AnyObject>) {
    self.name = data["name"] as! String
    if let description = data["description"] {
      self.description = description as? String
    }
    if let telephone = data["telephone"] {
      self.telephone = telephone as? String
    }
    if let email = data["email"] {
      self.email = email as? String
    }
    if let address = data["address"] {
      self.address = address as? String
    }
    if let smsSender = data["smsSender"] {
      self.smsSender = smsSender as? String
    }
    if let statusMessage = data["statusMessage"] {
      self.statusMessage = statusMessage as? String
    }
    if let coordinates = data["coordinates"] {
      self.coordinates = GeoLocation(data: coordinates as! Dictionary<String, AnyObject>)
    }
    if let states = data["status"] {
      self.states = (states as! [String]).map({ s in BusinessState(rawValue: s)!})
    }
    if let tags = data["tags"] {
      self.tags = tags as! [String]
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = ["name": name]
    if let description = self.description {
      result["description"] = description
    }
    if let telephone = self.telephone {
      result["telephone"] = telephone
    }
    if let email = self.email {
      result["email"] = email
    }
    if let address = self.address {
      result["address"] = address
    }
    if let smsSender = self.smsSender {
      result["smsSender"] = smsSender
    }
    if let statusMessage = self.statusMessage {
      result["statusMessage"] = statusMessage
    }
    if let coordinates = self.coordinates {
      result["coordinates"] = coordinates.unmap()
    }
    if !states.isEmpty {
      result["states"] = states.map({ i in i.rawValue })
    }
    if !tags.isEmpty {
      result["tags"] = tags.map({ i in i })
    }
    
    return result
      .append(super.unmap())
  }
}