# ios-dvm-boilerplate
Data / View / Manager version of MVC architecture

The manager class acts as coordinating controller between data and view. Standard properties are "data" and "delegate", which is generally the corresponding ViewController. If declaring as a singleton, can also include static let "shared" as an instance of self. i.e.:

```
static let shared : MyManager = MyManager()
```

The View accesses data though the manager and is notified of any necessity to update the UI by the manager. Maintain a reference to the manager by declaring manager as a property of the view and setting self as its delegate in "viewDidLoad". i.e:

```
override func viewDidLoad() {
  super.viewDidLoad()
  self.manager = MyManager.shared
  // or self.manager = MyManager()
  self.manager.delegate = self
}
```

You then access relevant data through the manager. i.e.

```
self.someLabel.text = self.manager.data.someProperty
```

