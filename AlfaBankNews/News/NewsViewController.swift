import UIKit
import WebKit

class NewsViewController: UIViewController {
    
    var webView: WKWebView
    
    let link: URL
    
    init(link: URL) {
        self.webView = WKWebView()
        self.link = link
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myRequest = URLRequest(url: link)
        webView.load(myRequest)
        guard let favoriteImage = UIImage(named: "favorite") else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: favoriteImage, style: .plain, target: self, action: nil)
    }
}

extension NewsViewController: WKUIDelegate {
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
}
