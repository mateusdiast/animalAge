//
//  FirstViewModel.swift
//  AnimalAge
//
//  Created by mateusdias on 14/11/23.
//

import Foundation

protocol FirstViewModelDelegate: AnyObject {
    func getSizeOfAnimal(sizes: [AnimalSizeModel])
    func alertDateInvalidate()
    func goToResult(animalAtributesModel: AnimalAtributesModel)
}

class FirstViewModel {
    weak var delegate: FirstViewModelDelegate?
    
    let sizesOfAnimal = AnimalSizeModel.allCases
    let date = Date()
    let calender = Calendar.current
    
    func onLoadDatas(sizeSelected: String, datePickerValue: Date){
        let ageComponent = calender.dateComponents([.year], from: datePickerValue, to: date)
        let years = ageComponent.year!
        var yearsHuman = Double(years)
        var image = ""
        let sizeOfAnimal = AnimalSizeModel(rawValue: sizeSelected)

    
        switch sizeOfAnimal {
        case .small:
            yearsHuman *= 6
            image = "smallAnimal"
            delegate?.goToResult(animalAtributesModel: .init(years: yearsHuman, sizeSelected: sizeSelected, image: image))
        case .medium:
            yearsHuman *= 7
            image = "mediumAnimal"
            delegate?.goToResult(animalAtributesModel: .init(years: yearsHuman, sizeSelected: sizeSelected, image: image))
        case .big:
            yearsHuman *= 7.5
            image = "bigAnimal"
            delegate?.goToResult(animalAtributesModel: .init(years: yearsHuman, sizeSelected: sizeSelected, image: image))
        case .none:
            break
      }
    }
    
    func validateDate(datePickerValue: Date){
        let ageComponent = calender.dateComponents([.year], from: datePickerValue, to: date)
        let years =  ageComponent.year!
        
        if years < 1 {
            delegate?.alertDateInvalidate()
        }
        
    }
    
    func sendSizesFromModel(){
        delegate?.getSizeOfAnimal(sizes: sizesOfAnimal)
    }
    
}
    

