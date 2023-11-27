//
//  SecureAddressFacade.swift
//  MineCharts
//
//  Created by Yanis on 27.11.2023.
//

import Foundation

protocol SecurableAddress: AnyObject {
    func save(address: String) throws
    func fetch() throws -> String
    func delete() throws
}

final class SecureAddressFacade: SecurableAddress {
    
    private var secureKey: String
    private var manager: KeyChainProtocol
    
    init(secureKey: String) {
        self.secureKey = secureKey
        manager = KeyChainManager()
    }
    
    func save(address: String) throws {
        guard let data = address.data(using: .utf8)
        else { throw DataError.badEncoding }
        
        let isSuccess = manager.save(data: data, forKey: secureKey)
        
        guard isSuccess else { throw DataError.saveGetFailed }
    }
    
    func fetch() throws -> String {
        guard let data = manager.fetch(forKey: secureKey)
        else { throw DataError.badDecoding }
        
        guard let result = String(data: data, encoding: .utf8)
        else { throw DataError.fetchGetFailed }
        
        return result
    }
    
    func delete() throws {
        let isSuccess = manager.delete(forKey: secureKey)
        guard isSuccess else { throw DataError.deleteGetFailed }
    }
    
}
