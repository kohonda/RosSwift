#if !canImport(ObjectiveC)
import XCTest

extension CallbackQueueTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CallbackQueueTests = [
        ("testMultipleCallbacksCallAvailable", testMultipleCallbacksCallAvailable),
        ("testMultipleCallbacksCallOne", testMultipleCallbacksCallOne),
        ("testRecursive1", testRecursive1),
        ("testRecursive2", testRecursive2),
        ("testRecursive3", testRecursive3),
        ("testRecursive4", testRecursive4),
        ("testRemove", testRemove),
        ("testRemoveSelf", testRemoveSelf),
        ("testSingleCallback", testSingleCallback),
        ("testThreadedCallAvailable", testThreadedCallAvailable),
        ("testThreadedCallOne", testThreadedCallOne),
    ]
}

extension DecoderTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DecoderTest = [
        ("testDecodeSplitIncomingData", testDecodeSplitIncomingData),
        ("testDecodeTwoFrames", testDecodeTwoFrames),
        ("testEmptyBuffer", testEmptyBuffer),
        ("testHeaderWithData", testHeaderWithData),
        ("testTime2", testTime2),
        ("testTime", testTime),
    ]
}

extension NameRemappingWithNamespace {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__NameRemappingWithNamespace = [
        ("testParameterRemapping", testParameterRemapping),
    ]
}

extension SubscriptionQueueTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SubscriptionQueueTests = [
        ("testClearCall", testClearCall),
        ("testClearInCallback", testClearInCallback),
        ("testClearThenCall", testClearThenCall),
        ("testClearWhileThreadIsBlocking", testClearWhileThreadIsBlocking),
        ("testConcurrentCallbacks", testConcurrentCallbacks),
        ("testInfiniteQueue", testInfiniteQueue),
        ("testNonConcurrentOrdering", testNonConcurrentOrdering),
        ("testQueueSize", testQueueSize),
    ]
}

extension TimerTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__TimerTest = [
        ("testMultipleSteadyTimeCallbacks", testMultipleSteadyTimeCallbacks),
        ("testSingleSteadyTimeCallback", testSingleSteadyTimeCallback),
    ]
}

extension XmlRpcValueTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__XmlRpcValueTest = [
        ("testDoubleArray", testDoubleArray),
        ("testDoubleAsIntArray", testDoubleAsIntArray),
        ("testInvalid", testInvalid),
        ("testStringArray", testStringArray),
        ("testStringMap", testStringMap),
    ]
}

extension connectionTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__connectionTests = [
        ("testgetPublishedTopics", testgetPublishedTopics),
        ("testInternal", testInternal),
        ("testIntraprocess", testIntraprocess),
        ("testMultipleRos", testMultipleRos),
        ("testNodeHandleConstructionDestruction", testNodeHandleConstructionDestruction),
        ("testnodeHandleParentWithRemappings", testnodeHandleParentWithRemappings),
        ("testPublisherCallback", testPublisherCallback),
        ("testPublisherMultiple", testPublisherMultiple),
        ("testSubscriberDestructionMultipleCallbacks", testSubscriberDestructionMultipleCallbacks),
    ]
}

extension paramTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__paramTests = [
        ("testAllParamTypes", testAllParamTypes),
        ("testdeleteParam", testdeleteParam),
        ("testdoublePrecision", testdoublePrecision),
        ("testgetDoubleAsInt", testgetDoubleAsInt),
        ("testgetIntAsDouble", testgetIntAsDouble),
        ("testgetMissingXmlRpcValueParameterCachedTwice", testgetMissingXmlRpcValueParameterCachedTwice),
        ("testhasParam", testhasParam),
        ("testmapBoolParam", testmapBoolParam),
        ("testmapDoubleParam", testmapDoubleParam),
        ("testmapFloatParam", testmapFloatParam),
        ("testmapIntParam", testmapIntParam),
        ("testmapStringParam", testmapStringParam),
        ("testparamNodeHandleTemplateFunction", testparamNodeHandleTemplateFunction),
        ("testparamTemplateFunction", testparamTemplateFunction),
        ("testPropertyWrapper", testPropertyWrapper),
        ("testsearchParam", testsearchParam),
        ("testsearchParamNodeHandle", testsearchParamNodeHandle),
        ("testsearchParamNodeHandleWithRemapping", testsearchParamNodeHandleWithRemapping),
        ("testsetIntDoubleGetInt", testsetIntDoubleGetInt),
        ("testSetThenGetCString", testSetThenGetCString),
        ("testsetThenGetInt", testsetThenGetInt),
        ("testSetThenGetNamespaceCached", testSetThenGetNamespaceCached),
        ("testSetThenGetString", testSetThenGetString),
        ("testSetThenGetStringCached", testSetThenGetStringCached),
        ("testunknownParam", testunknownParam),
        ("testvectorBoolParam", testvectorBoolParam),
        ("testvectorDoubleParam", testvectorDoubleParam),
        ("testvectorFloatParam", testvectorFloatParam),
        ("testvectorIntParam", testvectorIntParam),
        ("testvectorStringParam", testvectorStringParam),
        ("testZgetParamNames", testZgetParamNames),
    ]
}

extension rosswiftTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__rosswiftTests = [
        ("testExample", testExample),
        ("testResp", testResp),
        ("testResp1", testResp1),
        ("testResponse", testResponse),
        ("testSerialization", testSerialization),
        ("testSerMess", testSerMess),
        ("testXmlStruct", testXmlStruct),
        ("testXmlValue", testXmlValue),
    ]
}

extension serializationTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__serializationTests = [
        ("testBuiltinTypes", testBuiltinTypes),
        ("testFixedArray", testFixedArray),
        ("testFixedUInt32Array", testFixedUInt32Array),
        ("testPrimitive", testPrimitive),
    ]
}

extension serviceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__serviceTests = [
        ("testCallEcho", testCallEcho),
        ("testCallInternalService", testCallInternalService),
        ("testCallService", testCallService),
        ("testCallSrvMultipleTimes", testCallSrvMultipleTimes),
        ("testServiceAdvCopy", testServiceAdvCopy),
        ("testServiceAdvMultiple", testServiceAdvMultiple),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CallbackQueueTests.__allTests__CallbackQueueTests),
        testCase(DecoderTest.__allTests__DecoderTest),
        testCase(NameRemappingWithNamespace.__allTests__NameRemappingWithNamespace),
        testCase(SubscriptionQueueTests.__allTests__SubscriptionQueueTests),
        testCase(TimerTest.__allTests__TimerTest),
        testCase(XmlRpcValueTest.__allTests__XmlRpcValueTest),
        testCase(connectionTests.__allTests__connectionTests),
        testCase(paramTests.__allTests__paramTests),
        testCase(rosswiftTests.__allTests__rosswiftTests),
        testCase(serializationTests.__allTests__serializationTests),
        testCase(serviceTests.__allTests__serviceTests),
    ]
}
#endif
