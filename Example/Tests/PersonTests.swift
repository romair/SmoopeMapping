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

import XCTest
import ios_sdk

class PersonTests: BaseTests {
  
  func testSingle() {
    let resource = getResource("person")
    let result = Person(data: resource)
    
    XCTAssertNotNil(result, "Mapped object shouldn't be nil")
    XCTAssertEqual(result.givenName, resource["givenName"] as? String)
    XCTAssertEqual(result.familyName, resource["familyName"] as? String)
    XCTAssertEqual(result.email, resource["email"] as? String)
    XCTAssertEqual(result.telephone, resource["telephone"] as? String)
    XCTAssertEqual(result.birthDate,
      NSDate.fromISO8601String(resource["birthDate"] as! String, format: "yyyy-MM-dd'T'HH:mm:ss'Z'"))
    XCTAssert(result.links.count == 2)
  }
}
