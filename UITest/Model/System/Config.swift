import UIKit
import x3Core
import x3UI
import x3CustomUI1

// MARK: - ******* CONFIG *******
public let DEBUG_PRINT = true
public let DEBUG_URL = "https://dvostr.ru/data/execute"

public protocol CustomDefaultProtocol {
    static func initialize()
}

public struct Config: CustomDefaultProtocol {
    public static func initialize() {
        Config.Fonts.initialize()
        Config.Colors.initialize()
        Config.Images.initialize()
        Config.Controls.initialize()
    }
// MARK: - ******* DEFAULTS *******
    public struct Defaults: CustomDefaultProtocol {
        public static let cssHeader = "<style type=\"text/css\">*{font-size:14px;} body{font-family: \(UserFonts.Fonts.NotoSans.Light); font-size:14px;} ul, li{list-style:none;} p{margin: 0px; margin-bottom: 8px; padding: 0px;}.align-left{text-align: left;}.align-right{text-align: right;}.align-center{text-align: center; }.color-tint{color: \(Config.Colors.tint.HEX)} .font-12{font-size:12px;} .font-13{font-size:13px;} .font-14{font-size:14px;} .font-15{font-size:15px;} .font-16{font-size:16px;} .font-17{font-size:17px;} .font-18{font-size:18px;} .font-19{font-size:19px;} .font-20{font-size:20px;} .font-22{font-size:22px;} .fontweight-1{font-weight: 100;} .fontweight-2{font-weight: 200;} .fontweight-3{font-weight: 300;} .fontweight-4{font-weight: 400;} .fontweight-5{font-weight: 500;} .fontweight-6{font-weight: 600;} .fontweight-7{font-weight: 700;} .fontweight-8{font-weight: 800;} .fontweight-9{font-weight: 900;}</style>"
        public static let STR_LOREMIPSUM = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed massa est, ornare non aliquam ac, viverra sit amet nunc. Morbi sagittis libero sed blandit sollicitudin. Vivamus quis varius lorem, nec convallis mauris. In hac habitasse platea dictumst. Maecenas dictum erat arcu, quis suscipit orci pharetra pharetra. Maecenas vitae diam non ex accumsan fermentum vel id turpis. Integer faucibus nisl a tincidunt aliquam. In hac habitasse platea dictumst. Donec bibendum dui ac dui vehicula imperdiet. Nullam viverra faucibus ex, eu ultricies quam lacinia a. Sed lobortis neque quis lorem mollis porta.

        Pellentesque imperdiet lacus leo, sed pharetra nisl aliquet at. Donec volutpat sit amet lorem sed dapibus. Quisque congue sem in interdum euismod. Cras eu fermentum lorem, vitae consequat ante. Nulla facilisi. Proin quis urna ac enim interdum faucibus a eget ipsum. Aliquam id magna nec orci interdum gravida sit amet at nisl. Curabitur vel ligula neque. Cras a luctus dui. Nullam nec massa id tellus dignissim luctus. Aenean pulvinar dolor pharetra nisl tincidunt tincidunt.

        Ut lacinia metus augue, nec molestie sem malesuada vel. Nam eleifend leo tincidunt sem feugiat sodales. Quisque eget elit eu purus egestas faucibus in non enim. Curabitur id pellentesque leo, quis venenatis purus. Sed sodales egestas metus, laoreet tempus nisi imperdiet quis. Maecenas lobortis lacus ac dui tempus, fermentum commodo nibh porttitor. Nullam auctor vitae mauris non vestibulum. Aenean viverra tortor ut dui tempus convallis in a felis. Praesent dictum, massa non dictum aliquet, lectus ipsum venenatis tortor, vitae consectetur nisl sapien sit amet libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mollis pulvinar ante ac hendrerit. Vestibulum tincidunt purus vel purus laoreet condimentum. Cras eget tempus lacus. Sed tincidunt ante in lectus malesuada mollis a in dui. Sed imperdiet magna sed est hendrerit hendrerit. Sed laoreet purus quis arcu porttitor gravida.

        Quisque efficitur turpis ac est mattis cursus. Proin consequat, mi non sagittis ultricies, nunc mi consectetur dui, id hendrerit tortor arcu eget lectus. Aliquam nec arcu nec ante vehicula euismod. Quisque congue dignissim elit, eu gravida ipsum posuere quis. In suscipit lacus ac tincidunt ornare. Donec imperdiet enim lectus, quis pretium est luctus eu. Phasellus euismod sapien quis fringilla sollicitudin. Proin dignissim tincidunt mauris, sed rhoncus neque laoreet in. Vivamus lobortis sodales ante a viverra. Nam ut nisl tristique, hendrerit nulla vitae, gravida arcu.

        Nulla urna eros, finibus non dolor id, commodo ullamcorper ante. Nulla iaculis sapien nulla, blandit blandit ipsum luctus eu. Nunc lobortis at enim at fringilla. Ut finibus, lacus vitae condimentum dapibus, felis purus consectetur tellus, id porta ligula augue auctor tortor. Duis molestie egestas diam, ac sollicitudin velit placerat a. Duis lobortis, ipsum ut facilisis elementum, ante felis fringilla odio, nec rutrum augue purus at felis. Quisque vehicula porta consectetur. Quisque condimentum non urna at iaculis. Nulla rutrum felis eros, et luctus tellus finibus sed. Donec auctor ultricies erat non euismod. Sed commodo, purus ac condimentum bibendum, nulla magna dapibus lorem, a laoreet metus enim ut sem. Nullam leo metus, lacinia eu dapibus et, vestibulum non neque. Sed faucibus augue in velit tincidunt ullamcorper. Maecenas vitae lectus eleifend, condimentum tortor sit amet, fringilla elit. Maecenas ornare ornare scelerisque. Nam sit amet blandit turpis.
        """
        public static func initialize() {
        }
    }
    public struct Methods: CustomDefaultProtocol {
        public static func initialize() {
        }
        public static var Default = "default"
        public static var mainMenu = "mainMenu"
        public static var Error = "error"
    }
// MARK: - ******* COLORS *******
    public struct Colors: CustomDefaultProtocol {
        public static func initialize() {
            UIX3XibView.appearance().backgroundColor = UIColor.clear
            UIViewBorder.appearance().backgroundColor = Config.Colors.tintLight
//            UIX3CustomTableHeaderFooterView.appearance().backgroundColor = Config.Colors.backgroundGray
        }
        public struct Names {
            public static let colorBackground = "colorBackground"
            public static let colorBackgroundGray = "colorBackgroundGray"
            public static let colorBlack = "colorBlack"
            public static let colorBlackLight = "colorBlackLight"
            public static let colorComplited = "colorComplited"
            public static let colorDanger = "colorDanger"
            public static let colorDangerBackground = "colorDangerBackground"
            public static let colorInactive = "colorInactive"
            public static let colorPanelBackground = "colorPanelBackground"
            public static let colorPlaceholder = "colorPlaceholder"
            public static let colorProgress = "colorProgress"
            public static let colorTextGray = "colorTextGray"
            public static let colorTextGrayLight = "colorTextGrayLight"
            public static let colorTextNormal = "colorTextNormal"
            public static let colorTint = "colorTint"
            public static let colorTintLight = "colorTintLight"
        }

        public static let background = UIColor(named: Config.Colors.Names.colorBackground) ?? UIColor.clear
        public static let backgroundGray = UIColor(named: Config.Colors.Names.colorBackgroundGray) ?? UIColor.clear
        public static let black = UIColor(named: Config.Colors.Names.colorBlack) ?? UIColor.clear
        public static let blackLight = UIColor(named: Config.Colors.Names.colorBlackLight) ?? UIColor.clear
        public static let bomplited = UIColor(named: Config.Colors.Names.colorComplited) ?? UIColor.clear
        public static let danger = UIColor(named: Config.Colors.Names.colorDanger) ?? UIColor.clear
        public static let dangerBackground = UIColor(named: Config.Colors.Names.colorDangerBackground) ?? UIColor.clear
        public static let inactive = UIColor(named: Config.Colors.Names.colorInactive) ?? UIColor.clear
        public static let panelBackground = UIColor(named: Config.Colors.Names.colorPanelBackground) ?? UIColor.clear
        public static let placeholder = UIColor(named: Config.Colors.Names.colorPlaceholder) ?? UIColor.clear
        public static let progress = UIColor(named: Config.Colors.Names.colorProgress) ?? UIColor.clear
        public static let textGray = UIColor(named: Config.Colors.Names.colorTextGray) ?? UIColor.clear
        public static let textGrayLight = UIColor(named: Config.Colors.Names.colorTextGrayLight) ?? UIColor.clear
        public static let text = UIColor(named: Config.Colors.Names.colorTextNormal) ?? UIColor.clear
        public static let tint = UIColor(named: Config.Colors.Names.colorTint) ?? UIColor.clear
        public static let tintLight = UIColor(named: Config.Colors.Names.colorTintLight) ?? UIColor.clear

    }
// MARK: - ******* FONTS *******
    public struct Fonts: CustomDefaultProtocol {
        public static func initialize() {
            UserFonts.Fonts.FuturaPT.loadFont(isPrintReport: false)
//            UILabel.appearance().defaultFont = Config.Fonts.NotoSansRegular(size: 14)
            UIBaseNavigationTitleLabel.appearance().defaultFont = Config.Fonts.NotoSansSemiBold(size: 16)
            UILabel.appearance(whenContainedInInstancesOf: [UIBaseNavigationTitleView.self]).defaultFont = Config.Fonts.NotoSansSemiBold(size: 16)
        }
        public static func NotoSansRegular(size: CGFloat) -> UIFont?{
            return UIFont(name: UserFonts.Fonts.NotoSans.Regular, size: size)
        }
        public static func NotoSansBold(size: CGFloat) -> UIFont?{
            return UIFont(name: UserFonts.Fonts.NotoSans.Bold, size: size)
        }
        public static func NotoSansItalic(size: CGFloat) -> UIFont?{
            return UIFont(name: UserFonts.Fonts.NotoSans.Italic, size: size)
        }
        public static func NotoSansBoldItalic(size: CGFloat) -> UIFont?{
            return UIFont(name: UserFonts.Fonts.NotoSans.BoldItalic, size: size)
        }
        public static func NotoSansSemiBold(size: CGFloat) -> UIFont?{
            return UIFont(name: UserFonts.Fonts.NotoSans.SemiBold, size: size)
        }
    }
// MARK: - ******* IMAGES *******
    public struct Images: CustomDefaultProtocol {
        public static func initialize() {
//            UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for:UIBarMetrics.default)
            UINavigationBar.appearance().backIndicatorImage = Config.Images.iconBack?.withRenderingOriginal
            UINavigationBar.appearance().backIndicatorTransitionMaskImage = Config.Images.iconBack?.withRenderingOriginal
        }

        public static let IMAGE_ICONAB = "iconAB"
        public static let IMAGE_ICONADD = "iconAdd"
        public static let IMAGE_ICONAPPLE = "iconApple"
        public static let IMAGE_ICONATTACH = "iconAttach"
        public static let IMAGE_ICONBACK = "iconBack"
        public static let IMAGE_ICONBAG = "iconBag"
        public static let IMAGE_ICONBANK = "iconBank"
        public static let IMAGE_ICONBOX = "iconBox"
        public static let IMAGE_ICONCALENDAR = "iconCalendar"
        public static let IMAGE_ICONCARD = "iconCard"
        public static let IMAGE_ICONCHAT = "iconChat"
        public static let IMAGE_ICONCHECK = "iconCheck"
        public static let IMAGE_ICONCHECKBOX = "iconCheckbox"
        public static let IMAGE_ICONCHECKBOXERROR = "iconCheckboxError"
        public static let IMAGE_ICONCHECKBOXOFF = "iconCheckboxOff"
        public static let IMAGE_ICONCHEVRONRIGHTBTN = "iconChevronRightBtn"
        public static let IMAGE_ICONCLOSE = "iconClose"
        public static let IMAGE_ICONCONTACT = "iconContact"
        public static let IMAGE_ICONCROSS = "iconCross"
        public static let IMAGE_ICONCURRENTLOCATION = "iconCurrentLocation"
        public static let IMAGE_ICONDELETE = "iconDelete"
        public static let IMAGE_ICONDOC = "iconDoc"
        public static let IMAGE_ICONDOWN = "iconDown"
        public static let IMAGE_ICONEDIT = "iconEdit"
        public static let IMAGE_ICONFILTER = "iconFilter"
        public static let IMAGE_ICONFINISH = "iconFinish"
        public static let IMAGE_ICONHELP0 = "iconHelp0"
        public static let IMAGE_ICONHELP1 = "iconHelp1"
        public static let IMAGE_ICONIMHERE = "iconImHere"
        public static let IMAGE_ICONINFO = "iconInfo"
        public static let IMAGE_ICONIMPUTTEXT1 = "iconInputText1"
        public static let IMAGE_ICONIMPUTTEXT2 = "iconInputText2"
        public static let IMAGE_ICONLEFT = "iconLeft"
        public static let IMAGE_ICONLOCAL = "iconLocal"
        public static let IMAGE_ICONLOCK = "iconLock"
        public static let IMAGE_ICONLOGPUT = "iconLogout"
        public static let IMAGE_ICONMASTERCARD = "iconMasterCard"
        public static let IMAGE_ICONMENU = "iconMenu"
        public static let IMAGE_ICONMESSEGER = "iconMessenger"
        public static let IMAGE_ICONMINUS = "iconMinus"
        public static let IMAGE_ICONNAVIGATOR = "iconNavigator"
        public static let IMAGE_ICONNEXT = "iconNext"
        public static let IMAGE_ICONNOTIFICATION = "iconNotification"
        public static let IMAGE_ICONOUTLINE = "iconOutline"
        public static let IMAGE_ICONPIN = "iconPin"
        public static let IMAGE_ICONPLACEHOLDER = "iconPlaceholder"
        public static let IMAGE_ICONPLUS = "iconPlus"
        public static let IMAGE_ICONRADIOBUTTONERROR = "iconRadiobuttonError"
        public static let IMAGE_ICONRADIOBUTTONOFF = "iconRadiobuttonOff"
        public static let IMAGE_ICONRADIOBUTTONON = "iconRadionbuttonOn"
        public static let IMAGE_ICONRATE = "iconRate"
        public static let IMAGE_ICONRIGHT = "iconRight"
        public static let IMAGE_ICONSEND = "iconSend"
        public static let IMAGE_ICONSETTINGS = "iconSettings"
        public static let IMAGE_ICONSMS = "iconSMS"
        public static let IMAGE_ICONTIMER = "iconTimer"
        public static let IMAGE_ICONTRASH = "iconTrash"
        public static let IMAGE_ICONTRUCK = "iconTruck"
        public static let IMAGE_ICONUNLOCK = "iconUnlock"
        public static let IMAGE_ICONUP = "iconUp"
        public static let IMAGE_ICONUSA = "iconUSA"
        public static let IMAGE_ICONUSER = "iconUser"
        public static let IMAGE_ICONVISA = "iconVisa"
        public static let IMAGE_ICONWALLET = "iconWallet"
        public static let IMAGE_ICONWHATSAPP = "iconWhatsapp"
        public static var iconAB: UIImage? { get { return UIImage(named: IMAGE_ICONAB) } }
        public static var iconAdd: UIImage? { get { return UIImage(named: IMAGE_ICONADD) } }
        public static var iconApple: UIImage? { get { return UIImage(named: IMAGE_ICONAPPLE) } }
        public static var iconAttach: UIImage? { get { return UIImage(named: IMAGE_ICONATTACH) } }
        public static var iconBack: UIImage? { get { return UIImage(named: IMAGE_ICONBACK) } }
        public static var iconBag: UIImage? { get { return UIImage(named: IMAGE_ICONBAG) } }
        public static var iconBank: UIImage? { get { return UIImage(named: IMAGE_ICONBANK) } }
        public static var iconBox: UIImage? { get { return UIImage(named: IMAGE_ICONBOX) } }
        public static var iconCalendar: UIImage? { get { return UIImage(named: IMAGE_ICONCALENDAR) } }
        public static var iconCard: UIImage? { get { return UIImage(named: IMAGE_ICONCARD) } }
        public static var iconChat: UIImage? { get { return UIImage(named: IMAGE_ICONCHAT) } }
        public static var iconCheck: UIImage? { get { return UIImage(named: IMAGE_ICONCHECK) } }
        public static var iconCheckbox: UIImage? { get { return UIImage(named: IMAGE_ICONCHECKBOX) } }
        public static var iconCheckboxError: UIImage? { get { return UIImage(named: IMAGE_ICONCHECKBOXERROR) } }
        public static var iconCheckboxOff: UIImage? { get { return UIImage(named: IMAGE_ICONCHECKBOXOFF) } }
        public static var iconChevronRightBtn: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONRIGHTBTN) } }
        public static var iconClose: UIImage? { get { return UIImage(named: IMAGE_ICONCLOSE) } }
        public static var iconContact: UIImage? { get { return UIImage(named: IMAGE_ICONCONTACT) } }
        public static var iconCross: UIImage? { get { return UIImage(named: IMAGE_ICONCROSS) } }
        public static var iconCurrentLocation: UIImage? { get { return UIImage(named: IMAGE_ICONCURRENTLOCATION) } }
        public static var iconDelete: UIImage? { get { return UIImage(named: IMAGE_ICONDELETE) } }
        public static var iconDoc: UIImage? { get { return UIImage(named: IMAGE_ICONDOC) } }
        public static var iconDown: UIImage? { get { return UIImage(named: IMAGE_ICONDOWN) } }
        public static var iconEdit: UIImage? { get { return UIImage(named: IMAGE_ICONEDIT) } }
        public static var iconFilter: UIImage? { get { return UIImage(named: IMAGE_ICONFILTER) } }
        public static var iconFinish: UIImage? { get { return UIImage(named: IMAGE_ICONFINISH) } }
        public static var iconHelp0: UIImage? { get { return UIImage(named: IMAGE_ICONHELP0) } }
        public static var iconHelp1: UIImage? { get { return UIImage(named: IMAGE_ICONHELP1) } }
        public static var iconImHere: UIImage? { get { return UIImage(named: IMAGE_ICONIMHERE) } }
        public static var iconInfo: UIImage? { get { return UIImage(named: IMAGE_ICONINFO) } }
        public static var iconInputText1: UIImage? { get { return UIImage(named: IMAGE_ICONIMPUTTEXT1) } }
        public static var iconInputText2: UIImage? { get { return UIImage(named: IMAGE_ICONIMPUTTEXT2) } }
        public static var iconLeft: UIImage? { get { return UIImage(named: IMAGE_ICONLEFT) } }
        public static var iconLocal: UIImage? { get { return UIImage(named: IMAGE_ICONLOCAL) } }
        public static var iconLock: UIImage? { get { return UIImage(named: IMAGE_ICONLOCK) } }
        public static var iconLogout: UIImage? { get { return UIImage(named: IMAGE_ICONLOGPUT) } }
        public static var iconMasterCard: UIImage? { get { return UIImage(named: IMAGE_ICONMASTERCARD) } }
        public static var iconMenu: UIImage? { get { return UIImage(named: IMAGE_ICONMENU) } }
        public static var iconMessenger: UIImage? { get { return UIImage(named: IMAGE_ICONMESSEGER) } }
        public static var iconMinus: UIImage? { get { return UIImage(named: IMAGE_ICONMINUS) } }
        public static var iconNavigator: UIImage? { get { return UIImage(named: IMAGE_ICONNAVIGATOR) } }
        public static var iconNext: UIImage? { get { return UIImage(named: IMAGE_ICONNEXT) } }
        public static var iconNotification: UIImage? { get { return UIImage(named: IMAGE_ICONNOTIFICATION) } }
        public static var iconOutline: UIImage? { get { return UIImage(named: IMAGE_ICONOUTLINE) } }
        public static var iconPin: UIImage? { get { return UIImage(named: IMAGE_ICONPIN) } }
        public static var iconPlaceholder: UIImage? { get { return UIImage(named: IMAGE_ICONPLACEHOLDER) } }
        public static var iconPlus: UIImage? { get { return UIImage(named: IMAGE_ICONPLUS) } }
        public static var iconRadiobuttonError: UIImage? { get { return UIImage(named: IMAGE_ICONRADIOBUTTONERROR) } }
        public static var iconRadiobuttonOff: UIImage? { get { return UIImage(named: IMAGE_ICONRADIOBUTTONOFF) } }
        public static var iconRadionbuttonOn: UIImage? { get { return UIImage(named: IMAGE_ICONRADIOBUTTONON) } }
        public static var iconRate: UIImage? { get { return UIImage(named: IMAGE_ICONRATE) } }
        public static var iconRight: UIImage? { get { return UIImage(named: IMAGE_ICONRIGHT) } }
        public static var iconSend: UIImage? { get { return UIImage(named: IMAGE_ICONSEND) } }
        public static var iconSettings: UIImage? { get { return UIImage(named: IMAGE_ICONSETTINGS) } }
        public static var iconSMS: UIImage? { get { return UIImage(named: IMAGE_ICONSMS) } }
        public static var iconTimer: UIImage? { get { return UIImage(named: IMAGE_ICONTIMER) } }
        public static var iconTrash: UIImage? { get { return UIImage(named: IMAGE_ICONTRASH) } }
        public static var iconTruck: UIImage? { get { return UIImage(named: IMAGE_ICONTRUCK) } }
        public static var iconUnlock: UIImage? { get { return UIImage(named: IMAGE_ICONUNLOCK) } }
        public static var iconUp: UIImage? { get { return UIImage(named: IMAGE_ICONUP) } }
        public static var iconUSA: UIImage? { get { return UIImage(named: IMAGE_ICONUSA) } }
        public static var iconUser: UIImage? { get { return UIImage(named: IMAGE_ICONUSER) } }
        public static var iconVisa: UIImage? { get { return UIImage(named: IMAGE_ICONVISA) } }
        public static var iconWallet: UIImage? { get { return UIImage(named: IMAGE_ICONWALLET) } }
        public static var iconWhatsapp: UIImage? { get { return UIImage(named: IMAGE_ICONWHATSAPP) } }
    }
    public struct Controls: CustomDefaultProtocol {
        public struct CustomControl: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomControl.Defaults.Color.background = Config.Colors.background
                UIX3CustomControl.Defaults.Color.foreground = Config.Colors.text
                UIX3CustomControl.Defaults.Color.border = Config.Colors.tintLight
                UIX3CustomControl.Defaults.Color.tint = Config.Colors.tint
                UIX3CustomControl.Defaults.Color.text = Config.Colors.text
                UIX3CustomControl.Defaults.cornerRadius = 0
                UIX3CustomControl.Defaults.borderWidth = 1
                UIX3CustomControl.Defaults.textFont = Config.Fonts.NotoSansRegular(size: 16)!
                UIX3CustomControl.Defaults.inputFont = Config.Fonts.NotoSansRegular(size: 16)!
                UIX3CustomControl.Defaults.titleFont = Config.Fonts.NotoSansRegular(size: 16)!
                UIX3CustomControl.Defaults.smallFont = Config.Fonts.NotoSansRegular(size: 12)!
            }
        }
        public struct SegmentView: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomSegmentControl.Defaults.Color.inactive = Config.Colors.tintLight
            }
        }
        public struct UpDownControl: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomUpDownControl.Defaults.Color.editBackground = Config.Colors.tintLight
            }
        }
        public struct CustomViewController: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomViewController.Defaults.navigationBackImage = Config.Images.iconBack
            }
        }
        public struct CustomNavigaionImageView: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomNavigaionImageView.Defaults.Color.background = UIColor.clear
            }
        }
        public struct CustomNavigaionButton: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomNavigaionButton.Defaults.Color.background = Config.Colors.backgroundGray
            }
        }
        public struct CustomCheckboxLabelView: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomCheckboxLabelView.Defaults.Color.unset = Config.Colors.backgroundGray
                UIX3CustomCheckboxLabelView.Defaults.Color.controlBackground = Config.Colors.tintLight
                UIX3CustomCheckboxLabelView.Defaults.font = Config.Fonts.NotoSansRegular(size: 16)!
            }
        }
        public struct CustomButton: CustomDefaultProtocol {
            public static func initialize() {
                UX3CustomButton.Defaults.Color.Normal.background = Config.Colors.tint
                UX3CustomButton.Defaults.Color.Normal.foreground = Config.Colors.background
                UX3CustomButton.Defaults.Color.Normal.border = Config.Colors.tint
                UX3CustomButton.Defaults.Color.Selected.background = Config.Colors.backgroundGray
                UX3CustomButton.Defaults.Color.Selected.foreground = Config.Colors.tint
                UX3CustomButton.Defaults.Color.Selected.border = Config.Colors.tint
                UX3CustomButton.Defaults.titleFont = Config.Fonts.NotoSansRegular(size: 16)!
            }
        }
        public struct CustomButtonView: CustomDefaultProtocol {
            public static func initialize() {
                UIX3CustomButtonView.Defaults.Color.background = Config.Colors.background
                UIX3CustomButtonView.Defaults.Color.Normal.background = Config.Colors.tint
                UIX3CustomButtonView.Defaults.Color.Normal.foreground = Config.Colors.background
                UIX3CustomButtonView.Defaults.Color.Normal.border = Config.Colors.tint
                UIX3CustomButtonView.Defaults.Color.Selected.background = Config.Colors.backgroundGray
                UIX3CustomButtonView.Defaults.Color.Selected.foreground = Config.Colors.tint
                UIX3CustomButtonView.Defaults.Color.Selected.border = Config.Colors.tint

                UIX3CustomButtonView.Defaults.borderWidth = 1
                UIX3CustomButtonView.Defaults.cornerRadius = 0
                UIX3CustomButtonView.Defaults.horizontalOffset = 0
                UIX3CustomButtonView.Defaults.verticalOffset = 0
                UIX3CustomButtonView.Defaults.titleFont = Config.Fonts.NotoSansRegular(size: 16)!
            }
        }
        public struct AlertViewController: CustomDefaultProtocol {
            public static func initialize() {
                UIX3AlertViewController.Defaults.Color.background = UIX3CustomControl.Defaults.Color.text?.withAlphaComponent(0.6)
                UIX3CustomAlertViewController.Defaults.AlertView.Color.background = Config.Colors.background
                UIX3AlertViewController.Defaults.AlertView.Color.message = Config.Colors.text
                UIX3AlertViewController.Defaults.AlertView.Color.caption = Config.Colors.textGray
                UIX3CustomAlertViewController.Defaults.AlertView.height = 12.0
                UIX3CustomAlertViewController.Defaults.AlertView.width = 280.0
                UIX3AlertViewController.Defaults.AlertView.padding = 12.0
                UIX3AlertViewController.Defaults.AlertView.imageSize = 36.0
                UIX3AlertViewController.Defaults.AlertView.headerFont = Config.Fonts.NotoSansSemiBold(size: 16)
                UIX3AlertViewController.Defaults.AlertView.messageFont = Config.Fonts.NotoSansRegular(size: 14)
                UIX3AlertViewController.Defaults.AlertView.buttonOKSettings = UX3CustomButton.Defaults.settings
                UIX3AlertViewController.Defaults.AlertView.buttonOKSettings?.caption = "OK".localized
                UIX3AlertViewController.Defaults.AlertView.buttonOKSettings?.borderRadius = -1

                UIX3AlertViewController.Defaults.AlertView.buttonCancelSettings = UX3CustomButtonSettings(
                    normalColor: UX3CustomButtonSettings.Color(
                        background: UIColor.clear,
                        foreground: Config.Colors.tint,
                        border: Config.Colors.tint
                    ), selectedColor: UX3CustomButtonSettings.Color(
                        background: Config.Colors.tint,
                        foreground: Config.Colors.background,
                        border: Config.Colors.tint
                    ),
                    caption: "Cancel".localized
                )
                UIX3AlertViewController.Defaults.AlertView.buttonHelpSettings = UX3CustomButtonSettings(
                    normalColor: UX3CustomButtonSettings.Color(
                        background: UIColor.clear,
                        foreground: Config.Colors.tint,
                        border: UIColor.clear
                    ), selectedColor: UX3CustomButtonSettings.Color(
                        background: UIColor.clear,
                        foreground: Config.Colors.tintLight,
                        border: UIColor.clear
                    )
                )
                UIX3AlertViewController.Defaults.AlertView.buttonHelpSettings?.image = Config.Images.iconHelp1?.withRenderingModeTemplate
//
//                    normalColor: UX3CustomButtonSettings.Color(
//                        background: UX3CustomButton.Defaults.Color.Normal.background,
//                        foreground: UX3CustomButton.Defaults.Color.Normal.foreground,
//                        border: UX3CustomButton.Defaults.Color.Normal.border
//                    ),
//                    selectedColor: UX3CustomButtonSettings.Color(
//                        background: UX3CustomButton.Defaults.Color.Selected.background,
//                        foreground: UX3CustomButton.Defaults.Color.Selected.foreground,
//                        border: UX3CustomButton.Defaults.Color.Selected.border
//                    ),
//                    font: UX3CustomButton.Defaults.titleFont,
//                    imageOffset: UX3CustomButton.Defaults.imageOffset,
//                    largeImageOffset: UX3CustomButton.Defaults.largeImageOffset,
//                    borderWidth: UX3CustomButton.Defaults.borderWidth,
//                    borderRadius: UX3CustomButton.Defaults.borderRadius
//                )
            }
                
        }
        public struct WaitViewController: CustomDefaultProtocol {
            public static func initialize() {
                UIX3WaitViewController.Defaults.Color.background = UIColor.black.getAlphaColor(0.3)
                UIX3WaitViewController.Defaults.Color.foreground = Config.Colors.background
            }
        }
        public struct Color {
            public static var background: UIColor? = UIColor.systemFill.withAlphaComponent(0.3)
        }
        public static var duration: CGFloat = 0.3
        public static var showAnimation: Int = 0
        public static func initialize() {
            Config.Controls.CustomControl.initialize()
            Config.Controls.CustomNavigaionImageView.initialize()
            Config.Controls.CustomNavigaionButton.initialize()
            Config.Controls.SegmentView.initialize()
            Config.Controls.UpDownControl.initialize()
            Config.Controls.CustomViewController.initialize()
            Config.Controls.CustomCheckboxLabelView.initialize()
            Config.Controls.CustomButton.initialize()
            Config.Controls.CustomButtonView.initialize()
            Config.Controls.AlertViewController.initialize()
            Config.Controls.WaitViewController.initialize()
        }
    }
}
