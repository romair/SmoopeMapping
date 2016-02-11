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

public class Base: Mappable, Unmappable {
  
  public var links: Dictionary<String, Link>
  
  public required init(data: Dictionary<String, AnyObject>) {
    links = [:]
    data
      .filter() { $0.0 == "_links" }
      .forEach { _, v in
        (v as! Dictionary<String, AnyObject>).forEach { k, v in
          links[k] = Link(data: v as! Dictionary<String, AnyObject>)
        }
      }
  }
  
  public func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = [:]
    links.forEach{ k, v in
      result[k] = v.unmap()
    }
    
    return ["_links": result]
  }
  
  public func getLinkForRel(rel: String) -> Link? {
    return links[rel] ?? nil
  }
  
  public func getLinkForSelf() -> Link? {
    return getLinkForRel("self")
  }
}
