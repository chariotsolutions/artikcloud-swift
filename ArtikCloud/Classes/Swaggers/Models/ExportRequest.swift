//
// ExportRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Export Request. */
public class ExportRequest: JSONEncodable {
    public var endDate: Int64?
    public var format: String?
    public var order: String?
    public var sdids: String?
    public var sdtids: String?
    public var startDate: Int64?
    public var trialId: String?
    public var uids: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["endDate"] = self.endDate?.encodeToJSON()
        nillableDictionary["format"] = self.format
        nillableDictionary["order"] = self.order
        nillableDictionary["sdids"] = self.sdids
        nillableDictionary["sdtids"] = self.sdtids
        nillableDictionary["startDate"] = self.startDate?.encodeToJSON()
        nillableDictionary["trialId"] = self.trialId
        nillableDictionary["uids"] = self.uids
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
