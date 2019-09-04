//
//  ViewController.swift
//  AlcoolGasolina
//
//  Created by aluno on 03/09/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        if let precoAlcool = precoAlcoolCampo.text, let precoGasolina = precoGasolinaCampo.text {
                //validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if validaCampos{
                    //calcular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                }else{
                    resultadoLegenda.text =  "Digite os preços para calcular."
                }
            }
        }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        
        //converte valores texto par numeros
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
                /* Faz o cálculo (precoAlcool / precoGasolina)
                 Se resultado >= 0.7 melhor usar Gasolina
                 senão melhor usar Álcool
                */
                let resultadopreco = valorAlcool / valorGasolina
                if resultadopreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina"
                }else{
                    self.resultadoLegenda.text = "Melhor utilizar Álcool"
                }
            }
        }
        
    }
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        var camposValidados = true
        if precoAlcool.isEmpty{
            camposValidados = false
        }else if precoGasolina.isEmpty{
            camposValidados = false
        }
        return camposValidados
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

