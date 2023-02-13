//
//  ContentView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 7/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 21/255, green: 31/255, blue: 59/255, opacity: 1.0).ignoresSafeArea()
                VStack {
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 50)
                    StartAndRegisterView()
                }
            }
        }
    }
}

struct StartAndRegisterView: View {
    @State var typeStartSession = true
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    self.typeStartSession = true
                }.foregroundColor(typeStartSession ? .white : .gray).fontWeight(.bold)
                Spacer()
                Spacer()
                Button("REGÍSTRATE") {
                    self.typeStartSession = false
                }.foregroundColor(typeStartSession ? .gray : .white).fontWeight(.bold)
                Spacer()
            }
            Spacer(minLength: 42)
            if typeStartSession == true {
                LoginView()
            } else {
                RegisterView()
            }
        }
    }
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isHomeViewActive = false
    
    func login() {
        self.isHomeViewActive = true
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo electrónico").foregroundColor(Color("darkCyan"))
                ZStack(alignment: .leading) {
                    if(email.isEmpty) {
                        Text("example@host .com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $email).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(Color("darkCyan"))
                ZStack(alignment: .leading) {
                    if(password.isEmpty) {
                        Text("*******").font(.caption).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                Text("¿Olvidaste tu contraseña?").foregroundColor(Color("darkCyan")).font(.footnote).frame(width: 300, alignment: .trailing).padding(.bottom, 60)
                Button {
                    login()
                } label: {
                    Text("INICIA SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("darkCyan"), lineWidth: 1.5).shadow(color:.white, radius: 5))
                }.navigationDestination(isPresented: $isHomeViewActive) {
                    HomeView()
                }

            }.padding(.bottom, 70)
            VStack {
                Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                HStack {
                    Button {
                        print("login with facebook")
                    } label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        print("login with twitter")
                    } label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }.padding(.horizontal, 50.0)
    }
}


struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    @State var isHomeViewActive = false
    
    func register() {
        self.isHomeViewActive = true
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Elige una foto de perfil").foregroundColor(.white).fontWeight(.bold)
                Text("Puedes cambiar o elegir más adelante").font(.footnote).foregroundColor(.gray).fontWeight(.light).padding(.bottom)
                Button {
                    takeAPick()
                } label: {
                    ZStack {
                        Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }

            }.padding(.bottom, 40)
            VStack(alignment: .leading) {
                Text("Correo electrónico*").foregroundColor(Color("darkCyan"))
                ZStack(alignment: .leading) {
                    if(email.isEmpty) {
                        Text("example@host .com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $email).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                Text("Contraseña*").foregroundColor(Color("darkCyan"))
                ZStack(alignment: .leading) {
                    if(password.isEmpty) {
                        Text("*******").font(.caption).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                Text("Confimar contraseńa*").foregroundColor(Color("darkCyan"))
                ZStack(alignment: .leading) {
                    if(confirmedPassword.isEmpty) {
                        Text("*******").font(.caption).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
                    SecureField("", text: $confirmedPassword).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom, 60)
                Button {
                    register()
                } label: {
                    Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("darkCyan"), lineWidth: 1.5).shadow(color:.white, radius: 5))
                }.navigationDestination(isPresented: $isHomeViewActive) {
                    HomeView()
                }
            }.padding(.bottom, 70)
            VStack {
                Text("Registrate con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                HStack {
                    Button {
                        print("login with facebook")
                    } label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        print("login with twitter")
                    } label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }.padding(.horizontal, 50.0)
    }
}

func takeAPick() {
    print("taking a pick")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla2")
    }
}
