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

public class MessagePart: Base {
  
  private var mimeType: String?
  
  private var encoding: String?
  
  private var body: String?
  
  private var filename: String?
  
  private var url: String?
  
  public required init(data: Dictionary<String, AnyObject>) {
    if let mimeType = data["mimeType"] {
      self.mimeType = mimeType as? String
    }
    if let encoding = data["encoding"] {
      self.encoding = encoding as? String
    }
    if let body = data["body"] {
      self.body = body as? String
    }
    if let filename = data["filename"] {
      self.filename = filename as? String
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = [:]
    if let mimeType = self.mimeType {
      result["mimeType"] = mimeType
    }
    if let encoding = self.encoding {
      result["encoding"] = encoding
    }
    if let body = self.body {
      result["body"] = body
    }
    if let filename = self.filename {
      result["filename"] = filename
    }
    if let url = self.url {
      result["url"] = url
    }
    
    return result
      .append(super.unmap())
  }
}