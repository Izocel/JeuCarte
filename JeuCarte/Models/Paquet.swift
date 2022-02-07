import Foundation

struct Paquet {

    private let carteDispo : [String] = [
    "card-hearts-1",    "card-hearts-2",    "card-hearts-3",    "card-hearts-4",    "card-hearts-5",    "card-hearts-6",    "card-hearts-7",    "card-hearts-8",    "card-hearts-9",    "card-hearts-10",    "card-hearts-11",    "card-hearts-12",    "card-hearts-13",
    "card-diamonds-1",    "card-diamonds-2",    "card-diamonds-3",    "card-diamonds-4",    "card-diamonds-5",    "card-diamonds-6",    "card-diamonds-7",    "card-diamonds-8",    "card-diamonds-9",    "card-diamonds-10",    "card-diamonds-11",    "card-diamonds-12",    "card-diamonds-13",
    "card-clubs-1",    "card-clubs-2",    "card-clubs-3",    "card-clubs-4",    "card-clubs-5",    "card-clubs-6",    "card-clubs-7",    "card-clubs-8",    "card-clubs-9",    "card-clubs-10",    "card-clubs-11",    "card-clubs-12",    "card-clubs-13",
    "card-spades-1",    "card-spades-2",    "card-spades-3",    "card-spades-4",    "card-spades-5",    "card-spades-6",    "card-spades-7",    "card-spades-8",    "card-spades-9",    "card-spades-10",    "card-spades-11",    "card-spades-12",    "card-spades-13"
]
    private var cartIndispo : [String] = []

    
    public func tirerUneCarteDispo(): Carte {
        let n = carteDispo.count()
        let rndImgIndex = Int.random(in: 0...n-1)
        let nomImageCarte = carteDispo[rndImgIndex]
        retirerCarte(index: rndImgIndex);
        return Carte(nomImageCarte)
    }

    private func retirerCarte(index: Int) {
        cartIndispo.append(carteDispo[index])
        carteDispo.remove(at: index);
    }
    
}


