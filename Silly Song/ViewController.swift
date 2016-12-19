//
//  ViewController.swift
//  Silly Song
//
//  Created by Cole Hoffman on 12/18/16.
//  Copyright © 2016 Cody Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            let name = nameField.text
            lyricsView.text = nameToSong(fullName: name!)
        } else {
            let errorMessage = "Error: please enter a name"
            lyricsView.text = errorMessage
        }
    }
}

func shortNameFromName(name: String) -> String{
    let lowercaseName = name.lowercased()
    
    var name = lowercaseName
    
    for character in lowercaseName.characters {
        switch character {
        case "a","e","i","o","u":
            return name
        case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
            name = name.replacingOccurrences(of: String(character), with: "")
        default:
            break
        }
    }
    return name
}

func nameToSong(fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let fullName  = fullName
    
    let song = [
        "\(fullName), \(fullName), Bo B\(shortName)",
        "Banana Fana Fo F\(shortName)",
        "Me My Mo M\(shortName)",
        "\(fullName)"].joined(separator: "\n")
    
    return song
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

