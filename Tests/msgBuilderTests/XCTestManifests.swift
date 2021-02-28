#if !canImport(ObjectiveC)
import XCTest

extension GenTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__GenTest = [
        ("testGenMD5", testGenMD5),
        ("testLoadFromFile", testLoadFromFile),
        ("testLoadMsgString", testLoadMsgString),
        ("testLoadMsgString2", testLoadMsgString2),
        ("testLoadSrvFile", testLoadSrvFile),
        ("testMD5", testMD5),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GenTest.__allTests__GenTest),
    ]
}
#endif
