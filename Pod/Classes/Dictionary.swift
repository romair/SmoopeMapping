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

extension Dictionary {
  
  func get(key: Key, defaultValue: Value) -> Value {
    if let value = self[key] {
      return value
    } else {
      return defaultValue
    }
  }
  
  mutating func append(dictionary: Dictionary<String, AnyObject>) -> Dictionary<Key, Value> {
    forEach{k , v in dictionary
      self[k] = v
    }
    
    return self
  }
}
