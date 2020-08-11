import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    // 画面が読み込まれたときに行う処理
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text! = ""
        textField.text! = ""
        label.isHidden = true
    }
    
    // textFieldに入力された文字列をtextViewに表示
    @IBAction func addText(_ sender: UIButton) {
        if textField.text! == "" {
            label.isHidden = false
        } else {
            textView.text! += textField.text! + "\n"
            textField.text! = ""
            label.isHidden = true
        }
    }
    
    // textViewの中身を空にする
    @IBAction func clearText(_ sender: UIButton) {
        textView.text! = ""
    }
}
