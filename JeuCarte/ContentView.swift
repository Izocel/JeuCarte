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

    let paquet = Paquet()


    var body: some View {

        var nombreCouleur = paquet.tirerUneCouleur()
        var typeCarte = paquet.tirerUnTypeSelonCouleur(numcouleur: nombreCouleur)
        var nomImageCarteTirer = paquet.recevoirNomImage(typeCarte: typeCarte)

        NavigationView {

            VStack {
                Text("Devinez la couleur de la carte")
                .padding()

                HStack {
                    Button(action: {
                        titreAlerte = validerPartie(nomCouleur:"Rouge", nombreCouleur: nombreCouleur)
                        nomImageCarte = nomImageCarteTirer
                        afficherAlerte.toggle()
                    }) { Text("Rouge") }

                    Button(action: {
                        titreAlerte = validerPartie(nomCouleur:"Noire", nombreCouleur: nombreCouleur)
                        nomImageCarte = nomImageCarteTirer
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
            nombreCouleur = paquet.tirerUneCouleur()
            typeCarte = paquet.tirerUnTypeSelonCouleur(numcouleur: nombreCouleur)
            nomImageCarteTirer = paquet.recevoirNomImage(typeCarte: typeCarte)
        }
    }

    public func validerPartie(nomCouleur: String, nombreCouleur: Int) -> String{
        var titreAlerte = "Bien joué!"

        if( (nombreCouleur == 0 && nomCouleur == "Noire")
            || (nombreCouleur == 1 && nomCouleur == "Rouge") ) {
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
