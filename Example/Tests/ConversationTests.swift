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

class ConversationTests: BaseTests {
  
  func testSingle() {
    let resource = getResource("conversation")
    let result = Conversation(data: resource)
    
    XCTAssertNotNil(result, "Mapped object shouldn't be nil")
    XCTAssertEqual(result.id, resource["id"] as? String)
    XCTAssertEqual(result.created, NSDate.fromISO8601String(resource["created"] as! String))
    XCTAssertEqual(result.lastActivity, NSDate.fromISO8601String(resource["lastActivity"] as! String))
    XCTAssertEqual(result.unreadMessages, resource["unreadMessages"] as? Int)
    XCTAssert(result.states.count == 2)
    XCTAssert(result.links.count == 6)
  }
  
  func testCollection() {
    testCollection(ConversationList(data: getResource("conversations")))
  }
}
