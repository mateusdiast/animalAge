//
//  ViewController.swift
//  AnimalAge
//
//  Created by mateusdias on 14/11/23.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var pickerAnimalsSize: UIPickerView!
    
  
    var selectedValue: String = "Medium"
    let firstViewModel = FirstViewModel()
    @IBOutlet weak var dateSelected: UIDatePicker!
    
    var sizeOfAnimals: [AnimalSizeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerAnimalsSize.delegate = self
        pickerAnimalsSize.dataSource = self
        firstViewModel.delegate = self
        firstViewModel.sendSizesFromModel()
        pickerAnimalsSize.selectRow(1, inComponent: 0, animated: false)
    }

    @IBAction func sendDataBtn(_ sender: UIButton) {
        firstViewModel.validateDate(datePickerValue: dateSelected.date)
        firstViewModel.onLoadDatas(sizeSelected: selectedValue, datePickerValue: dateSelected.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondViewController = segue.destination as? SecondViewController,
           let animalAtributesModel = sender as? AnimalAtributesModel
        {
            secondViewController.image = animalAtributesModel.image
            secondViewController.sizeSelected = animalAtributesModel.sizeSelected
            secondViewController.yearsHuman = animalAtributesModel.years
        }
    }
    
}


extension FirstViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeOfAnimals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizeOfAnimals[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = sizeOfAnimals[row].rawValue
    }
}

extension FirstViewController: FirstViewModelDelegate {
    func goToResult(animalAtributesModel: AnimalAtributesModel) {
        performSegue(withIdentifier: "goToSecondView", sender: animalAtributesModel)

    }
    
    func alertDateInvalidate() {
        let alertDate = UIAlertController(title: "Error", message: "The animal must be at least one year old", preferredStyle: UIAlertController.Style.alert)
        alertDate.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertDate, animated: true, completion: nil)
    }
    
    func getSizeOfAnimal(sizes: [AnimalSizeModel]) {
        sizeOfAnimals = sizes
    }
    
}

