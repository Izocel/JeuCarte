import Foundation

struct Carte : Identifiable  {
    var id = UUID()
    private var type: String = ""
    private var numero: Int = 0
    private var couleur: String = ""
    private var image: String = ""


    private func resoudreCouleur() -> String {
        var couleur:String = ""
        if(self.type == "clubs" || self.type == "spades"){
            couleur = "noire"
        }
        else{
            couleur = "rouge"
        }
        return couleur
    }

    public func getCouleur()-> String {
        return self.couleur
    }
    public func getType()-> String {
        return self.type
    }
    public func getNumero()-> Int {
        return self.numero
    }
    public func getImage()-> String {
        return self.image
    }
}

extension Carte {
  init(imageAssoc: String) {
    let composantes = imageAssoc.components(separatedBy: "-")
      if(imageAssoc == ""){
          
          self.image = "card-back1"
          self.type = "null"
          self.numero = 0
          self.couleur = "null"
          return
      }
        
        self.image = imageAssoc
        self.type = composantes[0]
        self.numero = Int(composantes[2]) ?? 0
        let couleur = resoudreCouleur()
        self.couleur = couleur
  }
    public func carteDefault() -> Carte {
        return Carte(imageAssoc: "")
    }
}
