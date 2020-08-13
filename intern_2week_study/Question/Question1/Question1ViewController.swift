import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var warningLabel: UILabel!
    
    // 画面が読み込まれたときに行う処理
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
    }
    
    // textFieldに入力された文字列をtextViewに表示
    @IBAction func addText(_ sender: UIButton) {
        guard let inputValue = textField.text, !inputValue.isEmpty else {
            warningLabel.isHidden = false
            return
        }
        textView.text += inputValue + "\n"
        textField.text = ""
        warningLabel.isHidden = true
    }
    
    // textViewの中身を空にする
    @IBAction func clearText(_ sender: UIButton) {
        clearText()
    }
    
    private func clearText() {
        textView.text = ""
    }
}
