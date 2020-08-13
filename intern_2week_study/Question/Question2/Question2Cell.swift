import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
   public func cellDisplay(text: String, url: URL) {
        self.label.text = text
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
