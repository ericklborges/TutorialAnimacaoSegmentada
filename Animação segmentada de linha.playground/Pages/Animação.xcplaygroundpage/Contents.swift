//: [Desenho](@previous)
/*:
 # Como animar uma linha
 
 As primeiras linhas de código configuram a `ContainerView` novamente.
 */
import UIKit
import PlaygroundSupport

// -- Container View
let myView: UIView = {
    let view = UIView()
    view.frame.size = CGSize(width: 375, height: 667)
    view.backgroundColor = .white
    return view
    
}()

PlaygroundPage.current.liveView = myView
/*:
 Desta vez vamos trabalhar com um círculo, somente para variar o formato da linha!
 */
let myPath = UIBezierPath()
myPath.addArc(withCenter: CGPoint(x: 375/2, y: 667/2), radius: 60, startAngle: 0, endAngle: 2 * .pi, clockwise: true)

let myShapeLayer = CAShapeLayer()
myShapeLayer.strokeColor = UIColor.blue.cgColor
myShapeLayer.fillColor = UIColor.clear.cgColor
myShapeLayer.lineWidth = 2
myShapeLayer.path = myPath.cgPath
/*:
 Até este ponto o programa é basicamente o mesmo que o anterior.
 
 A partir de agora nós vamos trabalhar na animação, que fuciona de forma muito simples.
 
 É preciso criar uma animação e adicioná-la à layer que deve ser animada, no nosso caso, à `myShapeLayer`. A animação que será usada é a seguinte: `CABasicAnimation(keyPath:)`
 
 O chamado `keyPath` é uma string que neste caso vai representar o atributo escolhido para ser animado. A lista de atributos que esta função pode acessar é encontrada neste link: [Key-Value Coding Extensions](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html)
 
 Como a animação vai manipular um `UIBezierPath` vamos trabalhar com a `keyPath` "strokeEnd". Esta `keyPath` indica que iremos animar a linha sendo desenhada.
 
 Alguns dos atributos essenciais para o funcionamento correto da animação são:
 - **fromValue**: Varia entre 0 e 1 e repensenta o **ponto inicial** da animação proporcional ao tamanho do path.
 - **toValue**: Varia entre 0 e 1 e repensenta o **ponto final** da animação proporcional ao tamanho do path.
 - **duration**: A duração da animação em segundos.
 
 Descomente o bloco de código abaixo pata visualizar a animação, e brinque com estes valores para compreender melhor seus significados!
 */

//let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
//myAnimation.fromValue = 0
//myAnimation.toValue = 1
//myAnimation.duration = 5
//
////Adicionando a animação à sua respectiva layer:
//myShapeLayer.add(myAnimation, forKey: "drawLine")

/*:
 * Callout(Extra):
 Mais alguns atributos de animação interessantes de se trabalhar:\
 `myAnimation.repeatCount = HUGE` : Repete a animação n vezes.\
 `myAnimation.autoreverses = true` : Roda a animação de trás para frente.\
 `myAnimation.beginTime = CACurrentMediaTime() + delay` : atrasa o começo da animação.
 */

//Adicionando a layer à containerView, como no programa anterior.
myView.layer.addSublayer(myShapeLayer)

/*:
 ## Agora vamos trabalhar com grupos de animação, e a animação segmentada!
 */
//: [Animação segmentada](@next)
