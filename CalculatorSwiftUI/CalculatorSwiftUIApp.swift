import SwiftUI

@main
struct CalculatorSwiftUIApp: App {
    
    @State var calculatorInput: String = ""
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
        }
    }
}
