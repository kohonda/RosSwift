// Generated by msgbuilder 2020-05-05 18:40:13 +0000

import StdMsgs

extension geometry_msgs {
	/// This contains the position of a point in free space
	public struct Point: Message {
		public static let md5sum: String = "4a842b65f413084dc2b10fb484ea7f17"
		public static let datatype = "geometry_msgs/Point"
		public static let definition = """
			# This contains the position of a point in free space
			float64 x
			float64 y
			float64 z
			"""

	
		public var x: Float64
		public var y: Float64
		public var z: Float64

		public init(x: Float64, y: Float64, z: Float64) {
			self.x = x
			self.y = y
			self.z = z
		}

		public init() {
			x = Float64()
			y = Float64()
			z = Float64()
		}
	}
}