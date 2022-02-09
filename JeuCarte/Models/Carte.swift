import Foundation

struct Carte : Identifiable  {
    var id: UUID()
    private var type: String
    private var numero: Int
    private var couleur: String
    private var image: String

    private func resoudreCouleur couleur() : String {
        let couleur:String = ""
        if(self.type == "clubs" || self.type == "spades"){
            couleur = "noire"

        else{
            couleur = "rouge"
        }
        return couleur
    }

    public getCouleur(): String {
        return self.couleur
    }
    public getType(): String {
        return self.type
    }
    public getNumero(): String {
        return self.numero
    }
    public getImage(): String {
        return self.image
    }
}

extension Carte {
  init(imageAssoc: String) {
    let composantes = imageAssoc.components(separatedBy: "-")

    self.image = imageAssoc
    self.type = composantes[0]
    self.numero = composantes[2]
    self.couleur = resoudreCouleur()
  }
}