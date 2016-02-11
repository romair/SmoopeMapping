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

public class SmartConnect: Identified {
  
  public var key: String
  
  public var description: String?
  
  public required init(data: Dictionary<String, AnyObject>) {
    self.key = data["key"] as! String
    if let description = data["description"] {
      self.description = description as? String
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = ["key": key]
    if let description = self.description {
      result["description"] = description
    }
    
    return result
      .append(super.unmap())
  }
}