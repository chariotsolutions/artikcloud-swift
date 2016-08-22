//
// DeviceTypesEnvelope.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** DeviceTypes Envelope */
public class DeviceTypesEnvelope: JSONEncodable {
    public var total: Int32?
    public var count: Int32?
    public var offset: Int32?
    public var data: DeviceTypeArray?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["total"] = self.total?.encodeToJSON()
        nillableDictionary["count"] = self.count?.encodeToJSON()
        nillableDictionary["offset"] = self.offset?.encodeToJSON()
        nillableDictionary["data"] = self.data?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
