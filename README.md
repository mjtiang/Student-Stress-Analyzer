Student Stress Analyzer
A native iOS application that analyzes student lifestyle parameters—such as study habits, sleep, and social media usage—to evaluate and predict overall stress levels in real time. The project combines machine learning predictive modeling in Python with a clean SwiftUI user experience.
 Project Overview
	•	Platform: iOS 17.0+
	•	Frameworks: SwiftUI, CoreML
	•	Machine Learning Pipeline: Python, Scikit-Learn (Random Forest Classifier), coremltools
	•	Key Features:
	◦	Interactive questionnaire measuring key student metrics.
	◦	Real-time, on-device prediction of stress severity (Low, Moderate, High).
	◦	Visualization of key indicators and feature correlations.
	◦	Privacy-first approach running inference entirely on-device without external server calls.
 System Architecture & Machine Learning Model
The machine learning model was developed and evaluated using a balanced student dataset in Google Colab before being deployed directly into the iOS environment via Apple's CoreML framework.
1. Data Processing & Model Training
	•	Model Architecture: Random Forest Classifier trained using Scikit-Learn.
	•	Evaluated Features:
	◦	Daily Study Hours
	◦	Average Sleep Duration
	◦	Social Media Usage
	◦	Academic Performance Metrics
	•	Performance Evaluation: Achieved robust accuracy across validation sets, confirmed through multi-class confusion matrix testing.
2. CoreML Conversion
Using Python's coremltools library, the trained model was converted into .mlmodel format, optimizing it for low latency and zero network reliance during on-device execution in SwiftUI.
[ Raw Data ] ──> [ Scikit-Learn Training ] ──> [ coremltools Conversion ] ──> [ CoreML Package ] ──> [ SwiftUI App Engine ]
📁 Repository Structure
Student-Stress-Analyzer/
├── iOS/                             # Xcode SwiftUI Application
│   ├── studentStressAnalysis/       # Swift Source Files & Views
│   └── studentStressAnalysis.xcodeproj
├── Model/                           # Machine Learning Pipeline
│   ├── studentStressAnalysis.ipynb  # Google Colab / Jupyter Notebook
│   ├── dataset.csv                  # Training dataset
│   └── StressAnalyzer.mlmodel       # Converted CoreML Model File
└── README.md                        # Documentation
🚀 Getting Started & Setup
Prerequisites
	•	Xcode 15.0 or higher
	•	iOS Simulator or Physical Device running iOS 17+
	•	Python 3.9+ (Optional, if you wish to re-train or inspect the notebook)
Running the App
	1	Clone this repository: git clone https://github.com/mjtiang/Student-Stress-Analyzer.git
	2	
	3	Navigate to the iOS/ folder and open studentStressAnalysis.xcodeproj in Xcode.
	4	Select an iOS Simulator target (e.g., iPhone 15/17) and press Cmd + R to build and run.
🧑‍💻 Author & Contact
	•	Developer: Matt Julian Tiang
	•	Role: iOS & Machine Learning Developer
	•	GitHub: @mjtiang
