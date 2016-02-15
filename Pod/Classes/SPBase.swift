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

public class SPBase: SPMappable, SPUnmappable {
  
  public var links: [String: SPLink]
  
  public required init(data: [String: AnyObject] = [:]) {
    links = [:]
    data
      .filter() { $0.0 == "_links" }
      .forEach { _, v in
        (v as! [String: AnyObject]).forEach { k, v in
          links[k] = SPLink(data: v as! [String: AnyObject])
        }
      }
  }
  
  public func unmap() -> [String: AnyObject] {
    var result: [String: AnyObject] = [:]
    links.forEach{ k, v in
      result[k] = v.unmap()
    }
    
    return ["_links": result]
  }
  
  public func getLinkForRel(rel: String) -> SPLink? {
    return links[rel] ?? nil
  }
  
  public func getLinkForSelf() -> SPLink? {
    return getLinkForRel("self")
  }
}
