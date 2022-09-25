# AlertController

💬 A tiny extension for UIAlertController that makes working with it very simple. Only 150 lines of code.

### Alert

```swift
let alert = UIAlertController.alert()
alert.setTitle("✅ Success", color: .darkGreen)
alert.setMessage("Your message has been sent")
alert.addAction(
    title: "Send more",
    systemIcon: "envelope.fill",
    color: .darkGreen,
    leftAligment: true
) {}
alert.addAction(
    title: "Delete message",
    systemIcon: "trash.fill",
    color: .red,
    leftAligment: true
) {}
alert.addOkAction()
present(alert, animated: true)
```

<p align="center">
    <img src="https://github.com/mezhevikin/AlertControllerExample/blob/master/Screens/alert.jpg?raw=true" width="250">
</p>

### Sheet

```swift
let sheet = UIAlertController.sheet("👨🏻 Mezhevikin Alexey")
sheet.addAction(
    title: "Edit profile",
    systemIcon: "person.fill",
    color: .darkGreen,
    leftAligment: true
) {}
sheet.addAction(
    title: "Delete account",
    systemIcon: "trash.fill",
    color: .red,
    leftAligment: true
) {}
sheet.addAction(
    title: "Log out",
    systemIcon: "square.and.arrow.down.fill",
    leftAligment: true
) {}
sheet.addCancelAction()
present(sheet, sourceView: cell)
```

<p align="center">
    <img src="https://github.com/mezhevikin/AlertControllerExample/blob/master/Screens/sheet.jpg?raw=true" width="250">
</p>

### Choice

```swift
let sheet = UIAlertController.sheet("Choose your favorite animal")
let animals = ["🐈 Cat", "🐕 Dog", "🐎 Horse", "🐫 Camel"]
for (i, animal) in animals.enumerated() {
    sheet.addAction(
        title: animal,
        checked: favoriteAnimal == i,
        leftAligment: true
    ) {
        self.favoriteAnimal = i
    }
 }
sheet.addCancelAction()
present(sheet, sourceView: cell)
```

<p align="center">
    <img src="https://github.com/mezhevikin/AlertControllerExample/blob/master/Screens/choice.jpg?raw=true" width="250">
</p>

### TextField

```swift
let alert = UIAlertController.alert("🔓 Login")
alert.addTextField {
    $0.placeholder = "✉️ Mail"
}
alert.addTextField {
    $0.placeholder = "🔑 Password"
    $0.isSecureTextEntry = true
}
alert.addAction(title: "OK") {
    if let mail = alert.textFields?[0].text,
       let password = alert.textFields?[1].text
    {
        print("✉️ \(mail), 🔑 \(password)")    
    }
}
present(alert)
```

<p align="center">
    <img src="https://github.com/mezhevikin/AlertControllerExample/blob/master/Screens/fields.jpg?raw=true" width="250">
</p>

### Present

```swift
// Alert
present(alert)
// Sheet from cell with iPad support
present(sheet, sourceView: cell) 
// Sheet from BarButton with iPad support
present(sheet, barButtonItem: navigationItem.leftBarButtonItem) 
```

### Swift Package Manager

```
https://github.com/mezhevikin/AlertController.git
```

### CocoaPods

```
pod 'AlertController', :git => 'https://github.com/mezhevikin/AlertController.git'
```