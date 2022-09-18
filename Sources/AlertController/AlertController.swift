// Mezhevikin Alexey: https://github.com/mezhevikin/AlertController
import UIKit

public extension UIAlertController {
    static func alert(
        _ title: String? = nil,
        message: String? = nil
    ) -> UIAlertController {
        UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
    }
    
    static func sheet(
        _ title: String? = nil
    ) -> UIAlertController {
        let sheet = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        if let title = title {
            sheet.addAction(title: title, enabled: false)
        }
        return sheet
    }
    
    @discardableResult
    func addAction(
        title: String,
        style: UIAlertAction.Style = .default,
        icon: String? = nil,
        systemIcon: String? = nil,
        color: UIColor? = nil,
        enabled: Bool = true,
        checked: Bool = false,
        leftAligment: Bool = false,
        handler: (() -> Void)? = nil
    ) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style) { _ in
            if let handler = handler { handler() }
        }
        if let icon = icon {
            action.setIcon(icon)
        }
        if let systemIcon = systemIcon {
            action.setIcon(systemIcon, isSystem: true)
        }
        if let color = color {
            action.setColor(color)
        }
        action.isEnabled = enabled
        action.setCheked(checked)
        action.setLeftAligment(leftAligment)
        addAction(action)
        return action
    }
    
    func addCancelAction() {
        addAction(
            title: NSLocalizedString("Cancel", comment: ""),
            style: .cancel
        )
    }
    
    func addOkAction() {
        addAction(
            title: NSLocalizedString("OK", comment: ""),
            style: .cancel
        )
    }
    
    func setTitle(
        _ title: String,
        color: UIColor = .label,
        size: CGFloat = 20
    ) {
        setValue(NSAttributedString(string: title, attributes: [
            .font: UIFont.systemFont(ofSize: size),
            .foregroundColor: color
        ]), forKey: "attributedTitle")
    }
    
    func setMessage(
        _ message: String,
        color: UIColor = .secondaryLabel,
        size: CGFloat = 18
    ) {
        setValue(NSAttributedString(string: "\n" + message, attributes: [
            .font: UIFont.systemFont(ofSize: size),
            .foregroundColor: color
        ]), forKey: "attributedMessage")
    }
}

public extension UIAlertAction {
    func setImage(_ image: UIImage) {
        setValue(image, forKey: "image")
    }
    
    func setIcon(_ name: String, isSystem: Bool = false) {
        if let image = isSystem ?
            UIImage(systemName: name) :
            UIImage(named: name)
        {
            setImage(image)
        }
    }
    
    func setColor(_ color: UIColor) {
        setValue(color, forKey: "titleTextColor")
        setValue(color, forKey: "imageTintColor")
    }
    
    func setCheked(_ cheked: Bool) {
        setValue(cheked, forKey: "checked")
    }
    
    func setLeftAligment(_ leftAligment: Bool) {
        if leftAligment {
            setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        }
    }
}

public extension UIViewController {
    func present(
        _ child: UIViewController,
        animated: Bool = true,
        sourceView: UIView? = nil,
        barButtonItem: UIBarButtonItem? = nil,
        completion: (() -> Void)? = nil
    ) {
        if let popover = child.popoverPresentationController {
            if let sourceView = sourceView {
                popover.sourceView = sourceView
            } else if let barButtonItem = barButtonItem {
                popover.barButtonItem = barButtonItem
            }
        }
        present(child, animated: animated, completion: completion)
    }
}
