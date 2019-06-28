import UIKit
import Alamofire
import SWXMLHash

struct NetworkManager {
    
    enum Config {
        static let baseURL = "https://alfabank.ru/_/rss/_rss.html?subtype=1"
        static let category = "&category="
        static let city = "&city="
        static let cityNumber = "21"
        static let limit = 15
    }
    
    func loadData(category: Int, completion: @escaping ([News]) -> Void) {
        let urlString = Config.baseURL + Config.category + "\(category)" + Config.city + Config.cityNumber
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url, method: .get, parameters: nil).response { response in
            guard let data = response.data else { return }
            let xml = SWXMLHash.parse(data)
            var items = [] as [News]
            
            for i in 0..<Config.limit {
                if let title = xml["rss"]["channel"]["item"][i]["title"].element,
                    let description = xml["rss"]["channel"]["item"][i]["description"].element,
                    let linkString = xml["rss"]["channel"]["item"][i]["link"].element,
                    let link = URL(string: linkString.text) {
                    items.append(News(title: title.text, description: description.text, link: link))
                }
            }
            completion(items)
        }
    }
}
