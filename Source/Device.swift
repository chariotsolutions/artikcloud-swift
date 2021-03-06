//
//  Device.swift
//  ArtikCloudSwift
//
//  Created by Paul-Valentin Mini on 6/8/17.
//  Copyright © 2017-2018 Samsung Electronics Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper
import PromiseKit
#if os(iOS)
import SafariServices
#endif

open class Device: Mappable, AccessibleArtikInstance, RemovableArtikInstance {
    public var id: String?
    public var uid: String?
    public var dtid: String?
    public var name: String?
    public var manifestVersion: Int64?
    public var manifestVersionPolicy: DevicesAPI.ManifestVersionPolicy?
    public var needProviderAuth: Bool?
    public var cloudAuthorization: DevicesAPI.CloudAuthorization?
    public var properties: [String:Any]?
    public var createdOn: ArtikTimestamp?
    public var connected: Bool?
    public var certificateInfo: [String:Any]?
    public var certificateSignature: String?
    public var eid: String?
    public var providerCredentials: [String:Any]?
    public var deviceTypeName: String?
    public var deviceTypeIsPublished: Bool?
    public var deviceTypeIsProtected: Bool?
    public var sharedWithMe: String?
    public var sharedWithOthers: Bool?
    
    required public init?(map: Map) {}
    
    public init() {}
    
    public func mapping(map: Map) {
        id <- map["id"]
        uid <- map["uid"]
        dtid <- map["dtid"]
        name <- map["name"]
        manifestVersion <- map["manifestVersion"]
        manifestVersionPolicy <- map["manifestVersionPolicy"]
        needProviderAuth <- map["needProviderAuth"]
        cloudAuthorization <- map["cloudAuthorization"]
        properties <- map["properties"]
        createdOn <- map["createdOn"]
        connected <- map["connected"]
        certificateInfo <- map["certificateInfo"]
        certificateSignature <- map["certificateSignature"]
        eid <- map["eid"]
        providerCredentials <- map["providerCredentials"]
        deviceTypeName <- map["deviceTypeName"]
        deviceTypeIsPublished <- map["deviceTypeIsPublished"]
        deviceTypeIsProtected <- map["deviceTypeIsProtected"]
        sharedWithMe <- map["sharedWithMe"]
        sharedWithOthers <- map["sharedWithOthers"]
    }
    
    // MARK: - Token
    
    public func getToken(createIfNone: Bool) -> Promise<DeviceToken> {
        let (promise, resolver) = Promise<DeviceToken>.pending()
        
        if let id = id {
            DevicesAPI.getToken(id: id, createIfNone: createIfNone).done { token in
                resolver.fulfill(token)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func revokeToken() -> Promise<DeviceToken> {
        let (promise, resolver) = Promise<DeviceToken>.pending()
        
        if let id = id {
            DevicesAPI.revokeToken(id: id).done { token in
                resolver.fulfill(token)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    // MARK: - Cloud Connector
    
    public func authorize() -> Promise<URLRequest> {
        let (promise, resolver) = Promise<URLRequest>.pending()
        
        if let id = id {
            DevicesAPI.authorize(id: id).done { request in
                resolver.fulfill(request)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func unauthorize() -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let id = id {
            DevicesAPI.unauthorize(id: id).done {
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func isCloudAuthorized() -> Bool {
        if let cloudAuthorization = cloudAuthorization {
            if cloudAuthorization == .unauthorized {
                return false
            }
        }
        return true
    }
    
    // MARK: - Status
    
    public func getStatus(includeSnapshot: Bool? = nil, includeSnapshotTimestamp: Bool? = nil) -> Promise<DeviceStatus> {
        let (promise, resolver) = Promise<DeviceStatus>.pending()
        
        if let id = id {
            DevicesAPI.getStatus(id: id, includeSnapshot: includeSnapshot, includeSnapshotTimestamp: includeSnapshotTimestamp).done { status in
                resolver.fulfill(status)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func updateStatus(to value: DeviceStatus.DeviceStatusAvailability) -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let id = id {
            DevicesAPI.updateStatus(id: id, to: value).done {
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    // MARK: - Sharing
    
    public func getShares(count: Int, offset: Int = 0) -> Promise<Page<DeviceShare>> {
        let (promise, resolver) = Promise<Page<DeviceShare>>.pending()
        
        if let id = id {
            DevicesAPI.getShares(id: id, count: count, offset: offset).done { page in
                resolver.fulfill(page)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func getShares() -> Promise<Page<DeviceShare>> {
        let (promise, resolver) = Promise<Page<DeviceShare>>.pending()
        
        if let id = id {
            DevicesAPI.getShares(id: id).done { page in
                resolver.fulfill(page)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func getShare(id: String) -> Promise<DeviceShare> {
        let (promise, resolver) = Promise<DeviceShare>.pending()
        
        if let did = self.id {
            DevicesAPI.getShare(id: did, sid: id).done { share in
                resolver.fulfill(share)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func share(email: String) -> Promise<DeviceShare> {
        let (promise, resolver) = Promise<DeviceShare>.pending()
        
        if let id = id {
            DevicesAPI.share(id: id, email: email).done { share in
                resolver.fulfill(share)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func unshare(id: String) -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let did = self.id {
            DevicesAPI.unshare(id: did, sid: id).done {
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func isSharable() -> Bool {
        return (deviceTypeIsPublished ?? false) && (sharedWithMe == nil)
    }
    
    // MARK: - Monetization
    
    public func getUpgradeURL(action: MonetizationAPI.MonetizationUpgradeAction = .upgrade) -> Promise<URL> {
        let (promise, resolver) = Promise<URL>.pending()
        
        if let id = id {
            MonetizationAPI.getUpgradeURL(did: id, action: action).done { result in
                resolver.fulfill(result)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    #if os(iOS)
    public func getUpgradeController(action: MonetizationAPI.MonetizationUpgradeAction = .upgrade) -> Promise<SFSafariViewController> {
        let (promise, resolver) = Promise<SFSafariViewController>.pending()
        
        if let id = id {
            MonetizationAPI.getUpgradeController(did: id, action: action).done { result in
                resolver.fulfill(result)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    #endif
    
    public func getTiers(active: Bool? = nil) -> Promise<[PricingTier]> {
        let (promise, resolver) = Promise<[PricingTier]>.pending()
        
        if let id = id {
            MonetizationAPI.getTiers(did: id, active: active).done { result in
                resolver.fulfill(result)
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    // MARK: - AccessibleArtikInstance
    
    public func updateOnArtik() -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let id = id {
            DevicesAPI.update(id: id, name: name, manifestVersion: manifestVersion, manifestVersionPolicy: manifestVersionPolicy).done { _ in
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    public func pullFromArtik() -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let id = id {
            DevicesAPI.get(id: id, includeProperties: true).done { device in
                self.mapping(map: Map(mappingType: .fromJSON, JSON: device.toJSON(), toObject: true, context: nil, shouldIncludeNilValues: true))
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
    
    // MARK: - RemovableArtikInstance
    
    public func removeFromArtik() -> Promise<Void> {
        let (promise, resolver) = Promise<Void>.pending()
        
        if let id = id {
            DevicesAPI.delete(id: id).done {
                resolver.fulfill(())
            }.catch { error -> Void in
                resolver.reject(error)
            }
        } else {
            resolver.reject(ArtikError.missingValue(reason: .noID))
        }
        return promise
    }
}
