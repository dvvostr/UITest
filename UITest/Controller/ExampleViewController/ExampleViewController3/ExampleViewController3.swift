import UIKit
import x3Core
import x3UI
import x3CustomUI1

class ExampleViewController3: UIX3CustomViewController {

    @IBOutlet private weak var actionViewHeightConstraint: NSLayoutConstraint?
    @IBOutlet private weak var viewBottomConstraint: NSLayoutConstraint? {
        didSet {
            self.viewBottomConstraint?.constant = 0
        }
    }

    @IBOutlet private weak var actionButton: UX3CustomButton? {
        didSet {
            if #available(iOS 15.0, *) {
                var configuration = UIButton.Configuration.plain()
                configuration.title = self.actionButton?.title(for: .normal)
                configuration.titlePadding = 0
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 36, bottom: 8, trailing: 36)
                self.actionButton?.configuration = configuration
            } else {
                self.actionButton?.contentEdgeInsets = UIEdgeInsets(top: 8, left: 36, bottom: 8, right: 36)
            }
            self.actionButton?.adjustsImageWhenHighlighted = false
            self.actionButton?.clipsToBounds = true;
            self.actionButton?.addTarget(self, action: #selector(self.handleActionButtonClick), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var textInput1: UX3CustomInput? {
        didSet {
            self.textInput1?.rightViewMode = .whileEditing
            self.textInput1?.rightButtonType = .clear
            self.textInput1?.textControlDelegate = self
            self.textInput1?.rightButtonRightOffset = 4
            self.textInput1?.textAlignment = .left
        }
    }
    @IBOutlet private weak var textInput2: UX3CustomInput? {
        didSet {
            self.textInput2?.rightButtonType = .button
            self.textInput2?.textControlDelegate = self
            self.textInput2?.rightButtonRightOffset = 4
            self.textInput2?.rightButtonViewMode = .always
            self.textInput2?.rightButtonImageOffset = 0
            self.textInput2?.rightButtonImage = Config.Images.iconMenu?.withRenderingModeTemplate
        }
    }
    @IBOutlet private weak var textInput3: UX3CustomInput? {
        didSet {
            self.textInput3?.leftButtonType = .icon
            self.textInput3?.leftButtonViewMode = .always
            self.textInput3?.leftButtonImage = Config.Images.iconUser?.withTintColor(Config.Colors.textGray.withAlphaComponent(0.8))
            self.textInput3?.leftButtonLeftOffset = 8

            self.textInput3?.rightButtonType = .button
            self.textInput3?.textControlDelegate = self
            self.textInput3?.rightButtonRightOffset = 4
            self.textInput3?.rightButtonViewMode = .always
            self.textInput3?.rightButtonImageOffset = 0
            self.textInput3?.rightButtonImage = Config.Images.iconMenu?.withTintColor(Config.Colors.text)
        }
    }
    @IBOutlet private weak var textInput4: UX3CustomInput? {
        didSet {
            self.textInput4?.textControlDelegate = self
            self.textInput4?.placeholder = "Input here".localized

            self.textInput4?.leftButtonType = .icon
            self.textInput4?.leftButtonViewMode = .always
            self.textInput4?.leftButtonImage = Config.Images.iconPlaceholder
            self.textInput4?.leftButtonLeftOffset = 8

            self.textInput4?.rightButtonType = .clear
            self.textInput4?.rightButtonViewMode = .always
            self.textInput4?.rightButtonImage = Config.Images.iconClose
            self.textInput4?.rightButtonRightOffset = 4
            self.textInput4?.rightButtonImageOffset = 0
        }
    }
    @IBOutlet private weak var textInput5: UIX3MultilineTextField? {
        didSet {
            self.textInput5?.placeholder = "Text view placeholder"
            self.textInput5?.leftView = UIImageView(image: Config.Images.iconCard)
        }
    }
    @IBOutlet private weak var textInput6: UIX3TextView? {
        didSet {
            self.textInput6?.textColor = Config.Colors.text
            self.textInput6?.rightButtonType = .clear
            self.textInput6?.rightButtonImage = Config.Images.iconClose
            self.textInput6?.rightButtonRightOffset = 4
            self.textInput6?.rightButtonImageOffset = 0
            self.textInput6?.leftButtonType = .icon
            self.textInput6?.leftButtonImageOffset = 2
            self.textInput6?.leftButtonLeftOffset = 2
            self.textInput6?.leftButtonImage = Config.Images.iconPlaceholder
            self.textInput6?.font = Config.Fonts.NotoSansRegular(size: 16)
//            self.textInput6?.tintColor = UIColor.red
        }
    }
    private lazy var _view7: UIX3CustomView? = {
        let _view = UIX3CustomView()
        let _input = UIX3TextField()
        _view.addSubview(_input)
        _input.fillSuperview()
        _input.textControlDelegate = self
        _input.placeholder = "Input here".localized
        _input.leftButtonType = .icon
        _input.leftButtonViewMode = .always
        _input.leftButtonImage = Config.Images.iconPlaceholder
        _input.leftButtonLeftOffset = 8
        _input.rightButtonType = .clear
        _input.rightButtonViewMode = .always
        _input.rightButtonImage = Config.Images.iconClose
        _input.rightButtonRightOffset = 4
        _input.rightButtonImageOffset = 0
        return _view
    }()
    @IBOutlet private weak var textInput7: UIX3CaptionView? {
        didSet {
            self.textInput7?.font = Config.Fonts.NotoSansRegular(size: 14)
            self.textInput7?.captionInsets = UIEdgeInsets(top: 8, left: 16, bottom: 6, right: 16)
            self.textInput7?.viewInsets = UIEdgeInsets(top: 6, left: 16, bottom: 16, right: 16)
            self.textInput7?.caption = "Заголовок элемента"
            self.textInput7?.view = self._view7
            self.textInput7?.backgroundColor = Config.Colors.backgroundGray
            self.textInput7?.layer.cornerRadius = 8
        }
    }
    private lazy var _view8: UIX3CustomView? = {
        let _view = UIX3CustomView()
        let _input = UIX3TextView()
        _view.addSubview(_input)
        _input.fillSuperview()
        _input.backgroundColor = Config.Colors.background
        _input.textControlDelegate = self
        _input.placeholder = "Placeholder".localized
        _input.leftButtonType = .none
        _input.rightButtonType = .icon
        _input.rightButtonImage = Config.Images.iconTrash
        _input.rightButtonRightOffset = 4
        _input.rightButtonImageOffset = 0
        _input.leftButtonImageOffset = 2
        _input.leftButtonLeftOffset = 0
        _input.font = Config.Fonts.NotoSansRegular(size: 16)
        _input.placeholderFont = Config.Fonts.NotoSansRegular(size: 12)
        return _view
    }()
    @IBOutlet private weak var textInput8: UIX3CaptionView? {
        didSet {
            self.textInput8?.font = Config.Fonts.NotoSansRegular(size: 14)
            self.textInput8?.captionInsets = UIEdgeInsets(top: 8, left: 16, bottom: 6, right: 16)
            self.textInput8?.viewInsets = UIEdgeInsets(top: 6, left: 16, bottom: 16, right: 16)
            self.textInput8?.caption = "Заголовок элемента"
            self.textInput8?.view = self._view8
            self.textInput8?.backgroundColor = Config.Colors.backgroundGray
            self.textInput8?.layer.cornerRadius = 8
        }
    }
    @IBOutlet private weak var textInput9: UIX3CaptionTextField? {
        didSet {
            self.textInput9?.caption = "Заголовок элемента"
            self.textInput9?.rightButtonType = .clear
            self.textInput9?.rightButtonViewMode = .always
            self.textInput9?.rightButtonImage = Config.Images.iconClose
            self.textInput9?.rightButtonRightOffset = 4
            self.textInput9?.rightButtonImageOffset = 0
            self.textInput9?.placeholderFont = Config.Fonts.NotoSansRegular(size: 12)
        }
    }
    public override func setupView() {
        super.setupView()
        self.view.backgroundColor = Config.Colors.panelBackground

    }

    override func keyboardEvent(duration: Double, options: UIView.AnimationOptions, bottomPosition: CGFloat) {
        super.keyboardEvent(duration: duration, options: options, bottomPosition: bottomPosition)
//        let _val = (bottomPosition == 0) ? -(self.actionViewHeightConstraint?.constant ?? 0) : bottomPosition
        let _val = (bottomPosition != 0) ? (bottomPosition - (UIApplication.keyWindow?.safeAreaInsets.bottom ?? 0)) : bottomPosition

        self.viewBottomConstraint?.constant = _val
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc private func handleActionButtonClick() {
        self.view.endEditing(true)
    }
}

extension ExampleViewController3: UX3TextControlDelegate {
    func UX3TextControlTextChange(_ sender: Any?) {
//        print("UX3TextFieldTextChange = \((sender as? UX3CustomInput)?.text ?? "<?>")")
    }
    func UX3TextControlLeftButtonClick(_ sender: Any?) {

    }
    func UX3TextControlRightButtonClick(_ sender: Any?) {
//        self.view.endEditing(true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            self.view.makeToast("Text = \((sender as? UX3CustomInput)?.text ?? "<?>")")
//        }
    }
}
