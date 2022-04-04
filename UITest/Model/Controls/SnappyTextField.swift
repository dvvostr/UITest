import UIKit
//import SnapKit

final class SnappyTextField: UITextField {
    
    // MARK: - Subviews
    
    private lazy var lblPlaceholder: UILabel = {
        let view = UILabel()
        if let font = self.font {
            view.font = font
        }
        view.textColor = .lightGray
        return view
    }()
    
    // MARK: - Properties
    
    private weak var _delegate: UITextFieldDelegate?
    
    override var placeholder: String? {
        get { lblPlaceholder.text }
        set { lblPlaceholder.text = newValue }
    }
    
    override var attributedPlaceholder: NSAttributedString? {
        get { lblPlaceholder.attributedText }
        set { lblPlaceholder.attributedText = newValue }
    }
    
    override var delegate: UITextFieldDelegate? {
        get { _delegate }
        set { _delegate = newValue }
    }
    
    override var text: String? {
        didSet { slidePlaceholderIfNeeded(newText: text) }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupUI()
        super.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        super.delegate = self
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        self.addSubview(lblPlaceholder)
        lblPlaceholder.text = "placeholder"
        lblPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblPlaceholder.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lblPlaceholder.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lblPlaceholder.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func slidePlaceholderIfNeeded(newText: String?) {
        let text = newText ?? ""
        let lineHieght = font?.lineHeight ?? 0
        let translationY = lineHieght + 4
        let transform = text.isEmpty
            ? CGAffineTransform.identity
            : CGAffineTransform(translationX: 0, y: -translationY).scaledBy(x: 0.95, y: 0.95)
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: { self.lblPlaceholder.transform = transform }
        )
    }
}

// MARK: - UITextFieldDelegate
extension SnappyTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        slidePlaceholderIfNeeded(newText: text)
        return _delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        let shouldClear = _delegate?.textFieldShouldClear?(textField) ?? true
        if shouldClear {
            slidePlaceholderIfNeeded(newText: nil)
        }
        return shouldClear
    }
}
