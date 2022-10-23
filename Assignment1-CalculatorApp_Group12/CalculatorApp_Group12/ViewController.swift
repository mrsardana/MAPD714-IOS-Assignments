//  Assignment 3 - Calculator App - Part 3 – Additional Functions
//  Group No 12
//  Author's name and StudentID:
//  1. Deepak Sardana
//  Student ID: 301289249
//  2. Khawaja Talha Haseeb
//  Student ID: 301274473
//  3. Muhammad Bilal Dilbar Hussain
//  Student ID: 301205152
//  App description: This is third part. Using Xcode, the latest version of iOS SDK and the Swift programming language, we created a simple calculator app. In this part, we enabled our app to include additional functions (π, e, RND, x!) by supporting Landscape Orientation for the Calculator App that we built in Assignment 1 & 2.
//  Last Updated 23 October, 2022
//  Xcode Version : Version 14.0.1 (14A400)


import UIKit

    class ViewController: UIViewController {
        var lhs: Float = 0.0
        var rhs: Float = 0.0
        var expression: String = ""
        var expressionLandscape: String = ""
        var distance = 0
        var lhs_location = 0
        var lhs_value:String = ""
        var rhs_location = 0
        var rhs_value:String = ""
        var char = ""
        var lhs_value_int: Float = 0
        var rhs_value_int: Float = 0
        var expression_result: Float = 0
        var replace_expression_result = ""
        var old_expression = ""
        var count_divide = 0
        
        var distance_plus = 0
        var distance_minus = 0
        var two_operators = ""
        var factorial = 1
        var factorial_1 = 0
        
        var counter = 0
        
        //Result Label 
        @IBOutlet weak var ResultLabel: UILabel!
        @IBOutlet weak var expressionLabel: UILabel!
        
        // Result Label Landscape
        @IBOutlet weak var LandscapeResultLabel: UILabel!
        @IBOutlet weak var LandscapeExpressionLabel: UILabel!
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            
        }
        
        
        // Event Handlers for landscape operator buttons
        @IBAction func LandscapeOperatorButtonPressed(_ sender: UIButton) {
            let operatorButton: String = String(sender.titleLabel!.text!)
            expressionLandscape = expressionLandscape + operatorButton
            print(expressionLandscape)
            
            LandscapeExpressionLabel.text = expressionLandscape
            if operatorButton == "=" {
                
                //for Division
                count_divide = expressionLandscape.filter({ $0 == "/" }).count
                
                if expressionLandscape.contains("/") == true {
                    
                    for _ in 1...count_divide{
                        if expressionLandscape.contains("/") == true {
                            
                            
                            if let index = expressionLandscape.firstIndex(of: "/") {
                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                // distance is 2
                            }
                            //                print(distance)
                            lhs_location = distance - 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                    if lhs_location >= 0{
                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                        print("char:", char)
                                        lhs_value = char + lhs_value
                                        print("lhs_value: ", lhs_value)
                                        lhs_location = lhs_location - 1
                                    } else {
                                        break
                                    }
                                    print("lhs_location: ", lhs_location)
                                } else {
                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                        lhs_value = String(lhs_value.dropFirst())
                                    }
                                    break
                                }
                            }
                            print("lhs_value:", lhs_value)
                            char = ""
                            rhs_location = distance + 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                    //                        print(char)
                                    rhs_value = rhs_value + char
                                    rhs_location = rhs_location + 1
                                } else {
                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                        rhs_value = String(rhs_value.dropLast())
                                    }
                                    break
                                }
                            }
                            print("rhs_value:", rhs_value)
                            
                            old_expression = lhs_value + "/" + rhs_value
                            
                            print("old_expression: ", old_expression)
                            
                            
                            
                            lhs_value_int = (lhs_value as NSString).floatValue
                            rhs_value_int = (rhs_value as NSString).floatValue
                            
                            
                            expression_result = lhs_value_int / rhs_value_int
                            
                            print("expression_result: ", expression_result)
                            
                            replace_expression_result = String(expression_result)
                            
                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                            
                            print("expressionLandscape: ", expressionLandscape)
                            
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                        }
                    }
                }
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                
                
                
                
                //for multiplication
                count_divide = expressionLandscape.filter({ $0 == "*" }).count
                
                if expressionLandscape.contains("*") == true {
                    for _ in 1...count_divide{
                        if expressionLandscape.contains("*") == true {
                            
                            
                            if let index = expressionLandscape.firstIndex(of: "*") {
                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                // distance is 2
                            }
                            //                print(distance)
                            lhs_location = distance - 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                    if lhs_location >= 0{
                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                        print("char:", char)
                                        lhs_value = char + lhs_value
                                        print("lhs_value: ", lhs_value)
                                        lhs_location = lhs_location - 1
                                    } else {
                                        break
                                    }
                                    print("lhs_location: ", lhs_location)
                                } else {
                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                        lhs_value = String(lhs_value.dropFirst())
                                    }
                                    break
                                }
                            }
                            print("lhs_value:", lhs_value)
                            char = ""
                            rhs_location = distance + 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                    //                        print(char)
                                    rhs_value = rhs_value + char
                                    rhs_location = rhs_location + 1
                                } else {
                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                        rhs_value = String(rhs_value.dropLast())
                                    }
                                    break
                                }
                            }
                            print("rhs_value:", rhs_value)
                            
                            old_expression = lhs_value + "*" + rhs_value
                            
                            print("old_expression: ", old_expression)
                            
                            
                            
                            lhs_value_int = (lhs_value as NSString).floatValue
                            rhs_value_int = (rhs_value as NSString).floatValue
                            
                            
                            expression_result = lhs_value_int * rhs_value_int
                            
                            print("expression_result: ", expression_result)
                            
                            replace_expression_result = String(expression_result)
                            
                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                            
                            print("expressionLandscape: ", expressionLandscape)
                            
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                        }
                    }
                }
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                
                
                
                
                
                //for addition
                counter = expressionLandscape.filter({ $0 == "+" }).count + expressionLandscape.filter({ $0 == "-" }).count
                
                print("counter: ", counter)
                for _ in 0...counter{
                    
                    if expressionLandscape.contains("+") == true || expressionLandscape.contains("-") == true {
                        print("Hello")
                        if let index_plus = expressionLandscape.firstIndex(of: "+") {
                            distance_plus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_plus)
                            // distance is 2
                        }
                        if let index_minus = expressionLandscape.firstIndex(of: "-") {
                            distance_minus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_minus)
                            // distance is 2
                        }
                        
                        if distance_minus == distance_plus && distance_plus > 0 && distance_minus > 0 {
                            distance_plus = 0
                            distance_minus = 0
                        }
                        
                        if distance_minus == 0 && distance_plus == 0 && expressionLandscape.filter({ $0 == "+" }).count == 0 && expressionLandscape.filter({ $0 == "-" }).count > 0 {
                            distance_plus = 1
                            distance_minus = 0
                            
                        }
                        if expressionLandscape.last == "=" && expressionLandscape.first == "-" && expressionLandscape.contains("+") == false && expressionLandscape.contains("/") == false && expressionLandscape.contains("*") == false && expressionLandscape.filter({ $0 == "-" }).count == 1 {
                            break
                        }
                        
                        print("distance_minus: ", distance_minus)
                        print("distance_plus: ", distance_plus)
                        
                        if distance_plus < distance_minus {
                            
                            
                            
                            
                                    if expressionLandscape.contains("+") == true {
                                        
                                        
                                        if let index = expressionLandscape.firstIndex(of: "+") {
                                            distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "+" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int + rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expressionLandscape: ", expressionLandscape)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                  
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                    
                            if expressionLandscape.contains("-") == true {
                                
                                
                                if let index = expressionLandscape.firstIndex(of: "-") {
                                    distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                    // distance is 2
                                }
                                //                print(distance)
                                lhs_location = distance - 1
                                
                                
                                for _ in 0...15{
                                    if char != "/" && char != "*" && char != "+" && char != "-" {
                                        if lhs_location >= 0{
                                            char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                            print("char:", char)
                                            lhs_value = char + lhs_value
                                            print("lhs_value: ", lhs_value)
                                            lhs_location = lhs_location - 1
                                        } else {
                                            break
                                        }
                                        print("lhs_location: ", lhs_location)
                                    } else {
                                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                            lhs_value = String(lhs_value.dropFirst())
                                        }
                                        break
                                    }
                                }
                                print("lhs_value:", lhs_value)
                                
                                print("nil_lhs_value:", lhs_value)
                                char = ""
                                rhs_location = distance + 1
                                
                                
                                for _ in 0...15{
                                    if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                        //                        print(char)
                                        rhs_value = rhs_value + char
                                        rhs_location = rhs_location + 1
                                    } else {
                                        if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                            rhs_value = String(rhs_value.dropLast())
                                        }
                                        break
                                    }
                                }
                                print("rhs_value:", rhs_value)
                                
                                old_expression = lhs_value + "-" + rhs_value
                                
                                print("old_expression: ", old_expression)
                                
                                
                                
                                lhs_value_int = (lhs_value as NSString).floatValue
                                rhs_value_int = (rhs_value as NSString).floatValue
                                
                                
                                expression_result = lhs_value_int - rhs_value_int
                                
                                print("expression_result: ", expression_result)
                                
                                replace_expression_result = String(expression_result)
                                
                                expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                
                                print("expressionLandscape: ", expressionLandscape)
                                
                                
                                distance = 0
                                lhs_location = 0
                                lhs_value = ""
                                rhs_location = 0
                                rhs_value = ""
                                char = ""
                                lhs_value_int = 0
                                rhs_value_int = 0
                                expression_result = 0
                                replace_expression_result = ""
                                old_expression = ""
                                distance_plus = 0
                                distance_minus = 0
                            }
                    
                    distance = 0
                    lhs_location = 0
                    lhs_value = ""
                    rhs_location = 0
                    rhs_value = ""
                    char = ""
                    lhs_value_int = 0
                    rhs_value_int = 0
                    expression_result = 0
                    replace_expression_result = ""
                    old_expression = ""
                    distance_plus = 0
                    distance_minus = 0

                            
                        }
                        if distance_minus == 0 {
                            
                            if expressionLandscape.contains("+") == true {
                                
                                
                                //logic for - in start
                                if expressionLandscape.first == "-" {
                                    expressionLandscape = String(expressionLandscape.dropFirst())
                                    
                                    print("expressionLandscape", expressionLandscape)
                                    print("expressionLandscape", expressionLandscape)
                                    print("expressionLandscape", expressionLandscape)
                                    print("expressionLandscape", expressionLandscape)
                                    print("expressionLandscape", expressionLandscape)
                                    
                                    
                                    if let index_plus = expressionLandscape.firstIndex(of: "+") {
                                        distance_plus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_plus)
                                        // distance is 2
                                    }
                                    if let index_minus = expressionLandscape.firstIndex(of: "-") {
                                        distance_minus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_minus)
                                        // distance is 2
                                    }
                                    
                                    if distance_plus < distance_minus {
                                        
                                        if expressionLandscape.contains("+") == true {
                                            
                                            
                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expressionLandscape: ", expressionLandscape)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        
                                        
                                        
                                    }
                                    
                                    if distance_minus == 0 {
                                        
                                        if expressionLandscape.contains("+") == true {
                                            
                                            
                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expressionLandscape: ", expressionLandscape)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        
                                    }
                                    if distance_plus == 0 {
                                        
                                        if expressionLandscape.contains("-") == true {
                                            
                                            
                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            
                                            print("nil_lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "-" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expressionLandscape: ", expressionLandscape)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            distance_plus = 0
                                            distance_minus = 0
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        
                                        
                                    }
                                    
                                    if distance_minus < distance_plus {
                                        
                                        if expressionLandscape.contains("-") == true {
                                            
                                            
                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            print("line number 744")
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            
                                            print("nil_lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "-" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expressionLandscape: ", expressionLandscape)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            distance_plus = 0
                                            distance_minus = 0
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                //end of if for - in start logic
                                
                                
                                if distance_minus == 0 {
                                    
                                    if expressionLandscape.contains("+") == true {
                                        
                                        
                                        //logic for - in start
                                        if expressionLandscape.first == "-" {
                                            expressionLandscape = String(expressionLandscape.dropFirst())
                                            
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            
                                            
                                            if let index_plus = expressionLandscape.firstIndex(of: "+") {
                                                distance_plus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_plus)
                                                // distance is 2
                                            }
                                            if let index_minus = expressionLandscape.firstIndex(of: "-") {
                                                distance_minus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_minus)
                                                // distance is 2
                                            }
                                            
                                            if distance_plus < distance_minus {
                                                
                                                        if expressionLandscape.contains("+") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                      
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                        

                                                
                                            }
                                            
                                            if distance_minus == 0 {
                                                
                                                        if expressionLandscape.contains("+") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                  
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                
                                            }
                                            if distance_plus == 0{
                                                
                                                        if expressionLandscape.contains("-") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }
                                            
                                            if distance_minus < distance_plus {
                                                
                                                        if expressionLandscape.contains("-") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }

                                            
                                            
                                        }
                                        //end of if for - in start logic
                                    }
                                    
                                    
                                    if distance_minus == 0 {
                                        
                                        if expressionLandscape.contains("+") == true {
                                            
                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            print("distance_minus == 0: True")
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = lhs_value_int + rhs_value_int
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expressionLandscape: ", expressionLandscape)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                        }
                                    }
                                    
                                }
                                
                                distance = 0
                                lhs_location = 0
                                lhs_value = ""
                                rhs_location = 0
                                rhs_value = ""
                                char = ""
                                lhs_value_int = 0
                                rhs_value_int = 0
                                expression_result = 0
                                replace_expression_result = ""
                                old_expression = ""
                                
                            }
                        }
                        if distance_plus == 0{
                            
                                    if expressionLandscape.contains("-") == true {
                                        
                                        
                                        if let index = expressionLandscape.firstIndex(of: "-") {
                                            distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        
                                        print("nil_lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "-" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int - rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expressionLandscape: ", expressionLandscape)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0

                            
                            
                        }
                        if distance_minus < distance_plus {
                            
                                    if expressionLandscape.contains("-") == true {
                                        
                                        
                                        if let index = expressionLandscape.firstIndex(of: "-") {
                                            distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        
                                        print("nil_lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "-" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int - rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expressionLandscape: ", expressionLandscape)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        //logic for - in start
                                        if expressionLandscape.first == "-" {
                                            expressionLandscape = String(expressionLandscape.dropFirst())
                                            
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            print("expressionLandscape", expressionLandscape)
                                            
                                            
                                            if let index_plus = expressionLandscape.firstIndex(of: "+") {
                                                distance_plus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_plus)
                                                // distance is 2
                                            }
                                            if let index_minus = expressionLandscape.firstIndex(of: "-") {
                                                distance_minus = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index_minus)
                                                // distance is 2
                                            }
                                            
                                            if distance_plus < distance_minus {
                                                
                                                        if expressionLandscape.contains("+") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                      
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                        

                                                
                                            }
                                            
                                            if distance_minus == 0 {
                                                
                                                        if expressionLandscape.contains("+") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "+") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                  
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                
                                            }
                                            if distance_plus == 0{
                                                
                                                        if expressionLandscape.contains("-") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }
                                            
                                            if distance_minus < distance_plus {
                                                
                                                        if expressionLandscape.contains("-") == true {
                                                            
                                                            
                                                            if let index = expressionLandscape.firstIndex(of: "-") {
                                                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expressionLandscape: ", expressionLandscape)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }

                                            
                                            
                                        }
                                        //end of if for - in start logic
                                        
                                 
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                            
                        }
                        
                    }
                }
                
                        if expressionLandscape.contains("=") {
                            expressionLandscape = String(expressionLandscape.dropLast())
                            LandscapeResultLabel.text = expressionLandscape
                            var r = LandscapeExpressionLabel.text
                            r = String(r!.dropLast())
                            LandscapeExpressionLabel.text = r
                        } else {
                            LandscapeResultLabel.text = expressionLandscape
                        }
                
            
                if expressionLandscape.count > 1 {
                    let startIndex = expressionLandscape.index(expressionLandscape.startIndex, offsetBy: expressionLandscape.count-2)
                    let endIndex = expressionLandscape.index(expressionLandscape.startIndex, offsetBy: expressionLandscape.count-1)
                    two_operators = String(expressionLandscape[startIndex...endIndex])     // "Strin"
                }
                
                
                if two_operators == ".0" {
                    old_expression = ".0"
                    replace_expression_result = ""
                    expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                    two_operators = ""
                    LandscapeResultLabel.text = expressionLandscape
                }
                
            }
            
            
            // % logic
            
            if operatorButton == "%" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
                if let index = expressionLandscape.firstIndex(of: "%") {
                    distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                old_expression = lhs_value + "%"
                
                print("old_expression: ", old_expression)
                
                
                
                lhs_value_int = (lhs_value as NSString).floatValue
                
                
                expression_result = (lhs_value_int / 100)
                
                print("expression_result: ", expression_result)
                
                replace_expression_result = String(expression_result)
                
                expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expressionLandscape: ", expressionLandscape)
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
            // +/- logic
            if operatorButton == "+/-" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
//                expressionLandscape = expressionLandscape.replacingOccurrences(of: "+/-", with: "")
                
                
                expressionLandscape = expressionLandscape.replacingOccurrences(of: "+/-", with: "q")
                
                if let index = expressionLandscape.firstIndex(of: "q") {
                    distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" {
                            
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                
                old_expression = lhs_value + "q"
                
                print("old_expression: ", old_expression)
                
                
             
                
                if lhs_value.first == "-" {
                    lhs_value = String(lhs_value.dropFirst())
                    lhs_value = "+" + lhs_value
                } else {
                    
                    if lhs_value.contains("-") == false && lhs_value.contains("+") == false {
                        lhs_value = "-" + lhs_value
                    } else {
                        lhs_value = String(lhs_value.dropFirst())
                        lhs_value = "-" + lhs_value
                    }
                  
                }
                
         
                
                replace_expression_result = lhs_value
                
                expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expressionLandscape: ", expressionLandscape)
                
                LandscapeExpressionLabel.text = expressionLandscape
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
            
            
            // π logic
            
            if operatorButton == "π" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
                if let index = expressionLandscape.firstIndex(of: "π") {
                    distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                old_expression = lhs_value + "π"
                
                print("old_expression: ", old_expression)
                
                
                
                lhs_value_int = (lhs_value as NSString).floatValue
                
                if lhs_value == "" {
                    expression_result = (1 * 3.14159265359)
                } else {
                    expression_result = (lhs_value_int * 3.14159265359)
                }
           
                
                print("expression_result: ", expression_result)
                
                replace_expression_result = String(expression_result)
                
                expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expressionLandscape: ", expressionLandscape)
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
            
            // e logic
            
            if operatorButton == "e" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
                if let index = expressionLandscape.firstIndex(of: "e") {
                    distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                old_expression = lhs_value + "e"
                
                print("old_expression: ", old_expression)
                
                
                
                lhs_value_int = (lhs_value as NSString).floatValue
                
                if lhs_value == "" {
                    expression_result = (1 * 2.71828182846)
                } else {
                    expression_result = (lhs_value_int * 2.71828182846)
                }
           
                
                print("expression_result: ", expression_result)
                
                replace_expression_result = String(expression_result)
                
                expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expressionLandscape: ", expressionLandscape)
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
            
            // x! "factorial" logic
                        
                        if operatorButton == "x!" {
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                            factorial = 0
              
                            
                            
                            if let index = expressionLandscape.firstIndex(of: "x") {
                                distance = expressionLandscape.distance(from: expressionLandscape.startIndex, to: index)
                                // distance is 2
                            }
                            //                print(distance)
                            lhs_location = distance - 1
                            
                            expressionLandscape = String(expressionLandscape.dropLast())
                            expressionLandscape = String(expressionLandscape.dropLast())
                            
                            expressionLandscape = expressionLandscape + "!"
                            LandscapeExpressionLabel.text = expressionLandscape
                            
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                    if lhs_location >= 0{
                                        char = String(expressionLandscape[expressionLandscape.index(expressionLandscape.startIndex, offsetBy: lhs_location)])
                                        print("char:", char)
                                        lhs_value = char + lhs_value
                                        print("lhs_value: ", lhs_value)
                                        lhs_location = lhs_location - 1
                                    } else {
                                        break
                                    }
                                    print("lhs_location: ", lhs_location)
                                } else {
                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                        lhs_value = String(lhs_value.dropFirst())
                                    }
                                    break
                                }
                            }
                            print("lhs_value:", lhs_value)
                            
                            
                            old_expression = lhs_value + "!"
                            
                            print("old_expression: ", old_expression)
                            
                            
                            
                            lhs_value_int = (lhs_value as NSString).floatValue
                            
                            if lhs_value == "" || lhs_value == "0" || lhs_value == "1" {
                                expression_result = 1
                            } else {
                                for i in 2...Int(lhs_value)! {
                                    if i == 2 {
                                        factorial = Int(lhs_value)! * (Int(lhs_value)! - 1)
                                        factorial_1 = Int(lhs_value)! - 2
                                    } else {
                                        factorial = factorial * factorial_1
                                        factorial_1 = factorial_1 - 1
                                    }
                                }
                                expression_result = Float(factorial)
                            }
                       
                            
                            print("expression_result: ", expression_result)
                            
                            replace_expression_result = String(expression_result)
                            
                            expressionLandscape = expressionLandscape.replacingOccurrences(of: old_expression, with: replace_expression_result)
                            
                            print("expressionLandscape: ", expressionLandscape)
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                        }
            
            
            
            // RND logic
                        
                        if operatorButton == "RND" {
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                            factorial = 0
              
                            
                            
                            expressionLandscape = String(expressionLandscape.dropLast())
                            expressionLandscape = String(expressionLandscape.dropLast())
                            expressionLandscape = String(expressionLandscape.dropLast())
                            
           
                            LandscapeExpressionLabel.text = expressionLandscape
                            
                            expression_result = Float(CGFloat.random(in: 0...1))
                            
                            replace_expression_result = String(expression_result)
                            
                            expressionLandscape = expressionLandscape + replace_expression_result
                            
                            LandscapeExpressionLabel.text = expressionLandscape
                        
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                        }
            
            
        }
        
        
        
        
        //Potrait Buttons Logic
        // Event Handlers
        //2+2*3/2-5
        //+-*/
        @IBAction func OperatorButton_Pressed(_ sender: UIButton)
        {
            let operatorButton: String = String(sender.titleLabel!.text!)
            expression = expression + operatorButton
            print(expression)
            
            expressionLabel.text = expression
            if operatorButton == "=" {
                
                //for Division
                count_divide = expression.filter({ $0 == "/" }).count
                
                if expression.contains("/") == true {
                    
                    for _ in 1...count_divide{
                        if expression.contains("/") == true {
                            
                            
                            if let index = expression.firstIndex(of: "/") {
                                distance = expression.distance(from: expression.startIndex, to: index)
                                // distance is 2
                            }
                            //                print(distance)
                            lhs_location = distance - 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                    if lhs_location >= 0{
                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                        print("char:", char)
                                        lhs_value = char + lhs_value
                                        print("lhs_value: ", lhs_value)
                                        lhs_location = lhs_location - 1
                                    } else {
                                        break
                                    }
                                    print("lhs_location: ", lhs_location)
                                } else {
                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                        lhs_value = String(lhs_value.dropFirst())
                                    }
                                    break
                                }
                            }
                            print("lhs_value:", lhs_value)
                            char = ""
                            rhs_location = distance + 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                    //                        print(char)
                                    rhs_value = rhs_value + char
                                    rhs_location = rhs_location + 1
                                } else {
                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                        rhs_value = String(rhs_value.dropLast())
                                    }
                                    break
                                }
                            }
                            print("rhs_value:", rhs_value)
                            
                            old_expression = lhs_value + "/" + rhs_value
                            
                            print("old_expression: ", old_expression)
                            
                            
                            
                            lhs_value_int = (lhs_value as NSString).floatValue
                            rhs_value_int = (rhs_value as NSString).floatValue
                            
                            
                            expression_result = lhs_value_int / rhs_value_int
                            
                            print("expression_result: ", expression_result)
                            
                            replace_expression_result = String(expression_result)
                            
                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                            
                            print("expression: ", expression)
                            
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                        }
                    }
                }
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                
                
                
                
                //for multiplication
                count_divide = expression.filter({ $0 == "*" }).count
                
                if expression.contains("*") == true {
                    for _ in 1...count_divide{
                        if expression.contains("*") == true {
                            
                            
                            if let index = expression.firstIndex(of: "*") {
                                distance = expression.distance(from: expression.startIndex, to: index)
                                // distance is 2
                            }
                            //                print(distance)
                            lhs_location = distance - 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                    if lhs_location >= 0{
                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                        print("char:", char)
                                        lhs_value = char + lhs_value
                                        print("lhs_value: ", lhs_value)
                                        lhs_location = lhs_location - 1
                                    } else {
                                        break
                                    }
                                    print("lhs_location: ", lhs_location)
                                } else {
                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                        lhs_value = String(lhs_value.dropFirst())
                                    }
                                    break
                                }
                            }
                            print("lhs_value:", lhs_value)
                            char = ""
                            rhs_location = distance + 1
                            
                            
                            for _ in 0...15{
                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                    //                        print(char)
                                    rhs_value = rhs_value + char
                                    rhs_location = rhs_location + 1
                                } else {
                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                        rhs_value = String(rhs_value.dropLast())
                                    }
                                    break
                                }
                            }
                            print("rhs_value:", rhs_value)
                            
                            old_expression = lhs_value + "*" + rhs_value
                            
                            print("old_expression: ", old_expression)
                            
                            
                            
                            lhs_value_int = (lhs_value as NSString).floatValue
                            rhs_value_int = (rhs_value as NSString).floatValue
                            
                            
                            expression_result = lhs_value_int * rhs_value_int
                            
                            print("expression_result: ", expression_result)
                            
                            replace_expression_result = String(expression_result)
                            
                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                            
                            print("expression: ", expression)
                            
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                        }
                    }
                }
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                
                
                
                
                
                //for addition
                counter = expression.filter({ $0 == "+" }).count + expression.filter({ $0 == "-" }).count
                
                print("counter: ", counter)
                for _ in 0...counter{
                    
                    if expression.contains("+") == true || expression.contains("-") == true {
                        print("Hello")
                        if let index_plus = expression.firstIndex(of: "+") {
                            distance_plus = expression.distance(from: expression.startIndex, to: index_plus)
                            // distance is 2
                        }
                        if let index_minus = expression.firstIndex(of: "-") {
                            distance_minus = expression.distance(from: expression.startIndex, to: index_minus)
                            // distance is 2
                        }
                        
                        if distance_minus == distance_plus && distance_plus > 0 && distance_minus > 0 {
                            distance_plus = 0
                            distance_minus = 0
                        }
                        
                        if distance_minus == 0 && distance_plus == 0 && expression.filter({ $0 == "+" }).count == 0 && expression.filter({ $0 == "-" }).count > 0 {
                            distance_plus = 1
                            distance_minus = 0
                            
                        }
                        if expression.last == "=" && expression.first == "-" && expression.contains("+") == false && expression.contains("/") == false && expression.contains("*") == false && expression.filter({ $0 == "-" }).count == 1 {
                            break
                        }
                        
                        print("distance_minus: ", distance_minus)
                        print("distance_plus: ", distance_plus)
                        
                        if distance_plus < distance_minus {
                            
                            
                            
                            
                                    if expression.contains("+") == true {
                                        
                                        
                                        if let index = expression.firstIndex(of: "+") {
                                            distance = expression.distance(from: expression.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "+" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int + rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expression: ", expression)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                  
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                    
                            if expression.contains("-") == true {
                                
                                
                                if let index = expression.firstIndex(of: "-") {
                                    distance = expression.distance(from: expression.startIndex, to: index)
                                    // distance is 2
                                }
                                //                print(distance)
                                lhs_location = distance - 1
                                
                                
                                for _ in 0...15{
                                    if char != "/" && char != "*" && char != "+" && char != "-" {
                                        if lhs_location >= 0{
                                            char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                            print("char:", char)
                                            lhs_value = char + lhs_value
                                            print("lhs_value: ", lhs_value)
                                            lhs_location = lhs_location - 1
                                        } else {
                                            break
                                        }
                                        print("lhs_location: ", lhs_location)
                                    } else {
                                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                            lhs_value = String(lhs_value.dropFirst())
                                        }
                                        break
                                    }
                                }
                                print("lhs_value:", lhs_value)
                                
                                print("nil_lhs_value:", lhs_value)
                                char = ""
                                rhs_location = distance + 1
                                
                                
                                for _ in 0...15{
                                    if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                        char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                        //                        print(char)
                                        rhs_value = rhs_value + char
                                        rhs_location = rhs_location + 1
                                    } else {
                                        if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                            rhs_value = String(rhs_value.dropLast())
                                        }
                                        break
                                    }
                                }
                                print("rhs_value:", rhs_value)
                                
                                old_expression = lhs_value + "-" + rhs_value
                                
                                print("old_expression: ", old_expression)
                                
                                
                                
                                lhs_value_int = (lhs_value as NSString).floatValue
                                rhs_value_int = (rhs_value as NSString).floatValue
                                
                                
                                expression_result = lhs_value_int - rhs_value_int
                                
                                print("expression_result: ", expression_result)
                                
                                replace_expression_result = String(expression_result)
                                
                                expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                
                                print("expression: ", expression)
                                
                                
                                distance = 0
                                lhs_location = 0
                                lhs_value = ""
                                rhs_location = 0
                                rhs_value = ""
                                char = ""
                                lhs_value_int = 0
                                rhs_value_int = 0
                                expression_result = 0
                                replace_expression_result = ""
                                old_expression = ""
                                distance_plus = 0
                                distance_minus = 0
                            }
                    
                    distance = 0
                    lhs_location = 0
                    lhs_value = ""
                    rhs_location = 0
                    rhs_value = ""
                    char = ""
                    lhs_value_int = 0
                    rhs_value_int = 0
                    expression_result = 0
                    replace_expression_result = ""
                    old_expression = ""
                    distance_plus = 0
                    distance_minus = 0

                            
                        }
                        if distance_minus == 0 {
                            
                            if expression.contains("+") == true {
                                
                                
                                //logic for - in start
                                if expression.first == "-" {
                                    expression = String(expression.dropFirst())
                                    
                                    print("expression", expression)
                                    print("expression", expression)
                                    print("expression", expression)
                                    print("expression", expression)
                                    print("expression", expression)
                                    
                                    
                                    if let index_plus = expression.firstIndex(of: "+") {
                                        distance_plus = expression.distance(from: expression.startIndex, to: index_plus)
                                        // distance is 2
                                    }
                                    if let index_minus = expression.firstIndex(of: "-") {
                                        distance_minus = expression.distance(from: expression.startIndex, to: index_minus)
                                        // distance is 2
                                    }
                                    
                                    if distance_plus < distance_minus {
                                        
                                        if expression.contains("+") == true {
                                            
                                            
                                            if let index = expression.firstIndex(of: "+") {
                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expression: ", expression)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        
                                        
                                        
                                    }
                                    
                                    if distance_minus == 0 {
                                        
                                        if expression.contains("+") == true {
                                            
                                            
                                            if let index = expression.firstIndex(of: "+") {
                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expression: ", expression)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        
                                    }
                                    if distance_plus == 0 {
                                        
                                        if expression.contains("-") == true {
                                            
                                            
                                            if let index = expression.firstIndex(of: "-") {
                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            
                                            print("nil_lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "-" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expression: ", expression)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            distance_plus = 0
                                            distance_minus = 0
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        
                                        
                                    }
                                    
                                    if distance_minus < distance_plus {
                                        
                                        if expression.contains("-") == true {
                                            
                                            
                                            if let index = expression.firstIndex(of: "-") {
                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            print("line number 744")
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            
                                            print("nil_lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "-" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expression: ", expression)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                            distance_plus = 0
                                            distance_minus = 0
                                        }
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                //end of if for - in start logic
                                
                                
                                if distance_minus == 0 {
                                    
                                    if expression.contains("+") == true {
                                        
                                        
                                        //logic for - in start
                                        if expression.first == "-" {
                                            expression = String(expression.dropFirst())
                                            
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            
                                            
                                            if let index_plus = expression.firstIndex(of: "+") {
                                                distance_plus = expression.distance(from: expression.startIndex, to: index_plus)
                                                // distance is 2
                                            }
                                            if let index_minus = expression.firstIndex(of: "-") {
                                                distance_minus = expression.distance(from: expression.startIndex, to: index_minus)
                                                // distance is 2
                                            }
                                            
                                            if distance_plus < distance_minus {
                                                
                                                        if expression.contains("+") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "+") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                      
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                        

                                                
                                            }
                                            
                                            if distance_minus == 0 {
                                                
                                                        if expression.contains("+") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "+") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                  
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                
                                            }
                                            if distance_plus == 0{
                                                
                                                        if expression.contains("-") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "-") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }
                                            
                                            if distance_minus < distance_plus {
                                                
                                                        if expression.contains("-") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "-") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }

                                            
                                            
                                        }
                                        //end of if for - in start logic
                                    }
                                    
                                    
                                    if distance_minus == 0 {
                                        
                                        if expression.contains("+") == true {
                                            
                                            if let index = expression.firstIndex(of: "+") {
                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                // distance is 2
                                            }
                                            //                print(distance)
                                            lhs_location = distance - 1
                                            
                                            print("distance_minus == 0: True")
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                    if lhs_location >= 0{
                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                        print("char:", char)
                                                        lhs_value = char + lhs_value
                                                        print("lhs_value: ", lhs_value)
                                                        lhs_location = lhs_location - 1
                                                    } else {
                                                        break
                                                    }
                                                    print("lhs_location: ", lhs_location)
                                                } else {
                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                        lhs_value = String(lhs_value.dropFirst())
                                                    }
                                                    break
                                                }
                                            }
                                            print("lhs_value:", lhs_value)
                                            char = ""
                                            rhs_location = distance + 1
                                            
                                            
                                            for _ in 0...15{
                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                    //                        print(char)
                                                    rhs_value = rhs_value + char
                                                    rhs_location = rhs_location + 1
                                                } else {
                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                        rhs_value = String(rhs_value.dropLast())
                                                    }
                                                    break
                                                }
                                            }
                                            print("rhs_value:", rhs_value)
                                            
                                            old_expression = lhs_value + "+" + rhs_value
                                            
                                            print("old_expression: ", old_expression)
                                            
                                            
                                            
                                            lhs_value_int = (lhs_value as NSString).floatValue
                                            rhs_value_int = (rhs_value as NSString).floatValue
                                            
                                            
                                            expression_result = lhs_value_int + rhs_value_int
                                            
                                            print("expression_result: ", expression_result)
                                            
                                            replace_expression_result = String(expression_result)
                                            
                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                            
                                            print("expression: ", expression)
                                            
                                            
                                            distance = 0
                                            lhs_location = 0
                                            lhs_value = ""
                                            rhs_location = 0
                                            rhs_value = ""
                                            char = ""
                                            lhs_value_int = 0
                                            rhs_value_int = 0
                                            expression_result = 0
                                            replace_expression_result = ""
                                            old_expression = ""
                                        }
                                    }
                                    
                                }
                                
                                distance = 0
                                lhs_location = 0
                                lhs_value = ""
                                rhs_location = 0
                                rhs_value = ""
                                char = ""
                                lhs_value_int = 0
                                rhs_value_int = 0
                                expression_result = 0
                                replace_expression_result = ""
                                old_expression = ""
                                
                            }
                        }
                        if distance_plus == 0{
                            
                                    if expression.contains("-") == true {
                                        
                                        
                                        if let index = expression.firstIndex(of: "-") {
                                            distance = expression.distance(from: expression.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        
                                        print("nil_lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "-" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int - rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expression: ", expression)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0

                            
                            
                        }
                        if distance_minus < distance_plus {
                            
                                    if expression.contains("-") == true {
                                        
                                        
                                        if let index = expression.firstIndex(of: "-") {
                                            distance = expression.distance(from: expression.startIndex, to: index)
                                            // distance is 2
                                        }
                                        //                print(distance)
                                        lhs_location = distance - 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" {
                                                if lhs_location >= 0{
                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                    print("char:", char)
                                                    lhs_value = char + lhs_value
                                                    print("lhs_value: ", lhs_value)
                                                    lhs_location = lhs_location - 1
                                                } else {
                                                    break
                                                }
                                                print("lhs_location: ", lhs_location)
                                            } else {
                                                if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                    lhs_value = String(lhs_value.dropFirst())
                                                }
                                                break
                                            }
                                        }
                                        print("lhs_value:", lhs_value)
                                        
                                        print("nil_lhs_value:", lhs_value)
                                        char = ""
                                        rhs_location = distance + 1
                                        
                                        
                                        for _ in 0...15{
                                            if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                //                        print(char)
                                                rhs_value = rhs_value + char
                                                rhs_location = rhs_location + 1
                                            } else {
                                                if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                    rhs_value = String(rhs_value.dropLast())
                                                }
                                                break
                                            }
                                        }
                                        print("rhs_value:", rhs_value)
                                        
                                        old_expression = lhs_value + "-" + rhs_value
                                        
                                        print("old_expression: ", old_expression)
                                        
                                        
                                        
                                        
                                        lhs_value_int = (lhs_value as NSString).floatValue
                                        rhs_value_int = (rhs_value as NSString).floatValue
                                        
                                        
                                        expression_result = lhs_value_int - rhs_value_int
                                        
                                        print("expression_result: ", expression_result)
                                        
                                        replace_expression_result = String(expression_result)
                                        
                                        expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                        
                                        print("expression: ", expression)
                                        
                                        
                                        distance = 0
                                        lhs_location = 0
                                        lhs_value = ""
                                        rhs_location = 0
                                        rhs_value = ""
                                        char = ""
                                        lhs_value_int = 0
                                        rhs_value_int = 0
                                        expression_result = 0
                                        replace_expression_result = ""
                                        old_expression = ""
                                        distance_plus = 0
                                        distance_minus = 0
                                        
                                        //logic for - in start
                                        if expression.first == "-" {
                                            expression = String(expression.dropFirst())
                                            
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            print("expression", expression)
                                            
                                            
                                            if let index_plus = expression.firstIndex(of: "+") {
                                                distance_plus = expression.distance(from: expression.startIndex, to: index_plus)
                                                // distance is 2
                                            }
                                            if let index_minus = expression.firstIndex(of: "-") {
                                                distance_minus = expression.distance(from: expression.startIndex, to: index_minus)
                                                // distance is 2
                                            }
                                            
                                            if distance_plus < distance_minus {
                                                
                                                        if expression.contains("+") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "+") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                      
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                        

                                                
                                            }
                                            
                                            if distance_minus == 0 {
                                                
                                                        if expression.contains("+") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "+") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "+" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int + rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                  
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                
                                            }
                                            if distance_plus == 0{
                                                
                                                        if expression.contains("-") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "-") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }
                                            
                                            if distance_minus < distance_plus {
                                                
                                                        if expression.contains("-") == true {
                                                            
                                                            
                                                            if let index = expression.firstIndex(of: "-") {
                                                                distance = expression.distance(from: expression.startIndex, to: index)
                                                                // distance is 2
                                                            }
                                                            //                print(distance)
                                                            lhs_location = distance - 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" {
                                                                    if lhs_location >= 0{
                                                                        char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                                                                        print("char:", char)
                                                                        lhs_value = char + lhs_value
                                                                        print("lhs_value: ", lhs_value)
                                                                        lhs_location = lhs_location - 1
                                                                    } else {
                                                                        break
                                                                    }
                                                                    print("lhs_location: ", lhs_location)
                                                                } else {
                                                                    if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                                                                        lhs_value = String(lhs_value.dropFirst())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("lhs_value:", lhs_value)
                                                            
                                                            print("nil_lhs_value:", lhs_value)
                                                            char = ""
                                                            rhs_location = distance + 1
                                                            
                                                            
                                                            for _ in 0...15{
                                                                if char != "/" && char != "*" && char != "+" && char != "-" && char != "=" {
                                                                    char = String(expression[expression.index(expression.startIndex, offsetBy: rhs_location)])
                                                                    //                        print(char)
                                                                    rhs_value = rhs_value + char
                                                                    rhs_location = rhs_location + 1
                                                                } else {
                                                                    if rhs_value.last == "/" || rhs_value.last == "*" || rhs_value.last == "+" || rhs_value.last == "-" || rhs_value.last == "=" {
                                                                        rhs_value = String(rhs_value.dropLast())
                                                                    }
                                                                    break
                                                                }
                                                            }
                                                            print("rhs_value:", rhs_value)
                                                            
                                                            old_expression = lhs_value + "-" + rhs_value
                                                            
                                                            print("old_expression: ", old_expression)
                                                            
                                                            
                                                            
                                                            lhs_value_int = (lhs_value as NSString).floatValue
                                                            rhs_value_int = (rhs_value as NSString).floatValue
                                                            
                                                            
                                                            expression_result = (0 - lhs_value_int - rhs_value_int)
                                                            
                                                            print("expression_result: ", expression_result)
                                                            
                                                            replace_expression_result = String(expression_result)
                                                            
                                                            expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                                                            
                                                            print("expression: ", expression)
                                                            
                                                            
                                                            distance = 0
                                                            lhs_location = 0
                                                            lhs_value = ""
                                                            rhs_location = 0
                                                            rhs_value = ""
                                                            char = ""
                                                            lhs_value_int = 0
                                                            rhs_value_int = 0
                                                            expression_result = 0
                                                            replace_expression_result = ""
                                                            old_expression = ""
                                                            distance_plus = 0
                                                            distance_minus = 0
                                                        }
                                                
                                                distance = 0
                                                lhs_location = 0
                                                lhs_value = ""
                                                rhs_location = 0
                                                rhs_value = ""
                                                char = ""
                                                lhs_value_int = 0
                                                rhs_value_int = 0
                                                expression_result = 0
                                                replace_expression_result = ""
                                                old_expression = ""
                                                distance_plus = 0
                                                distance_minus = 0

                                                
                                                
                                            }

                                            
                                            
                                        }
                                        //end of if for - in start logic
                                        
                                 
                                    }
                            
                            distance = 0
                            lhs_location = 0
                            lhs_value = ""
                            rhs_location = 0
                            rhs_value = ""
                            char = ""
                            lhs_value_int = 0
                            rhs_value_int = 0
                            expression_result = 0
                            replace_expression_result = ""
                            old_expression = ""
                            distance_plus = 0
                            distance_minus = 0
                            
                        }
                        
                    }
                }
                
                        if expression.contains("=") {
                            expression = String(expression.dropLast())
                            ResultLabel.text = expression
                            var r = expressionLabel.text
                            r = String(r!.dropLast())
                            expressionLabel.text = r
                        } else {
                            ResultLabel.text = expression
                        }
                
            
                if expression.count > 1 {
                    let startIndex = expression.index(expression.startIndex, offsetBy: expression.count-2)
                    let endIndex = expression.index(expression.startIndex, offsetBy: expression.count-1)
                    two_operators = String(expression[startIndex...endIndex])     // "Strin"
                }
                
                
                if two_operators == ".0" {
                    old_expression = ".0"
                    replace_expression_result = ""
                    expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                    two_operators = ""
                    ResultLabel.text = expression
                }
                
            }
            
            
            // % logic
            
            if operatorButton == "%" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
                if let index = expression.firstIndex(of: "%") {
                    distance = expression.distance(from: expression.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" || lhs_value.first == "+" || lhs_value.first == "-" {
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                old_expression = lhs_value + "%"
                
                print("old_expression: ", old_expression)
                
                
                
                lhs_value_int = (lhs_value as NSString).floatValue
                
                
                expression_result = (lhs_value_int / 100)
                
                print("expression_result: ", expression_result)
                
                replace_expression_result = String(expression_result)
                
                expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expression: ", expression)
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
            // +/- logic
            if operatorButton == "+/-" {
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
                
                
//                expression = expression.replacingOccurrences(of: "+/-", with: "")
                
                
                expression = expression.replacingOccurrences(of: "+/-", with: "q")
                
                if let index = expression.firstIndex(of: "q") {
                    distance = expression.distance(from: expression.startIndex, to: index)
                    // distance is 2
                }
                //                print(distance)
                lhs_location = distance - 1
                
                
                for _ in 0...15{
                    if char != "/" && char != "*" && char != "+" && char != "-" {
                        if lhs_location >= 0{
                            char = String(expression[expression.index(expression.startIndex, offsetBy: lhs_location)])
                            print("char:", char)
                            lhs_value = char + lhs_value
                            print("lhs_value: ", lhs_value)
                            lhs_location = lhs_location - 1
                        } else {
                            break
                        }
                        print("lhs_location: ", lhs_location)
                    } else {
                        if lhs_value.first == "/" || lhs_value.first == "*" {
                            
                            lhs_value = String(lhs_value.dropFirst())
                        }
                        break
                    }
                }
                print("lhs_value:", lhs_value)
                
                
                
                old_expression = lhs_value + "q"
                
                print("old_expression: ", old_expression)
                
                
             
                
                if lhs_value.first == "-" {
                    lhs_value = String(lhs_value.dropFirst())
                    lhs_value = "+" + lhs_value
                } else {
                    
                    if lhs_value.contains("-") == false && lhs_value.contains("+") == false {
                        lhs_value = "-" + lhs_value
                    } else {
                        lhs_value = String(lhs_value.dropFirst())
                        lhs_value = "-" + lhs_value
                    }
                  
                }
                
         
                
                replace_expression_result = lhs_value
                
                expression = expression.replacingOccurrences(of: old_expression, with: replace_expression_result)
                
                print("expression: ", expression)
                
                expressionLabel.text = expression
                
                distance = 0
                lhs_location = 0
                lhs_value = ""
                rhs_location = 0
                rhs_value = ""
                char = ""
                lhs_value_int = 0
                rhs_value_int = 0
                expression_result = 0
                replace_expression_result = ""
                old_expression = ""
                distance_plus = 0
                distance_minus = 0
            }
            
        }
        
        
        // Landscape NumberButton_Pressed:
        @IBAction func LandscapeNumberButton_Pressed(_ sender: UIButton)
        {
            let num: String = String(sender.titleLabel!.text!)
            expressionLandscape = expressionLandscape + num
            print(expressionLandscape)
            LandscapeExpressionLabel.text = expressionLandscape
        }
        
        // NumberButton_Pressed: 123456789
        @IBAction func NumberButton_Pressed(_ sender: UIButton)
        {
            let num: String = String(sender.titleLabel!.text!)
            expression = expression + num
            print(expression)
            expressionLabel.text = expression
        }
     
        
        // Landscape ExtraButton_Pressed: c <-
        @IBAction func LandscapeClearButton_Pressed(_ sender: UIButton) {
            let extraButton: String = String(sender.titleLabel!.text!)
            if extraButton == "AC"{
                expressionLandscape="0"
                
                print(expressionLandscape)
                expressionLandscape = ""
                LandscapeResultLabel.text = "0"
                LandscapeExpressionLabel.text = "0"
            } else {
                expressionLandscape = String(expressionLandscape.dropLast())
                print(expressionLandscape)
                LandscapeExpressionLabel.text = expressionLandscape
                if expressionLandscape == "" {
                    LandscapeExpressionLabel.text = "0"
                }
            }
        }
        
    // ExtraButton_Pressed: c <-
    @IBAction func ClearButton_Pressed(_ sender: UIButton)
    {
        let extraButton: String = String(sender.titleLabel!.text!)
        if extraButton == "AC"{
            expression="0"
            
            print(expression)
            expression = ""
            ResultLabel.text = "0"
            expressionLabel.text = "0"
        } else {
            expression = String(expression.dropLast())
            print(expression)
            expressionLabel.text = expression
            if expression == "" {
                expressionLabel.text = "0"
            }
        }
    }
}
