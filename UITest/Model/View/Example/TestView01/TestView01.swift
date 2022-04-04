import UIKit
import x3UI

class TestView01: UIX3XibView {
    @IBOutlet private weak var textView: UITextView?
    
    override func setupView() {
        super.setupView()
        self.textView?.font = Config.Fonts.NotoSansRegular(size: 16)
        self.textView?.text = Config.Defaults.STR_LOREMIPSUM
    }

}
