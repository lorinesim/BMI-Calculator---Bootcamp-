import UIKit

class CalculateViewController: UIViewController {
    
    //var bmiValue = "0.0"
    var caculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        let height = String(format:"%.2f" , sender.value)
        heightLabel.text = "\(height)m"
        
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        let weight = String(Int(sender.value))
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        /*let bmi = weight/pow(height,2)
        print(bmi)
 
        bmiValue = String(format:"%.2f",bmi) // %.2f = buradaki yüzdelikten sonra hangi rakamı verirsek virgülden sonra okadarını alır.
         */
        
        
       caculatorBrain.calculateBMI(height: height, weight: weight)
            
      // resultViewController a geçiş . burada self ile nereye bastığımızda geçişi sağlıyoruz. yani hangi sayfadan hangi sayfaya olduğunu .goToResult ise seguege ye verdiğimiz idtfiler.
       performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    //ResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToResult"{
            let destinationVc = segue.destination as! ResultViewController
            ////destinationVc.bmiValue = bmiValue
            
            //getBMIValue()=CalculatorBrain.Swift dosyasında tanımlı
            destinationVc.bmiValue = caculatorBrain.getBMIValue()
            
            //getAdvice() VE getColor() =CalculatorBrain.Swift dosyasında tanımlı
            destinationVc.advice = caculatorBrain.getAdvice()
            destinationVc.color  = caculatorBrain.getColor()
            
            
        }
    }
}

