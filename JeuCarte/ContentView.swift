//
//  ContentView.swift
//  JeuCarte
//
//  Created by user193538 on 1/28/22.
//

import SwiftUI

struct ContentView: View {

    @State private var afficherAlerte: Bool = false

    @State var titreAlerte = "Bien joué!"
    @State var textAlerte = "Cliquer pour rejouer"
    @State var textBouttonAlerte = "Rejouer"

    var body: some View {

        NavigationView {

            VStack {
                Text("Devinez la couleur")
                .padding()

                Button(action: {
                    _ = validerPartie(nomCouleur:"Rouge")
                }) { Text("Rouge") }

                Button(action: {
                    _ = validerPartie(nomCouleur:"Noir")
                }) { Text("Noire") }
            }

            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                Text("Jeu de Carte")
                })
            })
        }

        
        .alert(titreAlerte, isPresented: $afficherAlerte) {
            
        }
    }
    
    func validerPartie(nomCouleur: String ) -> Int{
         // nombreCouleur Rouge = 0 Noire = 1
        let nombreCouleur = Int.random(in: 0..<1)

        if(nombreCouleur == 0 && nomCouleur == "Noire"
            || nombreCouleur == 1 && nomCouleur == "Rouge") {
            titreAlerte = "Dommage!"
        }
        afficherAlerte.toggle()
        return nombreCouleur
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
