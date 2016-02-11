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

public class Person: UserInfo {
  
  public var givenName: String
  
  public var familyName: String
  
  public var birthDate: NSDate?
  
  public var email: String?
  
  public var telephone: String?
  
  public init(givenName: String, familyName: String, birthDate: NSDate?,
    email: String?, telephone: String?) {
    self.givenName = givenName
    self.familyName = familyName
    self.birthDate = birthDate
    self.email = email
    self.telephone = telephone
    
    super.init(data: [:])
  }
  
  public required init(data: Dictionary<String, AnyObject>) {
    self.givenName = data["givenName"] as! String
    self.familyName = data["familyName"] as! String
    if let birthDate = data["birthDate"] {
      self.birthDate = NSDate.fromISO8601String(birthDate as! String, format: "yyyy-MM-dd'T'HH:mm:ss'Z'")
    }
    if let telephone = data["telephone"] {
      self.telephone = telephone as? String
    }
    if let email = data["email"] {
      self.email = email as? String
    }
    if let telephone = data["telephone"] {
      self.telephone = telephone as? String
    }

    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = [
      "givenName": givenName,
      "familyName": familyName
    ]
    if let birthDate = self.birthDate {
      result["birthDate"] = birthDate.toISO8601String("yyyy-MM-dd'T'HH:mm:ss'Z'")
    }
    if let telephone = self.telephone {
      result["telephone"] = telephone
    }
    if let email = self.email {
      result["email"] = email
    }
    
    return result
      .append(super.unmap())
  }
}