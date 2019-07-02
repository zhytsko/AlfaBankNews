import Alamofire
import SWXMLHash

class ListViewModel {
    let model = ListModel()
    let networkManager = NetworkManager()
    
    func setup(completion: @escaping () -> Void) {
        networkManager.loadData(category: model.category) { [weak self] arrayOfNews in
            for news in arrayOfNews {
                self?.model.items.append(news)
            }
            self?.model.category += 1
            completion()
        }
    }
    
    func update(cell: inout ListTableViewCell, indexPath: IndexPath) {
        cell.nameLabel.text = self.model.items[indexPath.row].title
    }
    
    func getNewsLink(indexPath: IndexPath) -> URL {
        return model.items[indexPath.row].link
    }
}
