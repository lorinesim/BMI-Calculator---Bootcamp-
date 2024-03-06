import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/pow(height,2)
        
        if bmiValue < 18.5 {
           bmi = BMI(value: bmiValue, advice: "zayıf", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "ideal", color: UIColor.purple)
            
        } else {
            bmi = BMI(value: bmiValue, advice: "kilolu", color: UIColor.red)
        }
      
        
    }
    
    //getBMIValue()
    func getBMIValue() -> String {
        let bmiValue1 = String(format:"%.2f",bmi?.value ?? 0.0)
        return bmiValue1
    }
    
    //getAdvice()
    func getAdvice() -> String {
        return bmi?.advice ?? "yanlış değer"
    }

    //getColor()
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor .white
    }
}
