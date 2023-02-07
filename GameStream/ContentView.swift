//
//  ContentView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 7/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 21/255, green: 31/255, blue: 59/255, opacity: 1.0).ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                StartAndRegisterView()
            }
        }
    }
}

struct StartAndRegisterView: View {
    var body: some View {
        VStack {
            HStack {
                Text("INICIA SESIÓN")
                Text("REGÍSTRATE")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla1")
    }
}
