import UIKit
import x3UI

class ExampleViewController5: UIX3CustomViewController {

    @IBOutlet private weak var button1: UX3CustomButton?
    @IBOutlet private weak var button2: UX3CustomButton?
    @IBOutlet private weak var button3: UX3CustomButton?
    @IBOutlet private weak var button4: UX3CustomButton?
    @IBOutlet private weak var buttonCancel: UX3CustomButton?

    override func setupView() {
        super.setupView()
        self.initializeButton(button: self.button1, caption: "Alert String 1")
        self.initializeButton(button: self.button2, caption: "Alert Attr 2")
        self.initializeButton(button: self.button3, caption: "Alert HTML 3")
        self.initializeButton(button: self.button4, caption: "Simple")
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
//        let _message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae tellus at lorem hendrerit porta. Duis nec ipsum ante. Sed dictum neque id mi lacinia, ac pretium leo sodales. Ut purus lectus, ultrices et vulputate luctus, accumsan quis urna. Nam egestas, nisl et posuere tempor, nulla nunc volutpat massa, sit amet ornare est ante sed purus. In hac habitasse platea dictumst. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed mollis, mi in tincidunt bibendum, nunc tortor efficitur massa, non tempor lacus eros sed augue. Integer pulvinar, augue at luctus bibendum, nisl metus ullamcorper quam, eu sodales ipsum arcu in turpis. Ut dictum posuere vestibulum. Nam finibus vehicula nulla, vel rutrum sapien elementum ac. Nam ac lorem id velit mollis fermentum. Sed sagittis enim sit amet neque lacinia facilisis. Vivamus at luctus orci. Quisque mollis, libero non ornare sagittis, urna augue varius odio, eget porta justo risus ac est."
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
        case self.button1: _ = ShowAlertView("Header 1".uppercased(), message: _message.localized, image: UIImage(named: "obama.png"), buttons: UIX3AlertButtonOptions.all)
        case self.button2: ShowAlertView("Header 2".uppercased(), text: _text, image: UIImage(named: "obama.png"));
        case self.button3: ShowAlertView("Header 3".uppercased(), text: _html, image: UIImage(named: "obama.png"));
        case self.button4: break;
        case self.buttonCancel: self.navigationController?.popViewController(animated: true)
        default: break;
        }
    }
}
