// Generated by msgbuilder 2020-04-28 09:13:57 +0000

import StdMsgs

extension geometry_msgs {
	/// This represents a vector in free space. 
	/// It is only meant to represent a direction. Therefore, it does not
	/// make sense to apply a translation to it (e.g., when applying a 
	/// generic rigid transformation to a Vector3, tf2 will only apply the
	/// rotation). If you want your data to be translatable too, use the
	/// geometry_msgs/Point message instead.
	public struct Vector3: Message {
		public static let md5sum: String = "4a842b65f413084dc2b10fb484ea7f17"
		public static let datatype = "geometry_msgs/Vector3"
		public static let definition = """
			# This represents a vector in free space. 
			# It is only meant to represent a direction. Therefore, it does not
			# make sense to apply a translation to it (e.g., when applying a 
			# generic rigid transformation to a Vector3, tf2 will only apply the
			# rotation). If you want your data to be translatable too, use the
			# geometry_msgs/Point message instead.
			float64 x
			float64 y
			float64 z
			"""

		public static let hasHeader = false

	
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