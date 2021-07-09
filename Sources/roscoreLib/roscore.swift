import Foundation
import Logging
import rosmaster
import RosNetwork

private class MyLog: LogHandler {
    let label: String

    public func log(level _: Logger.Level, message: Logger.Message, metadata _: Logger.Metadata?, file _: String, function _: String, line _: UInt) {
        print("\(label): \(message)")
    }

    public subscript(metadataKey _: String) -> Logger.Metadata.Value? {
        get { return nil }
        set(newValue) {}
    }

    public init(label: String) {
        metadata = [:]
        logLevel = .debug
        self.label = label
    }

    public var metadata: Logger.Metadata
    public var logLevel: Logger.Level
}

public class RosCore {
    private let logger: Logger
    private let master: Master

    private enum Signal: Int32 {
        case HUP = 1
        case INT = 2
        case QUIT = 3
        case ABRT = 6
        case KILL = 9
        case ALRM = 14
        case TERM = 15
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

    public init() {
        LoggingSystem.bootstrap(MyLog.init)
        logger = Logger(label: "roscore")

        let network = RosNetwork(remappings: [:])
        master = Master(host: network.gHost, port: defaultMasterPort)
    }

    public func start() {
        _ = try! master.start().wait()

        logger.info("version \(appVersion) listening at http://\(master.host):\(master.port)/")

        // let group = DispatchGroup()
        // group.enter()
        // let signalSource = trap(signal: Signal.INT) { signal in
        //     self.logger.debug("intercepted signal: \(signal)")
        //     self.master.stop().whenComplete { _ in
        //         group.leave()
        //     }
        // }

        // let terminationSource = trap(signal: Signal.TERM) { signal in
        //     self.logger.debug("intercepted signal: \(signal)")
        //     self.master.stop().whenComplete { _ in
        //         group.leave()
        //     }
        // }

        // group.wait()
        // // cleanup
        // signalSource.cancel()
        // terminationSource.cancel()
    }

    public func stop()
    {
        self.master.stop()
    }

}
