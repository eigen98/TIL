//
//  NetworkManager.swift
//  exApollo
//
//  Created by JeongMin Ko on 2022/05/24.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
}


