//: [Animação](@previous)
/*:
 # Como animar uma linha de forma segmentada
 
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
 Desta vez vamos trabalhar com uma senoide, somente para variar o formato da linha!
 */

let myPath = UIBezierPath()
myPath.move(to: CGPoint(x: 10, y: 667/2))
myPath.addQuadCurve(to: CGPoint(x: 90 , y: 667/2), controlPoint: CGPoint(x: 50 , y: 250))
myPath.addQuadCurve(to: CGPoint(x: 170, y: 667/2), controlPoint: CGPoint(x: 130, y: 417))
myPath.addQuadCurve(to: CGPoint(x: 250, y: 667/2), controlPoint: CGPoint(x: 210, y: 250))
myPath.addQuadCurve(to: CGPoint(x: 330, y: 667/2), controlPoint: CGPoint(x: 290, y: 417))

let myShapeLayer = CAShapeLayer()
myShapeLayer.strokeColor = UIColor.blue.cgColor
myShapeLayer.fillColor = UIColor.clear.cgColor
myShapeLayer.lineWidth = 2
myShapeLayer.path = myPath.cgPath
//myShapeLayer.strokeStart = 0.8       // Estas duas linhas serão
//myShapeLayer.strokeEnd = 1.0         // descomentadas em outro momento

/*:
 Novamente, até este ponto o programa é basicamente o mesmo que o primeiro.
 
 A partir de agora nós vamos trabalhar no grupo de animações que irá compor a animação segmentada.
 
 Vamos criar a animação que irá desenhar a linha assim como fizemos anteriormente, e em seguida criaremos a animação que irá apagar a linha.
 
 A animação que desenha usa a KeyPath `strokeEnd`, como vimos anteriormente. `strokeEnd` representa o ponto final, a extremidade final do path. Enquanto `strokeStart`, usado como animação que apaga a linha, representa o primeiro ponto da linha, a extermidade inicial.
 
 O que causa o efeito da animação segmentada é uma relação entre o `fromValue` e o `toValue` de cada uma dessas duas animações.
 
 O que vamos fazer a seguir será exatamente o seguinte:
 
 `strokeStart: fromValue = 0; toValue = 0.8`
 
 Isso fará com que o ponto inicial seja movido de 0% até 80% da linha total. Isso significa que ao final desta animação 80% da linha estará apagada.
 
 `strokeEnd: fromValue = 0.2; toValue = 1.0`
 
 Isso fará com que o ponto final da linha comece em 20% da linha, e acabe em 100% da linha. Isso siginifica que 80% da linha estará desenhada ao final da animação.
 
 A combinação dessas duas animações faz com que somente 20% da animação seja visível durante a animação, o que dá a impressão de que a animação é segmentada.
 
 Os conceitos ficarão mais claros depois de escrever o código, então vamos lá!
 
 ## strokeEnd: Ponto final da linha
*/

let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
myEndAnimation.fromValue = 0.2
myEndAnimation.toValue = 1.0
/*:
 ## strokeStart: Ponto inicial da linha
 */
let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
myStartAnimation.fromValue = 0.0
myStartAnimation.toValue = 0.8

/*:
 Como nós vamos trabalhar com `animationGroup`, os atributos `duration`, `repeatCount` etc, devem ser atribuídos somente ao grupo de animações, e não a cada animação individualmente.
 
 Agora que já criamos as nosssas duas animações, vamos criar o grupo de animações, e adicioná-las a ele!
 
 Descomente as linhas abaixo para poder visualizar a animação!
 */

let myAnimationGroup = CAAnimationGroup()
//myAnimationGroup.animations = [myEndAnimation, myStartAnimation]
//myAnimationGroup.duration = 3

/*:
 Agora é possível perceber que a animação está funcionando perfeitamente. Como era de se esperar, a animação apresenta somente um tamanho equivalente a 20% da linha total durante o decorrer do path. Porém a linha volta ao seu estado inicial quando a animação termina. Para isso não acontecer, nós devemos definir o `strokeStart` e o `strokeEnd` desta layer. Basta agora descomentar as linhas 38 e 39 logo acima para observar isso.
 
 * Callout(Atenção): Estas são as linhas que devem ser descomentadas:\
 38 myShapeLayer.strokeStart = 0.8\
 39 myShapeLayer.strokeEnd = 1.0
 
 ## Outros atributos interesssantes
 Descomente os atributos abaixo, e observe o comportamento da animação
*/

//myAnimationGroup.repeatCount = HUGE
//myAnimationGroup.autoreverses = true

//Adicionando o Grupo de animações à sua layer.
myShapeLayer.add(myAnimationGroup, forKey: "drawSenoid")

//Adicionando a layer à containerView, como no programa anterior.
myView.layer.addSublayer(myShapeLayer)

//: [Sobre](@next)
