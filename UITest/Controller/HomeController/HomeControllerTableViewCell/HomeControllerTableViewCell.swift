import UIKit

@objc public protocol UICustomHomeControllerTableCellDelegate: AnyObject {
    @objc optional func cellValueChange(sender: Any?, value: Any?)
    @objc optional func cellClick(sender: Any?)
}

class HomeControllerTableViewCell: UITableViewCell {
    @IBOutlet public weak var container: UIView?
    @IBOutlet public weak var picture: UIImageView?
    @IBOutlet public weak var label: UILabel?
    
    public var delegate: UICustomHomeControllerTableCellDelegate?
    public var item: (index: Int, name: String, imageName: String)? {
        didSet {
            self.picture?.image = UIImage(named: self.item?.imageName ?? "")?.withRenderingModeTemplate
            self.label?.text = self.item?.name ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.selectionStyle = .none
        self.picture?.tintColor = Config.Colors.tint
        self.container?.backgroundColor = Config.Colors.backgroundGray
        self.label?.textColor = Config.Colors.text
        self.container?.layer.cornerRadius = 6
        self.container?.isUserInteractionEnabled = true
        self.container?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCellClick(sender:))))
    }
    @objc private func handleCellClick(sender: Any?) {
        self.delegate?.cellClick?(sender: self)
    }
    
}
