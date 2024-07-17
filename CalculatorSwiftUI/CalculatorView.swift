import SwiftUI

struct CalculatorView: View {
    
    @State private var isHidden: Bool = false
    @ObservedObject var calculator = CalculatorModel()
    @State private var deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation
    
    private var landscapeButtonsColor = Color.init(red: 0.14, green: 0.14, blue: 0.14)
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.ignoresSafeArea()
            
            VStack (spacing: 0) {
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(calculator.display)
                            .foregroundColor(.white)
                            .font(.system(size: 55))
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 32)
                       
                    }
                }
                .padding(.top, 16)
                
                VStack {
                    
                    HStack {
                        
                        if deviceOrientation.isLandscape {
                            CalculatorButtonComponent(title: "(", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: ")", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "mc", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "m+", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "m-", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "mr", backgroundColor: landscapeButtonsColor)
                        }
                        
                        CalculatorButtonComponent(title: "AC", backgroundColor: Color.gray, action: { self.calculator.clear() })
                        Spacer()
                        CalculatorButtonComponent(title: "+/-", backgroundColor: Color.gray, action: { self.calculator.inputNumber("+/-") })
                        Spacer()
                        CalculatorButtonComponent(title: "%", backgroundColor: Color.gray, action: { self.calculator.inputOperation(.percent) })
                        Spacer()
                        CalculatorButtonComponent(title: "÷", backgroundColor: .orange, action: { self.calculator.inputOperation(.division) })
                    }
                    
                    HStack {
                        
                        if deviceOrientation.isLandscape {
                            CalculatorButtonComponent(title: "2nd", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "x2", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "x3", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "xy", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "ex", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "10x", backgroundColor: landscapeButtonsColor)
                        }
                        
                        CalculatorButtonComponent(title: "7", action: { self.calculator.inputNumber("7") })
                        Spacer()
                        CalculatorButtonComponent(title: "8", action: { self.calculator.inputNumber("8") })
                        Spacer()
                        CalculatorButtonComponent(title: "9", action: { self.calculator.inputNumber("9") })
                        Spacer()
                        CalculatorButtonComponent(title: "x", backgroundColor: .orange, action: { self.calculator.inputOperation(.multiplication) })
                    }
                    HStack {
                        
                        if deviceOrientation.isLandscape {
                            CalculatorButtonComponent(title: "1/x", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "2√x", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "3√x", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "y√x", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "ln", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "log", backgroundColor: landscapeButtonsColor)
                        }
                        
                        CalculatorButtonComponent(title: "4", action: { self.calculator.inputNumber("4") })
                        Spacer()
                        CalculatorButtonComponent(title: "5", action: { self.calculator.inputNumber("5") })
                        Spacer()
                        CalculatorButtonComponent(title: "6", action: { self.calculator.inputNumber("6") })
                        Spacer()
                        CalculatorButtonComponent(title: "-", backgroundColor: .orange, action: { self.calculator.inputOperation(.subtraction) })
                    }
                    
                    HStack {
                        
                        if deviceOrientation.isLandscape {
                            CalculatorButtonComponent(title: "x!", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "sin", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "cos", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "tan", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "e", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "EE", backgroundColor: landscapeButtonsColor)
                        }
                        
                        CalculatorButtonComponent(title: "1", action: { self.calculator.inputNumber("1") })
                        Spacer()
                        CalculatorButtonComponent(title: "2", action: { self.calculator.inputNumber("2") })
                        Spacer()
                        CalculatorButtonComponent(title: "3", action: { self.calculator.inputNumber("3") })
                        Spacer()
                        CalculatorButtonComponent(title: "+", backgroundColor: .orange, action: { self.calculator.inputOperation(.addition) })
                    }
                    
                    HStack {
                        
                        if deviceOrientation.isLandscape {
                            CalculatorButtonComponent(title: "Rad", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "sinh", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "cosh", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "tanh", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "π", backgroundColor: landscapeButtonsColor)
                            Spacer()
                            CalculatorButtonComponent(title: "Rand", backgroundColor: landscapeButtonsColor)
                        }
                        
                        CalculatorButtonComponent(title: "0", action: { self.calculator.inputNumber("0") })
                        Spacer()
                        CalculatorButtonComponent(title: "0", action: { self.calculator.inputNumber("0") })
                        Spacer()
                        CalculatorButtonComponent(title: ",", action: { self.calculator.inputNumber(".")})
                        Spacer()
                        CalculatorButtonComponent(title: "=", backgroundColor: .orange, action: self.calculator.inputEquals)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                self.deviceOrientation = UIDevice.current.orientation
            }
        }
    }
}

// MARK: - Button Component

struct CalculatorButtonComponent: View {
    // Step 2: Add customizable properties
    var title: String
    var backgroundColor = Color.init(red: 0.25, green: 0.25, blue: 0.25)
    var maxWidth: CGFloat = 75
    var minWidth: CGFloat = 60
    var action = {}
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: maxWidth, maxHeight: 75)
                .frame(minWidth: minWidth, minHeight: 50)
                .aspectRatio(contentMode: .fill)
        }
        .buttonStyle(CalculatorButtonStyle(backgroundColor: backgroundColor))
    }
}

struct CalculatorButtonStyle: ButtonStyle {
    
    var backgroundColor: Color
    var foregroundColor: Color {
        if self.backgroundColor == Color.gray {
            return Color.black
        } else {
            return Color.white
        }
    }
    var cornerRadius: CGFloat = 50
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? backgroundColor.opacity(0.5) : backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .font(.system(size: 20))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    CalculatorView()
}
