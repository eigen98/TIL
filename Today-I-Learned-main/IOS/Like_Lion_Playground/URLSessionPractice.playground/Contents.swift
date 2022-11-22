
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let hackersNewsURL = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")!

var bestStoriesList: [Int] = []

let task = URLSession.shared.dataTask(with: hackersNewsURL) { (data, response, error) in
    // 1. error가 nil인지 확인
    guard error == nil else {
        print("Error: \(error)")
        return
    }
    // 2. response가 잘 받아왔는지 status code 확인
    if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
        print("Response Error: \(httpResponse.statusCode)")
        return
    }
    
    guard let data = data else {
        print("Nothing")
        return
    }
    // 3. data decode
    do {
        let bestStoriesData = try JSONDecoder().decode([Int].self, from: data)
        bestStoriesList = bestStoriesData
    } catch {
        print("Decode Error: \(error.localizedDescription)")
    }

}

task.resume()
