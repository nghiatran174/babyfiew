App Babyfiew
=======

Use Mock data preview
------------

Change DI:
BabyFiew/ContentView.swift

Change services object name from XXXServices to XXXServicesMock
  
Example:

From:

```swift
@StateObject var loginViewModel = LoginViewModel(loginServices: LoginServices(requestManager: RequestManager()))
```

 To:
 
```swift
@StateObject var loginViewModel = LoginViewModel(loginServices: LoginServicesMock())
```

Login with: 

Username: admin

Password: admin

Use API
-------
Change API Path:
BabyFiew/Core/data/APIConstants.swift

Change DI:
BabyFiew/ContentView.swift

Change services object name from XXXServicesMock to XXXServices
  
Example:

From:
 
```swift
@StateObject var loginViewModel = LoginViewModel(loginServices: LoginServicesMock())
```

To:

```swift
@StateObject var loginViewModel = LoginViewModel(loginServices: LoginServices(requestManager: RequestManager()))
```
