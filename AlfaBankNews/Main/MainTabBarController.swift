import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBarController?.tabBar.barTintColor = .gray
        tabBarController?.tabBar.tintColor = .darkText
        tabBarController?.tabBar.unselectedItemTintColor = .lightText
        
        let listVC = ListViewController()
        listVC.tabBarItem.image = UIImage(named: "list")
        listVC.tabBarItem.title = "List"
        
        let favoriteVC = FavoriteViewController()
        favoriteVC.tabBarItem.image = UIImage(named: "favorite")
        favoriteVC.tabBarItem.title = "Favorite"
        
        viewControllers = [listVC, favoriteVC]
    }
}

