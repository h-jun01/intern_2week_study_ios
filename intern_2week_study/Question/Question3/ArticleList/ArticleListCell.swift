import Nuke
import UIKit

final class ArticleListCell: UITableViewCell {
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var titleTextLabel: UILabel!
    @IBOutlet weak private var descriptionTextLabel: UILabel!
    
    func set(_ article: Article) {
        titleTextLabel.text = article.title
        descriptionTextLabel.text = "LGTM: " + String(article.likesCount)
        
        guard let urlString = article.user?.profileImageUrl, let url = URL(string: urlString) else { return }
        Nuke.loadImage(with: url, into: userImageView)
    }
}
