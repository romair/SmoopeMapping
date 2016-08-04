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
import SwiftyTraverson
import Alamofire

public class TraversonOAuthAuthenticator: TraversonAuthenticator {
  
  private enum TokenType {
    case Bearer
    
    init?(string: String) {
      switch string.lowercaseString {
      case "bearer":
        self = .Bearer
      default:
        return nil
      }
    }
  }
  
  var clientId: String
  
  var secret: String
  
  var url: String
  
  public var retries = 2
  
  public init(url: String, clientId: String, secret: String) {
    self.url = url
    self.clientId = clientId
    self.secret = secret
  }
  
  public func authenticate(result: TraversonAuthenticatorResult) {
    Alamofire.request(.POST, url,
      parameters: ["grant_type": "client_credentials"],
      encoding: .URL,
      headers: Request.authorizationHeader(user: clientId, password: secret))
      .responseJSON { response in
        
        var header: String? = nil
        
        switch response.result {
        case .Success(let json):
          let response = json as! NSDictionary
          
          if let typeString = response["token_type"] as? String,
            let tokenType = TokenType(string: typeString),
            let token = response["access_token"] as? String {
            
            switch tokenType {
            case .Bearer:
              header = "Bearer \(token)"
            }
          }
        default: ()
        }
        result(authorizationHeader: header)
    }
  }
}
