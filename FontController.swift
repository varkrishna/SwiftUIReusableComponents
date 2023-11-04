import SwiftUI

struct FontController: View {
    @Binding var size: Int
    var max: Int?
    
    @State private var textTransition: AnyTransition = AnyTransition.push(from: .bottom)
    
    var body: some View {
        HStack {
            Button(action: {
                textTransition = AnyTransition.push(from: .top)
                withAnimation {
                    size = Swift.max(1, size - 1)
                }
            }, label: {
                Image(systemName: "minus")
            })
            
            HStack(spacing: 0) {
                ForEach(size.asStringArray, id: \.self) { digit in
                    Text(digit)
                        .font(.system(.title, design: .rounded))
                        .transition(textTransition)
                }
            }
            
            Button(action: {
                textTransition = AnyTransition.push(from: .bottom)
                withAnimation {
                    if let m = max {
                        size = min(size + 1, m)
                    } else {
                        size = size + 1
                    }
                }
            }, label: {
                Image(systemName: "plus")
            })
        }
        .padding(.vertical , 2)
        .padding(.horizontal , 5)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
    }
}

#Preview {
    FontController(size: .constant(14))
}
