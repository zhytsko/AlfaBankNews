import UIKit

class ListViewController: UIViewController {
    
    let viewModel = ListViewModel()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBar()
        viewModel.setup() { [weak self] in
            self?.refreshData()
        }
    }
    
    func setupTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "listID")
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor,
                            left: view.leftAnchor,
                            bottom: view.bottomAnchor,
                            right: view.rightAnchor)
    }
    
    func setupNavBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationItem.title = "News"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkText, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func refreshData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "listID", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        viewModel.update(cell: &cell, indexPath: indexPath)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = viewModel.getNewsLink(indexPath: indexPath)
        let newsViewController = NewsViewController(link: link)
        self.navigationController?.pushViewController(newsViewController, animated: true)
    }
    
}
