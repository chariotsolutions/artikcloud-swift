//
//  DeviceManagementTaskStates.swift
//  ArtikCloudSwift
//
//  Created by Paul-Valentin Mini on 1/17/18.
//  Copyright © 2018 Paul-Valentin Mini. All rights reserved.
//

import Foundation
import ObjectMapper

open class DeviceManagementBaseTaskState: Mappable {
    public var ts: ArtikTimestamp?
    public var errorCode: Int64?
    public var errorMessage: String?
    public var attempts: Int64?
    
    public required init?(map: Map) {}
    
    public init() {}
    
    public func mapping(map: Map) {
        ts <- map["ts"]
        errorCode <- map["errorCode"]
        errorMessage <- map["errorMessage"]
        attempts <- map["numAttempts"]
    }
}

open class DeviceManagementTaskState: DeviceManagementBaseTaskState {
    public var status: DeviceManagementTask.TaskStatus?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        status <- map["status"]
    }
}

open class DeviceManagementDeviceTaskState: DeviceManagementBaseTaskState {
    
    public enum TaskStatus: String {
        case requested = "REQUESTED"
        case queued = "QUEUED"
        case processing = "PROCESSING"
        case failed = "FAILED"
        case succeeded = "SUCCEEDED"
        case cancelRequested = "CANCEL_REQUESTED"
        case cancelled = "CANCELLED"
    }
    
    public var did: String?
    public var status: TaskStatus?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        did <- map["did"]
        status <- map["status"]
    }
}