import UIKit
import x3Core
import x3UI
import x3CustomUI1

@IBDesignable @objc public class ExampleViewController1: UIX3CustomViewController {

    @IBOutlet private weak var buttonView1: UIX3CustomButtonView?
    @IBOutlet private weak var buttonView2: UIX3CustomButtonView?
    @IBOutlet private weak var buttonView3: UIX3CustomButtonView?
    @IBOutlet private weak var buttonView4: UIX3CustomButtonView?
    @IBOutlet private weak var buttonView5: UIX3CustomButtonView?
    @IBOutlet private weak var buttonView6: UIX3CustomButtonView?

    public override func setupView() {
        super.setupView()
        self.view.backgroundColor = Config.Colors.panelBackground
        self.invalidateButtons()
    }

    private func invalidateButtons() {
        self.buttonView1?.verticalOffset = 0
        self.buttonView1?.normalBackgroundColor = UIColor.clear
        self.buttonView1?.normalForegroundColor = Config.Colors.textGray
        self.buttonView1?.normalBorderColor = UIColor.clear
        self.buttonView1?.selectedBackgroundColor = UIColor.clear
        self.buttonView1?.selectedForegroundColor = Config.Colors.tint
        self.buttonView1?.selectedBorderColor = UIColor.clear
        self.buttonView1?.text = "Button 1".localized
        self.buttonView1?.delegate = self

        self.buttonView2?.verticalOffset = 0
        self.buttonView2?.text = "Button 2".localized
        self.buttonView2?.delegate = self

        self.buttonView3?.normalBackgroundColor = UIColor.clear
        self.buttonView3?.normalForegroundColor = Config.Colors.tint
        self.buttonView3?.normalBorderColor = Config.Colors.tint
        self.buttonView3?.selectedBackgroundColor = Config.Colors.tint
        self.buttonView3?.selectedForegroundColor = Config.Colors.background
        self.buttonView3?.selectedBorderColor = Config.Colors.tint
        self.buttonView3?.text = "Button 3".localized
        self.buttonView3?.verticalOffset = 4
        self.buttonView3?.horizontalOffset = 16
        self.buttonView3?.cornerRadius = -1
        self.buttonView3?.delegate = self

        self.buttonView4?.verticalOffset = 2
        self.buttonView4?.horizontalOffset = 16
        self.buttonView4?.image = Config.Images.iconAdd
        self.buttonView4?.imagePosition = .right
        self.buttonView4?.imageOffset = 20
        self.buttonView4?.text = "Button 4".localized
        self.buttonView4?.cornerRadius = 8
        self.buttonView4?.delegate = self

        self.buttonView5?.verticalOffset = 2
        self.buttonView5?.horizontalOffset = 16
        self.buttonView5?.normalBackgroundColor = UIColor.clear
        self.buttonView5?.normalForegroundColor = Config.Colors.tint
        self.buttonView5?.normalBorderColor = Config.Colors.tint
        self.buttonView5?.selectedBackgroundColor = Config.Colors.tint
        self.buttonView5?.selectedForegroundColor = Config.Colors.background
        self.buttonView5?.selectedBorderColor = Config.Colors.tint
        self.buttonView5?.text = "Button 5".localized
        self.buttonView5?.image = Config.Images.iconAdd
        self.buttonView5?.imagePosition = .left
        self.buttonView5?.cornerRadius = 8
        self.buttonView5?.delegate = self
        
        self.buttonView6?.verticalOffset = 2
        self.buttonView6?.horizontalOffset = 16
        self.buttonView6?.normalBackgroundColor = UIColor.clear
        self.buttonView6?.normalForegroundColor = Config.Colors.tint
        self.buttonView6?.normalBorderColor = Config.Colors.tint
        self.buttonView6?.selectedBackgroundColor = Config.Colors.tint
        self.buttonView6?.selectedForegroundColor = Config.Colors.background
        self.buttonView6?.selectedBorderColor = Config.Colors.tint
        self.buttonView6?.text = "Button 6".localized
        self.buttonView6?.image = Config.Images.iconChevronRightBtn
        self.buttonView6?.imageOffset = 4
        self.buttonView6?.imagePosition = .largeBtn
        self.buttonView6?.cornerRadius = 12
        self.buttonView5?.delegate = self
    }
}

extension ExampleViewController1: ControlEventDelegate {
    public func controlEvent(_ sender: Any?, event: Any?) {
        guard let _event = event as? ControlEvent else { return }
        if _event.type == .none, let _view = sender as? UIX3CustomButtonView {
            self.view.makeToast("Button view click: \(_view.text ?? "<NONE>")")
        }
    }
}
