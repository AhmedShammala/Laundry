//
//  Reachability.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import SystemConfiguration

open class Reachability {
    static let shared:Reachability = Reachability()

    func isConnectedToNetwork() -> Bool {
        guard let flags = getFlags() else { return false }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    func getFlags() -> SCNetworkReachabilityFlags? {
        guard let reachability = ipv4Reachability() ?? ipv6Reachability() else {
            return nil
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(reachability, &flags) {
            return nil
        }
        return flags
    }
    
    func ipv6Reachability() -> SCNetworkReachability? {
        var zeroAddress = sockaddr_in6()
        zeroAddress.sin6_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin6_family = sa_family_t(AF_INET6)
        
        return withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        })
    }
    
    func ipv4Reachability() -> SCNetworkReachability? {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        return withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        })
    }
}
