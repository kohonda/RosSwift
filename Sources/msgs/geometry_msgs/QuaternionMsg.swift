// Generated by msgbuilder 2020-05-05 18:40:13 +0000

import StdMsgs

extension geometry_msgs {
	/// This represents an orientation in free space in quaternion form.
	public struct Quaternion: Message {
		public static let md5sum: String = "a779879fadf0160734f906b8c19c7004"
		public static let datatype = "geometry_msgs/Quaternion"
		public static let definition = """
			# This represents an orientation in free space in quaternion form.
			float64 x
			float64 y
			float64 z
			float64 w
			"""

	
		public var x: Float64
		public var y: Float64
		public var z: Float64
		public var w: Float64

		public init(x: Float64, y: Float64, z: Float64, w: Float64) {
			self.x = x
			self.y = y
			self.z = z
			self.w = w
		}

		public init() {
			x = Float64()
			y = Float64()
			z = Float64()
			w = Float64()
		}
	}
}