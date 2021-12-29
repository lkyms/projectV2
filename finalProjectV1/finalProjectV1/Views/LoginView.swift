//
//  ContentView.swift
//  finalProjectV1
//
//  Created by Lwj on 2021/11/21.
//

import SwiftUI

struct LoginView: View {
    
//    @EnvironmentObject var vm: ckLgIn
    
    @State private var name = ""
    @State private var pswd = ""
    @State private var flag: Bool = false
    @State private var authSuccess: Bool = false
    @State private var authfailed: Bool = false
    
    @State private(set) var thejson: jsonPostFailed = jsonPostFailed(message: "", status: -1)
    
    
    @StateObject var viewModel = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        NavigationView(content: {
            VStack{
                LoginTextContent()
                
                UserImage()
                UserNameTextField(name: $name)
                PasswordSecureField(pswd: $pswd)
                NavigationLink(destination: HomeView(),isActive: $flag){
                    Button {
//                        viewModel.checkUserNameAndPassword(name, pswd)
                        checkUserNameAndPassword(name, pswd)
                        print("-----------111-----------")
                        print("thejson=\(thejson)")
                        if thejson.status == 0 {
                            self.authfailed = false
                            self.flag.toggle()
                            
                        } else {
                            self.authfailed = false
                        }
                    } label: {
                        LoginButtonContent()
                    }
//                    .alert("failed, please retry", isPresented: $authfailed) {
//                        Button("OK"){}
//                    }

                }
            }
            .padding()
        })
    }
    
    func checkUserNameAndPassword(_ name: String, _ pswd: String) {
        print("_______22222______")
        guard let url = URL(string: "http://hutaowlp.xyz:114/api/login") else { return }
        let title: String = name
        let bar: String = pswd
        //let userId = 1
        let body: [String: Any] = ["Username": title, "Password": bar]
        let finalData = try! JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        var request = URLRequest(url: url)
        request.httpBody = finalData
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            do {
                if let data = data {
                    print("--------------------")
                    let resultS = try JSONDecoder().decode(jsonPostFailed.self, from: data)
//                    DispatchQueue.main.async {
                        thejson = resultS
                        print(thejson)
//                    vm.isLogin = true
                        flag = true
//                    }
                    
                } else {
                    print("No data")
                }
            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginTextContent: View {
    var body: some View {
        Text("校园App 登陆界面")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 30)
            .font(.largeTitle)
    }
}

struct UserImage: View {
    var body: some View {
        Image("LoginImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 50)
    }
}

struct UserNameTextField: View {
    @Binding var name: String
    var body: some View {
        TextField("name:", text: $name)
            .padding(.all)
            .background(.thinMaterial)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var pswd: String
    var body: some View {
        SecureField("password:", text: $pswd)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(.thinMaterial)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(.black)
            .cornerRadius(35)
    }
}

