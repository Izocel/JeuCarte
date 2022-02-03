import Foundation

struct Paquet {
    var carteDisponible : Array<Int> = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54]
    var carteIndisponible : Array<Int> = []



    let stringTypeCarte : Array<String> = ["diamonds", "hearts", "spades", "clubs"]

    

    public func tirerUneCouleur() -> Int {
        return Int.random(in: 0...1)
    }

    public func recevoirNomImage(typeCarte: String) -> String{
        let numero = Int.random(in: 1...13)

        return "card-\(typeCarte)-\(numero)"
    }



    public func tirerUnTypeSelonCouleur(numcouleur: Int) -> String {

        // Sera utilisé pour déterminer le type selon la couleur
        let rndSwitch = Int.random(in: 0...1)


        if(numcouleur == 0) {
            return stringTypeCarte[rndSwitch];
        }
        return stringTypeCarte[rndSwitch+2];
    }
}
