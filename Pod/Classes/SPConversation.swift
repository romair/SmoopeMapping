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

public class SPConversation: SPCreated {
  
  public var lastActivity: NSDate?
  
  public var unreadMessages: Int?
  
  public private(set) var states: [SPConversationState] = []
  
  public required init(data: [String: AnyObject]) {
    if let lastActivity = data["lastActivity"] {
      self.lastActivity = NSDate.fromISO8601String(lastActivity as! String)
    }
    if let unreadMessages = data["unreadMessages"] {
      self.unreadMessages = unreadMessages as? Int
    }
    if let states = data["status"] as? [String] {
      self.states = states.map({ s in SPConversationState(rawValue: s)!})
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: [String: AnyObject] = [:]
    if let lastActivity = self.lastActivity {
      result["lastActivity"] = lastActivity.toISO8601String()
    }
    if let unreadMessages = self.unreadMessages {
      result["unreadMessages"] = unreadMessages
    }
    if !states.isEmpty {
      result["states"] = states.map({ i in i.rawValue })
    }
    
    return result
      .append(super.unmap())
  }
}