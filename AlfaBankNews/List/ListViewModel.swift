import Alamofire
import SWXMLHash

class ListViewModel {
    let model = ListModel()
    let networkManager = NetworkManager()
    
    func setup(complition: @escaping () -> Void) {
        networkManager.loadData(category: model.category) { arrayOfNews in
            for news in arrayOfNews {
                self.model.items.append(news)
            }
            self.model.category += 1
            complition()
        }
    }
    
    func update(cell: inout ListTableViewCell, indexPath: IndexPath) {
        cell.nameLabel.text = self.model.items[indexPath.row].title
    }
}
