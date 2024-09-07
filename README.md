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

#### 3. Aceitar os termos de licença do Xcode

```swift
sudo xcodebuild -license
```

#### 5. Reinicie o terminal

### 🔸 Fastlane 🔸

- Instale o [Homebrew](https://brew.sh)
- Vá para a raiz do projeto
- Rode as lanes

#### Lanes
##### Baixa o SwiftLint
```swift
fastlane install_swiftlint
```
##### Roda os testes unitários

```swift
fastlane unit_tests
```

