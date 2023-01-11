//
//  PolicyAgreeView.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI

struct PolicyAgreeView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        NavigationView{
            VStack{
                
                //이용약관 동의 타이틀
                HStack{
                    Text("이용약관 동의가 필요해요")
                        .font(.system(size: 18, weight: .bold))
                        
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 24)
                
                VStack{
                    HStack{
                        Text("전체 동의")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                            .padding(.leading, 16)
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    
                    HStack{
                        NavigationLink(destination: {
                            PolicyDetailView(title: "(필수) 서비스 이용 약관 동의")
                        }, label: {
                            Text("(필수) 서비스 이용 약관 동의")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.leading, 16)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                          
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    HStack{
                        NavigationLink(destination: {
                            PolicyDetailView(title: "(필수) 서비스 이용 약관 동의")
                        }, label: {
                            Text("(필수) 서비스 이용 약관 동의")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.leading, 16)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    HStack{
                        NavigationLink(destination: {
                            PolicyDetailView(title: "(필수) 서비스 이용 약관 동의")
                        }, label: {
                            Text("(필수) 서비스 이용 약관 동의")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.leading, 16)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    HStack{
                        NavigationLink(destination: {
                            PolicyDetailView(title: "(필수) 서비스 이용 약관 동의")
                        }, label: {
                            Text("(필수) 서비스 이용 약관 동의")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.leading, 16)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                           
                            
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    HStack{
                        NavigationLink(destination: {
                            PolicyDetailView(title: "(필수) 서비스 이용 약관 동의")
                        }, label: {
                            Text("(필수) 서비스 이용 약관 동의")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.leading, 16)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                           
                            
                        }, label: {
                            Image("disabled")
                        })
                        .padding(.trailing, 16)
                        
                    }
                    
                    
                }.padding(.top, 24)
               
                
                
                Spacer()
                
                Button(action: {
                    print("동의할게요 클릭")
                    viewModel.state = .login
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("abled_yellow")
                })
                .padding(.bottom, 60)
            }
        }
        
    }
}

struct PolicyAgreeView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyAgreeView()
    }
}
