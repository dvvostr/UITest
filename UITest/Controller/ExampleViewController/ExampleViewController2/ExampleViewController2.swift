import UIKit
import x3Core
import x3UI
import x3CustomUI1

@IBDesignable @objc public class ExampleViewController2: UIX3CustomViewController {
    
    @IBOutlet private weak var segmentControlView1: UIX3CustomSegmentControl? {
        didSet {
            self.segmentControlView1?.delegate = self
            self.segmentControlView1?.items = ["Individual", "Company"]
        }
    }
    @IBOutlet private weak var segmentControlResult1: UILabel? {
        didSet {
            self.segmentControlResult1?.text = ""
        }
    }
    @IBOutlet private weak var segmentControlView2: UIX3CustomSegmentControl? {
        didSet {
            self.segmentControlView2?.delegate = self
            self.segmentControlView2?.items = ["Дни", "Недели", "Месяца"]
        }
    }
    @IBOutlet private weak var segmentControlResult2: UILabel? {
        didSet {
            self.segmentControlResult2?.text = ""
        }
    }
    @IBOutlet private weak var buttonControlResult: UILabel?
    @IBOutlet private weak var upDownControlView: UIX3CustomUpDownControl? {
        didSet {
            self.upDownControlView?.delegate = self
            self.upDownControlView?.value = 11
        }
    }
    @IBOutlet private weak var upDownControlEndEditButton: UX3RoundedButton? {
        didSet {
            self.upDownControlEndEditButton?.addTarget(self, action: #selector(handleUpDownControlEndEditButtonClick(sender: )), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var upDownControlResult: UILabel?
    @IBOutlet private weak var viewBottomConstraint: NSLayoutConstraint? {
        didSet {
            viewBottomConstraint?.constant = -(actionViewHeightConstraint?.constant ?? 0)
        }
    }
    @IBOutlet private weak var actionViewHeightConstraint: NSLayoutConstraint?
    @IBOutlet private weak var viewSliderIndicator: UX3SliderIndicatorControl? {
        didSet {
            self.viewSliderIndicator?.controlRoundValue = 4
            self.viewSliderIndicator?.setSegmentedWith(items: 4)
            self.viewSliderIndicator?.thumbColor = Config.Colors.tint
            self.viewSliderIndicator?.segmentColor = Config.Colors.tintLight
            self.viewSliderIndicator?.buttonSpacing = 12
            self.viewSliderIndicator?.selectedSegmentIndex = 0
            self.viewSliderIndicator?.delegate = self
        }
    }
    @IBOutlet private weak var upDownIndicatorResult: UILabel?
    @IBOutlet private weak var upDownIndicatorView: UIX3CustomUpDownControl? {
        didSet {
            self.upDownIndicatorView?.delegate = self
            self.upDownIndicatorView?.isEditing = false
            self.upDownIndicatorView?.value = 0
            self.upDownIndicatorView?.maxValue = 3
        }
    }
    @IBOutlet private weak var checkboxLabelViewResult: UILabel?
    @IBOutlet private weak var checkboxLabelView: UIX3CustomCheckboxLabelView? {
        didSet {
            self.checkboxLabelView?.delegate = self
//            self.checkboxLabelView?.value = .unchecked
            self.checkboxLabelView?.imageInset = 0
            self.checkboxLabelView?.image = Config.Images.iconCheck
            self.checkboxLabelView?.text = "Agree with the rules".localized
        }
    }

    public lazy var navImage: UIBarButtonItem = {
        return UIBarButtonItem(customView: UIX3CustomNavigaionImageView(image: UIImage(named: "obama.png")))
    }()
    public lazy var navButton: UIBarButtonItem = {
        let _btn = UIX3CustomNavigaionButton(image: Config.Images.iconTrash!.withRenderingModeTemplate)
        _btn.addTarget(self, action: #selector(handleNavButtonClick(sender:)), for:.touchUpInside)
        return UIBarButtonItem.init(customView: _btn)
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func setupView() {
        super.setupView()
        self.view.backgroundColor = Config.Colors.panelBackground
        self.customDelegate = self
        self.navigationItem.rightBarButtonItem = self.navImage
        self.checkboxLabelView?.value = .unchecked
    }
    public override func invalidate() {
        if [.landscapeLeft, .landscapeRight].contains(UIApplication.orientation) {
            super.captionText = self.title?.replacingOccurrences(of: "\n", with: " ") ?? ""
        } else {
            let _str = self.title ?? "",
                _attrStr = NSMutableAttributedString(string: _str, attributes: [NSAttributedString.Key.font: Config.Fonts.NotoSansSemiBold(size: 16) ?? UIFont.systemFont(ofSize: 16)])
            let _sep = (_str as NSString).range(of: "\n")
            if _sep.location > 0 {
                let _start = _sep.location + _sep.length
                let _range = NSRange(location: _start, length: _str.count - _start)
                _attrStr.addAttribute(NSAttributedString.Key.font, value: Config.Fonts.NotoSansRegular(size: 14)!, range: _range)
            }
            super.captionAttributedText = _attrStr
        }
    }
    
    public override var captionText: String  {
        didSet {
            self.title = captionText
            self.invalidate()
        }
    }
    
    public override func keyboardEvent(duration: Double, options: UIView.AnimationOptions, rect: CGRect?) {
    }
    public override func keyboardEvent(duration: Double, options: UIView.AnimationOptions, bottomPosition: CGFloat) {
        super.keyboardEvent(duration: duration, options: options, bottomPosition: bottomPosition)
        let _val = (bottomPosition == 0) ? -(self.actionViewHeightConstraint?.constant ?? 0) : bottomPosition
        self.viewBottomConstraint?.constant = _val
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc private func handleUpDownControlEndEditButtonClick(sender: Any?){
        self.upDownControlView?.endEditing(true)
    }
}

extension ExampleViewController2: ControlEventDelegate {
    public func controlEvent(_ sender: Any?, event: Any?) {
        guard let _event = event as? ControlEvent else { return }
        if _event.type == .enumiratedString, let (_, _value) = _event.value, let (_index, _caption) = _value as? ControlEventEnumiratedString {
            if (sender as? UIX3CustomSegmentControl) == self.segmentControlView1 {
                self.segmentControlResult1?.text = "index=\(_index) text=\(_caption ?? "<?>")"
                switch Int(_index) {
                case 0: self.navigationItem.rightBarButtonItem = self.navImage
                case 1: self.navigationItem.rightBarButtonItem = self.navButton
                default: self.navigationItem.rightBarButtonItem = nil
                }
            } else if (sender as? UIX3CustomSegmentControl) == self.segmentControlView2 {
                self.segmentControlResult2?.text = "index=\(_index) text=\(_caption ?? "<?>")"
            }
        } else if _event.type == .int, let (_, _value) = _event.value, let _value = _value as? Int {
            if (sender as? UIX3CustomUpDownControl) == self.upDownControlView {
                self.upDownControlResult?.text = "value=\(_value)"
            } else if (sender as? UIX3CustomUpDownControl) == self.upDownIndicatorView {
                self.viewSliderIndicator?.setSelectedSegmentIndex(index: _value, animated: true) 
                self.upDownIndicatorResult?.text = "value=\(self.viewSliderIndicator?.selectedSegmentIndex ?? -1)"
                
            } else if (sender as? UX3SliderIndicatorControl) == self.viewSliderIndicator {
                self.upDownIndicatorResult?.text = "value=\(_value)"
            }
        } else if _event.type == .bool, let (_, _value) = _event.value, let _value = _value as? Bool {
            if (sender as? UIX3CustomCheckboxLabelView) == self.checkboxLabelView {
                self.checkboxLabelViewResult?.text = "value=\(_value)"
            }
        }
        
    }
    public func controlEvent(_ sender: Any?, stringValue: String) {
        print(stringValue)
    }
}

extension ExampleViewController2: UIX3CustomViewControllerDelegate {
    @objc private func handleNavButtonClick(sender: Any?) {
        print("handleNavButtonClick")
    }
}
