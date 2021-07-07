import Foundation
import Logging
import rosmaster
import RosNetwork

private class MyLog: LogHandler {
    let label: String

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        print("\(label): \(message)")
    }

    public subscript(metadataKey _: String) -> Logger.Metadata.Value? {
        get { return nil }
        set(newValue) { }
    }

    public init(label: String) {
        metadata = [:]
        logLevel = .debug
        self.label = label
    }

    public var metadata: Logger.Metadata
    public var logLevel: Logger.Level
}

private func trap(signal sig: Signal, handler: @escaping (Signal) -> Void) -> DispatchSourceSignal {
    let queue = DispatchQueue(label: "rosmaster")
    let signalSource = DispatchSource.makeSignalSource(signal: sig.rawValue, queue: queue)
    signal(sig.rawValue, SIG_IGN)
    signalSource.setEventHandler(handler: {
        signalSource.cancel()
        handler(sig)
    })
    signalSource.resume()
    return signalSource
}

private enum Signal: Int32 {
    case HUP = 1
    case INT = 2
    case QUIT = 3
    case ABRT = 6
    case KILL = 9
    case ALRM = 14
    case TERM = 15
}


public func roscore()
{
    LoggingSystem.bootstrap(MyLog.init)
    let logger = Logger(label: "roscore")

    let network = RosNetwork(remappings: [:])
    let master = Master(host: network.gHost, port: defaultMasterPort)

    _ = try! master.start().wait()

    logger.info("version \(appVersion) listening at http://\(master.host):\(master.port)/")

    let group = DispatchGroup()
    group.enter()
    let signalSource = trap(signal: Signal.INT) { signal in
    logger.debug("intercepted signal: \(signal)")
    master.stop().whenComplete { _ in
        group.leave()
    }
    }

    let terminationSource = trap(signal: Signal.TERM) { signal in
        logger.debug("intercepted signal: \(signal)")
        master.stop().whenComplete { _ in
            group.leave()
        }
    }

    group.wait()
    // cleanup
    signalSource.cancel()
    terminationSource.cancel()
}
