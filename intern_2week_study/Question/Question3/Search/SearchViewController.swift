import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func searchArticles() {
        // 多重タップ防止
        searchButton.isEnabled = false
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            // URLSessionはbackground threadで行われる為UIの更新を明示的にMain Theadで行う
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.articleListScreen(articles)
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                }
                self?.searchButton.isEnabled = true
            }
        }
    }
    
    private func articleListScreen(_ articles: [Article]) {
        let articleListViewController = ArticleListViewController.makeViewController(articles)
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}
