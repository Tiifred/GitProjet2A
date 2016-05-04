//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

extension String {
    func matchPattern(patStr:String)->Bool {
        var isMatch:Bool = false
        do {
            let regex = try NSRegularExpression(pattern: patStr, options: [.CaseInsensitive])
            let result = regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, characters.count))
            
            if (result != nil)
            {
                isMatch = true
            }
        }
        catch {
            isMatch = false
        }
        return isMatch
    }
}



// main




let emailInput:String = "checkthisgmail.com"
if (emailInput.matchPattern("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$")==true)
{
    print("this is e-mail!")
}

let test:String = "Maxime"
if(test.matchPattern("Maxime")==true){
    print("OK")
}
else{
    print("No")
}
