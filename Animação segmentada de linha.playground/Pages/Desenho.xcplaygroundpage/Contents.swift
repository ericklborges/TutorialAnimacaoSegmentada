/*: Playground - noun: a place where people can play
 
 # Como desenhar uma linha
 
 Antes de qualquer coisa, vamos configurar o nosso playground para ter uma View principal, para que seja possível colocar elementos em tela.
 
 
 ### Setup
 
 Nas próximas linhas vamos adicionar as duas bibliotecas básicas para que seja possível trabalhar com o playground.
 - **UIKit**: Biblioteca fundamental para a manipulação de qualquer elemento de interface baseado em UIView
 - **PlaygroundSupport**: Traz uma serie de funções de suporte para o playground
 */
import UIKit
import PlaygroundSupport
/*:
 Agora nós devemos criar uma View que irá conter todos os elementos de tela que nós adicionarmos. Esta é a view principal do nosso playground, todas as outras view serão adicionadas a ela.
 
 Para finalizar o setup, basta dizer ao playground que a View que acabamos de criar, é a View atual que deve ser exibida como live view. É o que acontece na última linha.
 
 Descomente o bloco de código abaixo para ver a view que acabamos de criar!
 */

// -- Container View

//let myView: UIView = {
//    let view = UIView()
//    view.frame.size = CGSize(width: 375, height: 667)
//    view.backgroundColor = .white
//    return view
//}()
//
//PlaygroundPage.current.liveView = myView

/*:
 Agora que o nosso playground já está configurado, vamos desenhar a nossa linha!
 
 Para isso, primeiro vamos criar um `UIBezierPath`, vamos movê-lo para o ponto inicial da nossa linha, e dizer para onde a linha deve ser desenhada.
 */

let myPath = UIBezierPath()
myPath.move(to: CGPoint(x: 50, y: 100))        // A linha começa aqui
myPath.addLine(to: CGPoint(x: 300, y: 100))    // E termina aqui

/*:
 A nossa linha já foi criada, mas ela ainda não pode ser visualizada. Para poder ser visualizado, o `UIBezierPath` deve ser adicionado a um layer, que poderá definir sua cor, e a largura de seu traço.
 
 Para isso vamos criar um `shapeLayer` que irá receber `myPath` como seu atributo `path`:
 */

let myShapeLayer = CAShapeLayer()
myShapeLayer.strokeColor = UIColor.blue.cgColor
myShapeLayer.lineWidth = 2
myShapeLayer.path = myPath.cgPath

/*:
 Agora que nós temos um layer que contém um `UIBezierPath`, uma cor, e uma largura de traço, basta que essa layer seja adicionada à View principal para que a linha seja visualizada.
 
 Descomente o bloco de código abaixo para ver a nossa linha!
 */

//myView.layer.addSublayer(myShapeLayer)

/*:
 Experimente alterar, e adicionar os pontos definidos em `myPath` para perceber que é possível desenhar qualquer forma! Tente os métodos:
 - `myPath.addLine`
 - `myPath.addQuadCurve`
 - `myPath.addCurve`
 - `myPath.addArc`
 
 ## No próximo passo vamos aprender a animar uma linha!
 */
//: [Animação](@next)
