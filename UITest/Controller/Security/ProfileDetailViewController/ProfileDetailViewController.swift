import UIKit
import x3Core
import x3UI
import x3CustomUI1

class ProfileDetailViewController: UIX3CustomViewController {

    @IBOutlet private weak var actionView: UIView?
    @IBOutlet private weak var actionButton: UX3CustomButton? {
        didSet {
            if #available(iOS 15.0, *) {
                var configuration = UIButton.Configuration.plain()
                configuration.title = self.actionButton?.title(for: .normal)
                configuration.titlePadding = 0
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 36, bottom: 12, trailing: 36)
                self.actionButton?.configuration = configuration
            }
            self.actionButton?.normalBackgroundColor = UIColor.clear
            self.actionButton?.normalForegroundColor = Config.Colors.tint
            self.actionButton?.normalBorderColor = Config.Colors.tint
            self.actionButton?.selectedBackgroundColor = Config.Colors.tint
            self.actionButton?.selectedForegroundColor = Config.Colors.background
            self.actionButton?.selectedBorderColor = Config.Colors.tint
            self.actionButton?.setTitle("Apply".localized.uppercased(), for: .normal)
            self.actionButton?.titleEdgeInsets = UIEdgeInsets(top: 18, left: 122, bottom: 8, right: 122)
            self.actionButton?.cornerRadius = -1
            self.actionButton?.addTarget(self, action: #selector(self.handleActionButtonClick), for: .touchUpInside)
            
        }
    }
    @IBOutlet private weak var actionViewHeightConstraint: NSLayoutConstraint? {
        didSet {
            self.actionViewHeightConstraint?.constant = 58
        }
    }
    @IBOutlet private weak var viewBottomConstraint: NSLayoutConstraint? {
        didSet {
            self.viewBottomConstraint?.constant = 0
        }
    }
    @IBOutlet private weak var inputOldPIN: UIX3CaptionTextField? {
        didSet {
            initializeInput(container: self.inputOldPIN, caption: "Old pin code")
        }
    }
    @IBOutlet private weak var inputNewPIN: UIX3CaptionTextField? {
        didSet {
            initializeInput(container: self.inputNewPIN, caption: "New pin code")
        }
    }
    @IBOutlet private weak var inputConfirmPIN: UIX3CaptionTextField? {
        didSet {
            initializeInput(container: self.inputConfirmPIN, caption: "Confirm PIN")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupView() {
        super.setupView()
        self.actionView?.backgroundColor = Config.Colors.background
        self.actionView?.addBorders(edges: [.top], color: Config.Colors.tintLight)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    private func initializeInput(container: UIX3CaptionTextField?, caption: String) {
        container?.isSecureTextEntry = true
        container?.maxLength = 4
        container?.backgroundColor = UIColor.clear
        container?.caption = caption.localized.lowercased()
        container?.keyboardType = .numberPad
        container?.rightViewMode = .whileEditing
        container?.rightButtonType = .clear
        container?.textControlDelegate = self
        container?.rightButtonRightOffset = 4
        container?.textAlignment = .left
        container?.textEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        container?.font = Config.Fonts.NotoSansRegular(size: 16)
        container?.placeholderFont = Config.Fonts.NotoSansRegular(size: 14)
        container?.layer.cornerRadius = 8
    }
    override func keyboardEvent(duration: Double, options: UIView.AnimationOptions, bottomPosition: CGFloat) {
        super.keyboardEvent(duration: duration, options: options, bottomPosition: bottomPosition)
        let _val = (bottomPosition != 0) ? (bottomPosition - (UIApplication.keyWindow?.safeAreaInsets.bottom ?? 0)) : bottomPosition

        self.viewBottomConstraint?.constant = _val
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc private func handleActionButtonClick() {
        print("handleActionButtonClick")
    }
}

extension ProfileDetailViewController: UX3TextControlDelegate {
    func UX3TextControlTextChange(_ sender: Any?) {
    }
    func UX3TextControlLeftButtonClick(_ sender: Any?) {
    }
    func UX3TextControlRightButtonClick(_ sender: Any?) {
    }
}
