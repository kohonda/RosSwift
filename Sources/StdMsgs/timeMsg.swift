// Generated by msgbuilder 2019-05-02 08:13:23 +0000

import RosTime

extension std_msgs {
	public struct time: Message {
		public static let md5sum: String = "cd7166c74c552c311fbcc2fe5a7bc289"
		public static let datatype = "std_msgs/Time"
		public static let definition = "time data"

		public var data: Time

		public init(_ value: Time) {
			self.data = value
		}
	}
}
