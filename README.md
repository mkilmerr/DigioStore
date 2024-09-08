# DigioStore 🛸

### Tecnologias
* Swift ( 4.2 )
* UIKit ( View Code )
*  UI Design Pattern - ( MVVM )
* XCTestCase para testes unitários
* Fastlane 
-----------
## Configurações do Projeto

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

### 🔸 Screenshots 🔸

<img src="https://github.com/user-attachments/assets/b2f53629-1306-4de1-9607-0753e676d7aa" width="300" height="600">


<img src="https://github.com/user-attachments/assets/76b59352-3b53-47c9-8151-b7489dc7959a" width="300" height="600">


<img src="https://github.com/user-attachments/assets/f15d510b-5ad8-4118-b5dd-d42059bc2012" width="300" height="600">








