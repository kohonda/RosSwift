// Generated by msgbuilder 2020-05-05 18:40:13 +0000

import StdMsgs

extension visualization_msgs {

	public struct MarkerArray: Message {
		public static let md5sum: String = "0b27c2fa2d949b2fd8a203f3176a0d56"
		public static let datatype = "visualization_msgs/MarkerArray"
		public static let definition = """
			Marker[] markers
			"""

	
		public var markers: [Marker]

		public init(markers: [Marker]) {
			self.markers = markers
		}

		public init() {
			markers = [Marker]()
		}
	}
}