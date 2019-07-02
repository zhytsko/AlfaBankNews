import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let listVC = UINavigationController(rootViewController: ListViewController())
        listVC.tabBarItem.image = UIImage(named: "list")
        listVC.tabBarItem.title = "List"
        
        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController())
        favoriteVC.tabBarItem.title = "Favorite"
        favoriteVC.tabBarItem.image = UIImage(named: "favorite")
        
        viewControllers = [listVC, favoriteVC]
    }
}

