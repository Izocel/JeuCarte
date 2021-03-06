import Foundation

struct Paquet {
    var id = UUID()
    private var listeCartes : [Carte] = [];
    private var listeCartesJeu : [Carte] = [];
    private var listeCartesDispo : [Carte] = [];
    private var listeCartesIndispo : [Carte] = [];
    
    public let imagesCartes : [String] = [
    "card-hearts-1",    "card-hearts-2",    "card-hearts-3",    "card-hearts-4",    "card-hearts-5",    "card-hearts-6",    "card-hearts-7",    "card-hearts-8",    "card-hearts-9",    "card-hearts-10",    "card-hearts-11",    "card-hearts-12",    "card-hearts-13",
    "card-diamonds-1",    "card-diamonds-2",    "card-diamonds-3",    "card-diamonds-4",    "card-diamonds-5",    "card-diamonds-6",    "card-diamonds-7",    "card-diamonds-8",    "card-diamonds-9",    "card-diamonds-10",    "card-diamonds-11",    "card-diamonds-12",    "card-diamonds-13",
    "card-clubs-1",    "card-clubs-2",    "card-clubs-3",    "card-clubs-4",    "card-clubs-5",    "card-clubs-6",    "card-clubs-7",    "card-clubs-8",    "card-clubs-9",    "card-clubs-10",    "card-clubs-11",    "card-clubs-12",    "card-clubs-13",
    "card-spades-1",    "card-spades-2",    "card-spades-3",    "card-spades-4",    "card-spades-5",    "card-spades-6",    "card-spades-7",    "card-spades-8",    "card-spades-9",    "card-spades-10",    "card-spades-11",    "card-spades-12",    "card-spades-13"
    ]

    
    init() {
        listeCartes = creeListeCartes()
        brasserLejeu()
    }

    public mutating func tirerCarteDessus() -> Carte {
        let carte = listeCartesJeu[0]
        rendreCarteIndispo(index: 0)
        return carte
    }


    public func nbCarteEnJeu() -> Int {
        return listeCartesJeu.count;
    }

    public mutating func brasserLejeu() -> Void {
        listeCartesJeu.removeAll()
        listeCartesDispo.removeAll()
        listeCartesIndispo.removeAll()
        let n = listeCartes.count-1

        for _ in 0...n {
            listeCartesJeu.append(
                tirerCarteDispoHasard()
            )
        }
        listeCartesDispo = listeCartesJeu
    }

    public mutating func creeListeCartes() -> [Carte] {
        var liste: [Carte]  = []
        let n = imagesCartes.count-1
        for i in 0...n {
            let image = imagesCartes[i]
            liste.append(Carte(imageAssoc: image))
        }
        listeCartesDispo = liste

        return liste
    }
        
    private mutating func tirerCarteDispoHasard() -> Carte {
        let n = listeCartesDispo.count-1
        var carte:Carte = Carte(imageAssoc: "")

        if(n > 0){
            let rnd = Int.random(in: 0...n)
            carte = listeCartesDispo[rnd]
            rendreCarteIndispo(index: rnd)
        }
        return carte
    }
    
    private mutating func rendreCarteIndispo(index: Int) ->  Void{
        listeCartesIndispo.append(listeCartesDispo[index])
        listeCartesDispo.remove(at: index)
    }
    
}


