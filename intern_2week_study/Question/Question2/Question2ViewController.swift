import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    private let images: [String] = [
        "https://2.bp.blogspot.com/-c-Ws8qkxBq4/XKF92e4mmBI/AAAAAAABSHQ/YHiJQq1xOQwpQFXKHhrvZmPa4EhW6xCUQCLcBGAs/s450/gengou_happyou_reiwa.png",
        "https://1.bp.blogspot.com/-3nzUHu2AP3c/Xx-0ffvXGJI/AAAAAAABaWU/WjGBzNs82ZUIqCT-EmLxtopmazY3Z6ecACNcBGAsYHQ/s400/mask_karamaru_megane_earphone.png",
        "https://1.bp.blogspot.com/-ZOg0qAG4ewU/Xub_uw6q0DI/AAAAAAABZio/MshyuVBpHUgaOKJtL47LmVkCf5Vge6MQQCNcBGAsYHQ/s400/pose_pien_uruuru_woman.png",
        "https://1.bp.blogspot.com/-nFOSMkMAO3E/XyZ_YN6Z_yI/AAAAAAABabc/JseXD6VqjQ8MD1n0Osmi2DA3cmUq99nlgCNcBGAsYHQ/s450/movie_baiyousou.png",
        "https://1.bp.blogspot.com/-R9dY32HIJE0/XyI9dfqT0FI/AAAAAAABaYg/XZEM_lCzSikkmpBCJWmUZJC0JpOSPMhwACNcBGAsYHQ/s450/shopping_bag_temochi_man.png",
        "https://1.bp.blogspot.com/-VxmdFd29LXE/XwkxkUU8lrI/AAAAAAABaCk/_wKalHgyMzQ8yZgyVnNTw2ni_7Cg8jbwQCNcBGAsYHQ/s400/okinawa_shishimai.png",
        "https://1.bp.blogspot.com/-RSuvrQ4wbQY/Xv3UKX1cg6I/AAAAAAABZ0w/wNiipvjzqxEHOZBapWy9VbYCDUOtFcNHwCNcBGAsYHQ/s450/rtif_gate_scanner_figure.png"
    ]
    
    // 画面が読み込まれたときに行う処理
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Question2Cell", bundle: nil), forCellReuseIdentifier: "Question2Cell")
    }
}

extension Question2ViewController: UITableViewDataSource {
    // 配列の要素数分セルを表示
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaTexts.count
    }
    
    // セルをカスタマイズ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Question2Cell") as? Question2Cell else {
            return UITableViewCell()
        }
        let url = URL(string: images[indexPath.row])!
        cell.cellDisplay(label: areaTexts[indexPath.row], url: url)
        
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    // セルを押したときにアラートを表示
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var alertController = UIAlertController()
        alertController = UIAlertController(title: areaTexts[indexPath.row], message: "メッセージ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
