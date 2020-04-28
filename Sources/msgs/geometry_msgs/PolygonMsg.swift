// Generated by msgbuilder 2020-04-28 09:13:57 +0000

import StdMsgs

extension geometry_msgs {
	///A specification of a polygon where the first and last points are assumed to be connected
	public struct Polygon: Message {
		public static let md5sum: String = "cd60a26494a087f577976f0329fa120e"
		public static let datatype = "geometry_msgs/Polygon"
		public static let definition = """
			#A specification of a polygon where the first and last points are assumed to be connected
			Point32[] points
			"""

		public static let hasHeader = false

	
		public var points: [Point32]

		public init(points: [Point32]) {
			self.points = points
		}

		public init() {
			points = [Point32]()
		}
	}
}