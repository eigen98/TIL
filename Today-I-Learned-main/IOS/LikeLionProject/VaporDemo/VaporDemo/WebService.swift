//
//  WebService.swift
//  VaporDemo
//
//  Created by JeongMin Ko on 2022/12/05.
//

import Foundation
class WebService {
    func fetchData(url: String) async throws -> GitMemberInfo? {
        guard let url = URL(string: url) else { return nil }
        
        let (data, error) = try await URLSession.shared.data(from: url)
        print(data)
        print(error)
        let centers = try JSONDecoder().decode(GitMemberInfo.self, from: data)
        print(centers)
        return centers
    }
}

