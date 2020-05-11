// Generated by msgbuilder 2020-05-10 10:00:10 +0000

import StdMsgs

extension geographic_msgs {
	/// A list of geographic map changes.
	public struct GeographicMapChanges: MessageWithHeader {
		public static let md5sum: String = "4fd027f54298203ec12aa1c4b20e6cb8"
		public static let datatype = "geographic_msgs/GeographicMapChanges"
		public static let definition = """
			# A list of geographic map changes.
			Header header                   # stamp specifies time of change
			                                # frame_id (normally /map)
			GeographicMap diffs             # new and changed points and features
			uuid_msgs/UniqueID[] deletes    # deleted map components
			"""

	
		public var header: std_msgs.Header
		public var diffs: GeographicMap
		public var deletes: [uuid_msgs.UniqueID]

		public init(header: std_msgs.Header, diffs: GeographicMap, deletes: [uuid_msgs.UniqueID]) {
			self.header = header
			self.diffs = diffs
			self.deletes = deletes
		}

		public init() {
			header = std_msgs.Header()
			diffs = GeographicMap()
			deletes = [uuid_msgs.UniqueID]()
		}
	}
}