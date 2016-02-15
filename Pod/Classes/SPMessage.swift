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

public class SPMessage: SPCreated {
  
  public private(set) var states: [SPMessageState] = []
  
  public var parts: [Part] = []
  
  public required init(data: [String: AnyObject]) {
    if let states = data["status"] as? [String] {
      self.states = states.map({ s in SPMessageState(rawValue: s)!})
    }
    if let parts = data["_embedded"]!["parts"] as? [AnyObject] {
      self.parts = parts
        .map { v in
          Part(data: v as! [String: AnyObject])
        }
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> [String: AnyObject] {
    var result: [String: AnyObject] = [:]
    if !states.isEmpty {
      result["states"] = states.map({ i in i.rawValue })
    }
    if !parts.isEmpty {
      result["parts"] = parts.map({ part in part.unmap() })
    }
    
    return result
      .append(super.unmap())
  }
  
  public class Part: SPBase {
    
    private var mimeType: String
    
    private var encoding: String?
    
    private var body: String?
    
    private var filename: String?
    
    private var url: String?
    
    private init(mimeType: String, encoding: String? = nil, body: String? = nil, filename: String? = nil, url: String? = nil) {
      self.mimeType = mimeType
      self.encoding = encoding
      self.body = body
      self.filename = filename
      self.url = url
      
      super.init()
    }
    
    public required init(data: Dictionary<String, AnyObject>) {
      self.mimeType = data["mimeType"] as! String
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
    
    public override func unmap() -> [String: AnyObject] {
      var result: [String: AnyObject] = ["mimeType": mimeType]
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
    
    public static func text(text: String) -> Part {
      return Part(mimeType: "text/plain", body: text)
    }
    
    public static func media(mimeType: String, filename: String, url: String) -> Part {
      return Part(mimeType: mimeType, filename: filename, url: url)
    }
  }
}