//
// Created by 河口怜和人 on 2022/02/02.
//

import Foundation

let config = URLSessionConfiguration.default

struct Test: Encodable, Decodable{
    let status: Int
}


func http() -> Bool{
    var bool: Bool
    let session = URLSession(configuration: config)
    var urlComponents = URLComponents(string: "http://localhost:8000/api/v1/app")
    urlComponents?.query = "type=users"
    let url = urlComponents?.url
    let task = session.dataTask(with: url!) { data, response, error in
        if let error = error{
            print(error.localizedDescription)
            return
        }

        guard let data = data, let response = response as? HTTPURLResponse else {
            print("not date")
            return
        }

        if response.statusCode == 200 {
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                var status = String(describing: json["status"]!)
                let regex = try! NSRegularExpression(pattern: "20[0-9]?", options: [])
                regex.matches(in: status, range: NSRange(0..<status.count)).count > 0
            }catch{
                print("not data")
            }
        }
    }
    task.resume()
    return false
}
