# DigioStore 🛸

### Tecnologias
* Swift ( 4.2 )
* UIKit ( View Code )
* Design Pattern - UI ( MVVM )
* XCTestCase para testes unitários
* Fastlane 
-----------
## Configuraçãoes do Projeto

### 🔸 Xcode 🔸

#### Será necessário alguns steps para que o Fastlane rode sem problemas

#### 1. Certifique-se de que o Xcode está instalado

```swift
xcode-select --install
```

#### 2. Defina o caminho correto para o Xcode

```swift
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

### 🔸 Fastlane 🔸

- Instale o [Homebrew](https://brew.sh)
- Vá para a raiz do projeto e rode a lane para baixar o Swiftlint
```swift
fastlane install_swiftlint
```

