// Generated by msgbuilder 2020-05-05 18:40:13 +0000

import StdMsgs

extension geometry_msgs {
	/// A twist with reference coordinate frame and timestamp
	public struct TwistStamped: MessageWithHeader {
		public static let md5sum: String = "98d34b0043a2093cf9d9345ab6eef12e"
		public static let datatype = "geometry_msgs/TwistStamped"
		public static let definition = """
			# A twist with reference coordinate frame and timestamp
			Header header
			Twist twist
			"""

	
		public var header: std_msgs.Header
		public var twist: Twist

		public init(header: std_msgs.Header, twist: Twist) {
			self.header = header
			self.twist = twist
		}

		public init() {
			header = std_msgs.Header()
			twist = Twist()
		}
	}
}