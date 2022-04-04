import UIKit
import x3Core
import x3UI

class ExampleTableViewRow6: UITableViewCell {

    @IBOutlet private weak var containerView: UIView?
    @IBOutlet private weak var pucture: UIImageView?
    @IBOutlet private weak var caption: UILabel?
    public var onRowClick: ObjectEvent?
    
    public var item: MainMenuDataItem? {
        didSet {
            self.pucture?.image = UIImage(named: self.item?.imageName ?? "")?.withRenderingModeTemplate
            self.caption?.text = item?.caption ?? ""
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        // Initialization code
    }
    private func setupView() {
        self.containerView?.backgroundColor = Config.Colors.backgroundGray
        self.containerView?.layer.cornerRadius = 8
        self.containerView?.layer.masksToBounds = true
        
        self.pucture?.tintColor = Config.Colors.tint
        
        self.caption?.textColor = Config.Colors.text
        self.caption?.font = Config.Fonts.NotoSansRegular(size: 16)
        
        self.containerView?.isUserInteractionEnabled = true
        self.containerView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleRowClick(sender:))))
    }
    @objc private func handleRowClick(sender: Any?) {
        self.onRowClick?(self)
    }
}
