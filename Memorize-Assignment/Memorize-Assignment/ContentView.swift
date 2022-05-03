//
//  ContentView.swift
//  Memorize-Assignment
//
//  Created by Hruthvik Raj on 2022/03/15.
//
// Student ID: 2018117966
// Name: Hruthvik Raj



import SwiftUI

let animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐵"]

let games = ["⛷","🛼","🛹","⚽️","🏀","🏈","🏓","🏸","🏑","⛳️","🥊","🎿","♟","🎳"]

let flags = ["🇨🇦","🇮🇳","🇯🇵","🇰🇷","🇸🇬","🇬🇧","🇨🇭","🇸🇪","🏳️‍🌈","🇩🇪","🇨🇳","🇹🇭","🇷🇼","🇻🇳","🇦🇺","🇺🇸"]

struct ContentView: View {

    
    @State var emojis = animals.shuffled()
    
     @State var emojiCount = 9
    
    var body: some View {
        
        
        VStack{
            Text("Memorize!").font(.largeTitle)
            Spacer()
            Text("Name: Hruthvik Raj")
            Spacer()
            Text("ID: 2018117966")
            Spacer(minLength: 40)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(emojis[0..<emojiCount], id: \.self) {emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            }.foregroundColor(.red)
            Spacer()
            HStack{
                Animal
                Spacer()
                Sport
                Spacer()
                Flag
            
            }.font(.largeTitle).padding(.horizontal)
            
        }.padding(.horizontal)
    }
    
    // to generate random number of random flags
    var Flag: some View {
        VStack{
        Button( action: {
            emojis = flags.shuffled()
            emojiCount = 14
        }
                ,label: {
            Image(systemName: "flag.fill")
        })
            Text("Flags").font(.body)
        }
    }
    
    // to generate random number of random games
    var Sport: some View {
        VStack{
            Button( action: {
            emojis = games.shuffled()
            emojiCount = 10
        }
                ,label: {
            Image(systemName: "gamecontroller.fill")
        })
            Text("Games").font(.body)
    }
    }
    
    // to generate random number of random animals
    var Animal: some View {
        VStack{
            Button(action:
        {
            emojis = animals.shuffled()
            emojiCount = 9
        }
    ,label: {
            Image(systemName: "pawprint.fill")
                })
            Text("Animals").font(.body)
    }
    }
}



struct CardView: View {
    var content: String
    @State var isfaceUp: Bool = true
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isfaceUp {
            shape.fill().foregroundColor(.white)
            //shape.stroke(lineWidth: 12)
                shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }.onTapGesture{ isfaceUp = !isfaceUp }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
    }
}
