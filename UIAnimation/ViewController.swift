// Animação

import UIKit

class ViewController: UIViewController
{
    // linkando o foguete e o mundo
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    override func viewDidLoad()
    {
        print("viewDidLoad")
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        print("viewDidAppear")
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseInOut], animations:
        {
            self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
            
            self.rocket.transform = self.rocket.transform.rotated(by: .pi/2)
//            self.rocket.transform = self.rocket.transform.scaledBy(x: 2, y: 2)
        }, completion: // ação executada após o término da animação
            {
                finished in
//                self.rocket.image = UIImage(named: "rocket2.png")
                self.outraAnimacao()
            })
    }
    
    func outraAnimacao()
    {
        UIView.animate(withDuration: 3.0, animations:
        {
             self.rocket.center.x = self.view.frame.width + self.rocket.frame.width/2
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        print("viewWillAppear")
        // chamada para arrumar o conteúdo antes de aparecer na tela
        // .frame = tamanho
        
        // largura do planeta = largura da view
        self.world.frame.size.width = self.view.frame.width
        
        // posiciona o planeta na parte de baixo
        self.world.center.y = self.view.frame.height
        
        // altura do foguete = 15% da altura da view
        self.rocket.frame.size.height = self.view.frame.height * 0.15
        
        // centralizar no eixo x
        self.rocket.center.x = self.view.center.x
        
        // posiciona o foguete na parte de cima da view
        self.rocket.center.y = self.rocket.frame.height/2
    }
}
