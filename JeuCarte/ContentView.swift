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
    @State private var pointJoueur: Int = 0
    @State private var  logPartie:[LogPartie] = []

    private var paquet = Paquet()
    private var listeCarteDepart: [Carte] = []
    

    var body: some View {
        
    
       
        var carte = paquet.tirerCarteDessus()
        var fichierImageCarte = carte.getImage()
        var couleurCarte = carte.getCouleur()
        
        NavigationView {

            VStack {
                Text("Devinez la couleur de la carte")
                .padding()
                Text("Points: " + String(pointJoueur))
                .padding()

                HStack {
                    Button(action: {
                        nomImageCarte = fichierImageCarte
                        titreAlerte = validerPartie(nomCouleurJoueur:"Rouge",
                            nomCouleurCarte: couleurCarte, 
                            imageCarte: nomImageCarte
                        )
                        afficherAlerte.toggle()
                    }) { Text("Rouge") 
                    }

                    Button(action: {
                        nomImageCarte = fichierImageCarte
                        titreAlerte = validerPartie(nomCouleurJoueur:"Noire",
                            nomCouleurCarte: couleurCarte,
                            imageCarte: nomImageCarte
                        )
                        afficherAlerte.toggle()
                    }) { Text("Noire")
                        
                    }
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
            couleurCarte = carte.getCouleur()
        }
    }

    public func validerPartie(nomCouleurJoueur: String, nomCouleurCarte: String, imageCarte: String) -> String{
        var titreAlerte = "Dommage!"
        let gagner = nomCouleurJoueur == nomCouleurCarte
        if(gagner) {
            pointJoueur += 1
            titreAlerte = "Bien joué"
            loggerPartie(gagner: true, nomImageCarte: imageCarte, scoreJoueur: pointJoueur)
        }
        loggerPartie(gagner: false, nomImageCarte: imageCarte, scoreJoueur: pointJoueur)
        return titreAlerte
    }
    
    public func loggerPartie(gagner: Bool, nomImageCarte: String, scoreJoueur: Int) {
        logPartie.append(LogPartie(gagner: gagner, imageAssoc: nomImageCarte))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
