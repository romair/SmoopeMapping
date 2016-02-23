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

public class SPUserMetadata: SPBase {
  
  public var data: [String:String]
  
  public required init(data: [String: AnyObject]) {
    self.data = [:]
    
    super.init(data: data)
    
    if let data = data["data"] as? [String:String] {
      data.forEach { key, value in
        self.data[key] = value
      }
    }
  }
  
  public override func unmap() -> [String: AnyObject] {
    var temp: [String: String] = [:]
    data.forEach { key, value in
      temp[key] = value
    }
    
    var result: [String: AnyObject] = ["data": temp]
    return result
      .append(super.unmap())
  }
}