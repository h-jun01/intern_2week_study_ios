import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    // 画面が読み込まれたときに行う処理
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
    }
    
    // textFieldに入力された文字列をtextViewに表示
    @IBAction func addText(_ sender: UIButton) {
        guard let inputValue = textField.text, !inputValue.isEmpty else {
            label.isHidden = false
            return
        }
        textView.text += inputValue + "\n"
        textField.text = ""
        label.isHidden = true
    }
    
    // textViewの中身を空にする
    @IBAction func clearText(_ sender: UIButton) {
        textView.text = ""
    }
}
