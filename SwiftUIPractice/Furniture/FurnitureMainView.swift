import SwiftUI

struct FurnitureMainView: View {
    var body: some View {
        FurnitureHome()
    }
}

struct FurnitureMainView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureMainView()
            
    }
}

struct FurnitureHome : View {
    @State var index = 0
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                switch index {
                case 0:
                    HomeTabView()
                case 1:
                    SingleTapView(title: "Search")
                case 2:
                    SingleTapView(title: "Cart")
                default:
                    SingleTapView(title: "Profile")
                }
                
                Spacer()
                BottomNav(index: $index)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Furniture")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Image("menu")
                            .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image("qr")
                            .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.colorScheme == .dark ? .light : .dark
                    } label: {
                        Image(systemName: "moon.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        
    }
}

struct BottomNav : View {
    @Binding var index: Int
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        HStack{
            NavButton(index: .constant(0), selectedIndex: $index, imageString: .constant("home"), title: .constant("Home"))
            Spacer(minLength: 0)
            NavButton(index: .constant(1), selectedIndex: $index, imageString: .constant("search"), title: .constant("Search"))
            Spacer(minLength: 0)
            NavButton(index: .constant(2), selectedIndex: $index, imageString: .constant("cart"), title: .constant("Cart"))
            Spacer(minLength: 0)
            NavButton(index: .constant(3), selectedIndex: $index, imageString: .constant("account"), title: .constant("Account"))


        }
        .padding(.horizontal, 25)
        .padding(.top)
        // based on device, bottom padding will be changed
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .background(self.scheme == .dark ? Color.black : Color.white)
        .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 5, y: -5)
            
    }
}

struct NavButton : View {
    @Binding var index: Int
    @Binding var selectedIndex: Int
    @Binding var imageString: String
    @Binding var title: String
    
    var body : some View {
        Button {
            selectedIndex = index
        } label: {
            HStack(spacing: 6){
                Image(imageString)
                    .foregroundColor(index == selectedIndex ? .white : .primary)
                if index == selectedIndex {
                    Text(title)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(index == selectedIndex ? Color("FurnitureColor") : Color.clear)
            .clipShape(Capsule())
            
        }
    }
}

struct SearchBar: View {
    @State var search = ""
    
    var body: some View {
        HStack(spacing: 14) {
            TextField("Search", text: $search)
            
            if self.search != "" {
                Button {
                    //
                } label: {
                    Image(systemName: "magnnifyingglass")
                        .foregroundColor(.primary)
                }

            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.primary.opacity(0.06))
        .cornerRadius(12)
    }
}

struct SingleTapView : View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomeTabView: View {
    var body : some View {
        ScrollView(.vertical, showsIndicators: false) {
            SearchBar()
            HStack {
                Text("Today's Pick")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
            }
            .padding(.top, 22)
            
            VStack {
                Image("main")
                Text("ArmChair")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, -30)
                    .padding(.bottom)
                
                Text("$1200")
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            .background(
                Color.primary.opacity(0.06)
                    .frame(width: UIScreen.main.bounds.size.width - 30)
                    .cornerRadius(25)
                    .padding(.top, 95)
            )
            .padding(.top, 25)
            
            HStack {
                Text("Recommended for you")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.bottom, 20)
            
            
            ForEach(furnitures, id: \.self){ furniture in
                HStack(spacing: 15){
                    ForEach(furniture){i in
                        VStack {
                            Image(i.image)
                            Text(i.title)
                                .fontWeight(.bold)
                            Text(i.price)
                                .padding(.top, 6)
                        }
                        .padding()
                        .background(Color.primary.opacity(0.06))
                        .cornerRadius(10)
                }
            }
            }
        }
        .padding()
    }
}
