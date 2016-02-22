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

public class SPNotificationSettings: SPBase {
  
  public enum Target: String {
    
    case Email = "email"
  }
  
  public enum Event: String {
    
    case NewChat = "newChat", NewMessage = "newMessage"
  }
  
  public var settings: [Target: [Event:Bool]]
  
  public required init(data: [String: AnyObject]) {
    self.settings = [:]
    
    super.init(data: data)
    
    if let settings = data["settings"] {
      (settings as! [String: [String:Bool]])
        .forEach { target, events in
          if let t = Target(rawValue: target) {
            if !self.settings.containKey(t) {
              self.settings[t] = [:]
            }
          
            events.forEach { event, enabled in
              if let e = Event(rawValue: event) {
                self.settings[t]![e] = enabled
              }
            }
          }
        }
    }
  }
  
  public override func unmap() -> [String: AnyObject] {
    var set: [String: [String: Bool]] = [:]
    settings.forEach { target, events in
      if !set.containKey(target.rawValue) {
        set[target.rawValue] = [:]
      }
      
      events.forEach { event, enabled in
        set[target.rawValue]![event.rawValue] = enabled
      }
    }
    
    var result: [String: AnyObject] = ["settings": set]
    return result
      .append(super.unmap())
  }
}