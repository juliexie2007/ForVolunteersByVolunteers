//
//  Network.swift
//  VolunteeringManager
//
//  Created by Judy Guo on 10/19/21.
//
import Apollo
import Foundation

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://www.picard.impactonline.org/s/user")!)
}
