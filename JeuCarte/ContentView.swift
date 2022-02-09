//
//  ContentView.swift
//  JeuCarte
//
//  Created by user193538 on 1/28/22.
//

import SwiftUI

struct ContentView: View {


    @State private var afficherAlerte: Bool = false
    @State private var titreAlerte: String = ""
    @State private var nomImageCarte: String = "card-back2"
    @State private var selection: Item?

    let paquet = Paquet()
    let listeCarteDepart = paquet.creeListeCartes()
    var listeCarteDispo = listeCarteDepart
    var listeCarteIndispo = []

    var body: some View {

        let carte = paquet.tirerCarteDessus()
        let fichierImageCarte = carte.getImage()
        let couleurCarte = caret.getCouleur()
        
        NavigationView {

            VStack {
                Text("Devinez la couleur de la carte")
                .padding()

                HStack {
                    Button(action: {
                        titreAlerte = validerPartie(nomCouleurJoueur:"Rouge", nomCouleurCarte: couleurCarte)
                        nomImageCarte = fichierImageCarte
                        afficherAlerte.toggle()
                    }) { Text("Rouge") }

                    Button(action: {
                        titreAlerte = validerPartie(nomCouleurJoueur:"Noire", nomCouleurCarte: couleurCarte)
                        nomImageCarte = fichierImageCarte
                        afficherAlerte.toggle()
                    }) { Text("Noire") }
                }

                Image(nomImageCarte)
                    .resizable()
                    .scaledToFit()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {

                    }
                }
            }

            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                Text("Jeu de Carte")
                })
            })
        }


        .alert(titreAlerte, isPresented: $afficherAlerte) {

            
        }
        .onAppear {
            carte = paquet.tirerCarteDessus()
            fichierImageCarte = carte.getImage()
            couleurCarte = caret.getCouleur()
        }
    }

    public func validerPartie(nomCouleurJoueur: String, nomCouleurCarte: String) -> String{
        var titreAlerte = "Bien joué!"
        if( (nomCouleurJoueur == nomCouleurCarte) {
            titreAlerte = "Dommage!"
        }
        return titreAlerte
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
