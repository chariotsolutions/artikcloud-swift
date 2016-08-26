//
// Message.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Message Information. */
public class Message: JSONEncodable {
    public var data: [String:AnyObject]?
    /** Source Device ID. */
    public var sdid: String?
    /** Timestamp (past, present or future). Defaults to current time if not provided. */
    public var ts: Int64?
    /** Type - message. */
    public var type: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["data"] = self.data?.encodeToJSON()
        nillableDictionary["sdid"] = self.sdid
        nillableDictionary["ts"] = self.ts?.encodeToJSON()
        nillableDictionary["type"] = self.type
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}