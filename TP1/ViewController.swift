//
//  ViewController.swift
//  TP1
//
//  Created by Mathias on 19/03/2021.
//  Copyright © 2021 Mathias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  v1 = "";
    var  op = "";
    var  v2 = "";
    var opPresent = false;
    
    @IBOutlet weak var Texte: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func pushChiffre( chiffre:String){
        if(opPresent){
            v2 = v2 + chiffre;
        } else {
            v1 = v1 + chiffre;
        }
        print("Pushed \(chiffre)");
        updateLabel();
    }
    func updateLabel(){
        setLabelText(param : "\(v1)\(op)\(v2)");
    }
    func setLabelText(param : String){
        print("Label: \(param)");
        Texte.text = param
        print(Texte.text!)
    }
    func reinitialiser(){
        v1 = "";
        op = "";
        v2 = "";
        opPresent = false;
        setLabelText(param: "")
    }
    func calculer(){
        if(v1.isEmpty || v2.isEmpty || op.isEmpty){
            return
        }
        var v1int = Int(v1)!;
        var v2int = Int(v2)!;
        var resultat = 0;
        switch op {
            case "+":
                resultat = v1int + v2int;
            case "x":
                resultat = v1int * v2int;
            case "/":
                resultat = v1int / v2int;
            case "-":
                resultat = v1int - v2int;
            default:
                fatalError("Unsupported")
        }
        print("valiny \(resultat)")
        reinitialiser();
        v1 = String(resultat);
        updateLabel();
    }
    func pushValider(){
        print("Valider");
        calculer();
    }
    func pushSigne( signe:String){
        if( !opPresent ){
            print("noOp");
            op = signe;
            opPresent = true;
        } else {
            if(v2 == ""){
                op = signe;
            } else {
                print("misyOp");
                calculer();
                op = signe;
            }
            opPresent = true;
        }
        print("Pushed \(signe)");
        updateLabel();
    }
    @IBAction func buttonClicked(sender: UIButton){
        let label = sender.titleLabel!.text
        switch(label){
            case "0","1","2","3","4","5","6","7","8","9":
                self.pushChiffre(chiffre: label!)
            case "x","/","+","-":
                self.pushSigne(signe: label!)
            case "c":
                reinitialiser()
            case "Valider":
                print("Dans valider")
                pushValider()
            default:
                ""
        }
    }
}

