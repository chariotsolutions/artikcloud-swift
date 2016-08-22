//
// OutputRule.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Rule information. */
public class OutputRule: JSONEncodable {
    public var aid: String?
    public var createdOn: Int64?
    public var description: String?
    public var enabled: Bool?
    public var error: RuleError?
    public var id: String?
    public var index: Int32?
    public var invalidatedOn: Int64?
    public var languageVersion: Int32?
    public var modifiedOn: Int64?
    public var name: String?
    public var rule: [String:AnyObject]?
    public var uid: String?
    public var warning: RuleWarningOutput?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["aid"] = self.aid
        nillableDictionary["createdOn"] = self.createdOn?.encodeToJSON()
        nillableDictionary["description"] = self.description
        nillableDictionary["enabled"] = self.enabled
        nillableDictionary["error"] = self.error?.encodeToJSON()
        nillableDictionary["id"] = self.id
        nillableDictionary["index"] = self.index?.encodeToJSON()
        nillableDictionary["invalidatedOn"] = self.invalidatedOn?.encodeToJSON()
        nillableDictionary["languageVersion"] = self.languageVersion?.encodeToJSON()
        nillableDictionary["modifiedOn"] = self.modifiedOn?.encodeToJSON()
        nillableDictionary["name"] = self.name
        nillableDictionary["rule"] = self.rule?.encodeToJSON()
        nillableDictionary["uid"] = self.uid
        nillableDictionary["warning"] = self.warning?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
