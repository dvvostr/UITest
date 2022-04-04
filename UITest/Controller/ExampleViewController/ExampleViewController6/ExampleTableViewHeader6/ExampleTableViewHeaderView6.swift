import UIKit
import x3UI

class ExampleTableViewHeaderView6: UIX3CustomTableHeaderFooterView {

    @IBOutlet private weak var contantView: UIView?
    @IBOutlet public weak var caption: UILabel?

    override func setupView() {
        super.setupView()
        self.contantView?.backgroundColor = Config.Colors.background
        self.contantView?.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleHeaderTap(sender:))))
    }
    @objc private func handleHeaderTap(sender: Any?){
        print("handleHeaderTap")
    }
}

