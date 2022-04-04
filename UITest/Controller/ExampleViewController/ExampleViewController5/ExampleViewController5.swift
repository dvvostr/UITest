import UIKit
import x3UI

class ExampleViewController5: UIX3CustomViewController {

    @IBOutlet private weak var button1: UX3CustomButton?
    @IBOutlet private weak var button2: UX3CustomButton?
    @IBOutlet private weak var button3: UX3CustomButton?
    @IBOutlet private weak var button4: UX3CustomButton?
    @IBOutlet private weak var button5: UX3CustomButton?
    @IBOutlet private weak var button6: UX3CustomButton?
    @IBOutlet private weak var buttonCancel: UX3CustomButton?

    override func setupView() {
        super.setupView()
        self.initializeButton(button: self.button1, caption: "Alert String 1")
        self.initializeButton(button: self.button2, caption: "Alert Attr 2")
        self.initializeButton(button: self.button3, caption: "Alert HTML 3")
        self.initializeButton(button: self.button4, caption: "Wrapper view 1")
        self.initializeButton(button: self.button5, caption: "Wait view")
        self.initializeButton(button: self.button6, caption: "Modal card")
        self.buttonCancel?.normalBackgroundColor = UIColor.clear
        self.buttonCancel?.normalForegroundColor = Config.Colors.tint
        self.buttonCancel?.normalBorderColor = UIColor.clear
        self.buttonCancel?.selectedBackgroundColor = UIColor.clear
        self.buttonCancel?.selectedForegroundColor = Config.Colors.textGray
        self.buttonCancel?.selectedBorderColor = UIColor.clear
        self.buttonCancel?.setTitle("Back".localized, for: .normal)
        self.buttonCancel?.addTarget(self, action: #selector(self.handleButtonClick(sender:)), for: .touchUpInside)
    }
    override func invalidate() {
        super.invalidate()
        
    }
    
    
    private func initializeButton(button: UX3CustomButton?, caption: String) {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = button?.title(for: .normal)
            configuration.titlePadding = 0
            if (button != button1 && button != button2) {
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 36, bottom: 12, trailing: 36)
            }
            button?.configuration = configuration
        } else {
            button?.contentEdgeInsets = UIEdgeInsets(top: 12, left: 36, bottom: 12, right: 36)
        }
        button?.normalBackgroundColor = Config.Colors.tint
        button?.normalForegroundColor = Config.Colors.background
        button?.normalBorderColor = Config.Colors.tint
        button?.selectedBackgroundColor = Config.Colors.tintLight
        button?.selectedForegroundColor = Config.Colors.tint
        button?.selectedBorderColor = Config.Colors.tint
        button?.setTitle(caption.localized.uppercased(), for: .normal)
        button?.cornerRadius = -1
        button?.addTarget(self, action: #selector(self.handleButtonClick(sender:)), for: .touchUpInside)
    }
    @objc private func handleButtonClick(sender: Any?) {
        guard let _btn = sender as? UX3CustomButton else { return }
        let _message = "Order CA Los-Angeles - NY New-York accepted  for execution by driver John Doe",
        _html = "\(Config.Defaults.cssHeader)<p class='fontweight-2'>Order <b class='color-tint'>CA Los-Angeles - NY New-York</b> accepted  for execution by driver John Doe</p>".html2AttributedString!

        let _text = NSMutableAttributedString(string: _message),
            _range = NSString(string: _message).range(of: "CA Los-Angeles - NY New-York", options: String.CompareOptions.caseInsensitive)
        _text.addAttributes([
            NSAttributedString.Key.foregroundColor : Config.Colors.tint,
            NSAttributedString.Key.font: Config.Fonts.NotoSansSemiBold(size: UIX3AlertViewController.Defaults.AlertView.messageFont!.pointSize) as Any
        ], range: _range)
        
        switch _btn {
//        case self.button1: ShowAlertView(_message.localized)
//        case self.button1: ShowAlertView(_message.localized, caption: "Header".uppercased())
//        case self.button1: ShowAlertView(_message.localized, caption: "Header".uppercased(), image: Config.Images.iconApple)
        case self.button1: ShowAlertView(
            "Header 1".uppercased(),
            message: _message.localized,
            image: UIImage(named: "obama.png"),
            buttons: UIX3CustomAlertButtonOptions.all,
            onOKEvent: { _sender in
                if let _obj = _sender as? UIX3AlertViewController {
                    _obj.dismiss(animated: true)
                    self.view.makeToast("AlertView click: \("OK")")
                }
            },
            onHelpEvent: { _sender in
                if let _obj = _sender as? UIX3AlertViewController {
                    _obj.dismiss(animated: true)
                    self.view.makeToast("AlertView click: \("HELP")")
                }
            })
        case self.button2: ShowAlertView("Header 2".uppercased(), text: _text, image: UIImage(named: "obama.png"));
        case self.button3: ShowAlertView(
            "Header 3".uppercased(),
            text: _html,
            image: UIImage(named: "obama.png"),
            buttons: [.cancel, .help],
            onHelpEvent: { _sender in
                if let _obj = _sender as? UIX3AlertViewController {
                    _obj.dismiss(animated: true)
                    self.view.makeToast("AlertView click: \("HTML-HELP")")
                }
            })
        case self.button4: ShowWrapperView(TestView01(), buttons: [.ok, .cancel], onOKEvent: { _sender in
            if let _ = _sender as? UIX3AlertWrapperViewController {
                self.view.makeToast("WrapperView click: \("OK")")
            } else {
                self.view.makeToast("*** Error ***")
            }
        })
        case self.button5:
            showWaitView(title: "Wait, please...")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Change `2.0` to the desired number of seconds.
                hideWaitView()
            }
        case self.button6:
            let _view = UIView()
            _view.backgroundColor = UIColor.yellow
            showModalCardView(content: _view)
        case self.buttonCancel: self.navigationController?.popViewController(animated: true)
        default: break;
        }
    }
}
