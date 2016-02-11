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
import SmoopeSDK

class BusinessTests: BaseTests {
    
  func testSingle() {
    let resource = getResource("business")
    let result = SPBusiness(data: resource)
    
    XCTAssertNotNil(result, "Mapped object shouldn't be nil")
    XCTAssertEqual(result.id, resource["id"] as? String)
    XCTAssertEqual(result.name, resource["name"] as? String)
    XCTAssertEqual(result.description, resource["description"] as? String)
    XCTAssertEqual(result.telephone, resource["telephone"] as? String)
    XCTAssertEqual(result.email, resource["email"] as? String)
    XCTAssertEqual(result.address, resource["address"] as? String)
    XCTAssertEqual(result.smsSender, resource["smsSender"] as? String)
    XCTAssertEqual(result.statusMessage, resource["statusMessage"] as? String)
    XCTAssertEqual(result.coordinates?.latitude,
      (resource["coordinates"] as! Dictionary<String, AnyObject>)["latitude"] as? Double)
    XCTAssertEqual(result.coordinates?.longitude,
      (resource["coordinates"] as! Dictionary<String, AnyObject>)["longitude"] as? Double)
    XCTAssert(result.states.count == 1)
    XCTAssert(result.tags.count == 1)
    XCTAssert(result.links.count == 8)
  }
  
  func testCollection() {
    testCollection(SPBusinessList(data: getResource("businesses")))
  }
}
