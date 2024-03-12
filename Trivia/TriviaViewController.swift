import UIKit

class TriviaViewController: UIViewController {
    
    struct Question {
        var question: String
        var options: [String]
        var correctAnswerIndex: Int
    }
    
    var questions: [Question] = [
        Question(question: "What is the capital of France?", options: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0),
        Question(question: "'O' is which element?", options: ["Gold", "Oxygen", "Hydrogen", "Helium"], correctAnswerIndex: 1),
        Question(question: "Who wrote 'Hamlet'?", options: ["Charles Dickens", "J.K. Rowling", "Leo Tolstoy", "William Shakespeare"], correctAnswerIndex: 3)
    ]
    
    var currentQuestionIndex = 0

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        
        optionButton1.setTitle(currentQuestion.options[0], for: .normal)
        optionButton2.setTitle(currentQuestion.options[1], for: .normal)
        optionButton3.setTitle(currentQuestion.options[2], for: .normal)
        optionButton4.setTitle(currentQuestion.options[3], for: .normal)
    }
    
    @IBAction func option1Selected(_ sender: UIButton) {
        handleAnswerSelected(at: 0)
    }
    
    @IBAction func option2Selected(_ sender: UIButton) {
        handleAnswerSelected(at: 1)
    }
    
    @IBAction func option3Selected(_ sender: UIButton) {
        handleAnswerSelected(at: 2)
    }
    
    @IBAction func option4Selected(_ sender: UIButton) {
        handleAnswerSelected(at: 3)
    }
    
    func handleAnswerSelected(at index: Int) {
        let correctAnswerIndex = questions[currentQuestionIndex].correctAnswerIndex
        
        if index == correctAnswerIndex {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0 // Here you could navigate to a results screen or something similar.
        }
        
        updateUI()
    }
}
