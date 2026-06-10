//
//  NetworkManger.swift
//  Zoho People
//
//  Created by Prem Kumar Gundu on 6/1/26.
//
protocol NetworkProtocol{
    func getPeopleData(for url: String) -> [People]?
}

final class NetworkManager: Sendable, NetworkProtocol{
    
    static let sharedInstance = NetworkManager()
    
    private init(){}
    
    func getPeopleData(for url: String) -> [People]? {
        //TODO: Need to implemet API
        return nil
    }
}
