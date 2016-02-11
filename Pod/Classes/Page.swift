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

public class Page: Mappable {
  
  public private(set) var size: Int
  
  public private(set) var totalElements: Int
  
  public private(set) var totalPages: Int
  
  public private(set) var number: Int
  
  public required init(data: Dictionary<String, AnyObject>) {
    self.size = data["size"] as! Int
    self.totalElements = data["totalElements"] as! Int
    self.totalPages = data["totalPages"] as! Int
    self.number = data["number"] as! Int
  }
}