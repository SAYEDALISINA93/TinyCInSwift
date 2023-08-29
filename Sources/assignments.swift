extension TinyParser{    
    
    /// Handling the entire Assignment validation process.
    /// Returns: an integer value.
    ///     0: does not match,
    ///     1: syntax error, program should stop
    ///     2: all assignments are correct move to next
    public func assignments()->Int
    {
        for _ in currentIndex...tokens.count
        {
            switch checkAssignment() {
            case 0:
                return 0
            case 1:
                continue
            case 2:
                return 1
            case 3:
                return 2
            default:
                return 0
            }
        }
        
        return 0
    }
    
    /// This method has the responsiblity to check each assignment condition.
    /// - Returns: An Integer value:
    ///     0: does not match,
    ///     1: matched,
    ///     2: syntax error
    ///     3: continue checking others
    public func checkAssignment() -> Int {
        if identifier(){
            let idfIndex = currentIndex - 1
            
            if arrayRef(){
                if match(.symbol, value: "="){
                    if expression(){
                        if match(.symbol, value: ";"){
                            // return true
                            numberOfAssignments += 1
                            return 1
                        }else{
                            return 2
                        }
                    }
                }
            }else{
                if match(.symbol, value: "="){
                    let beIdnx = currentIndex
                    if expression(){
                        
                        if (currentIndex - beIdnx) == 1{
                            assignedValueList[tokens[idfIndex].value] = tokens[currentIndex - 1].value
                        }else{
                            var combData: [Any] = []
                            var result = 0
                            var operation = ""
                            
                            for a in beIdnx...(currentIndex - 1){
                                if (tokens[a].value == "+"){
                                    operation = "+"
                                    continue
                                }
                                if (tokens[a].value == "-"){
                                    operation = "-"
                                    continue
                                }
                                if (tokens[a].value == "*"){
                                    operation = "*"
                                    continue
                                }
                                if (tokens[a].value == "/"){
                                    operation = "/"
                                    continue
                                }
                                combData.append(tokens[a].value)
                                assignedValueList[tokens[idfIndex].value] = combData
                            }
                            
                            // overflow checker in here
                            for item in combData
                            {
                                let value = item as? String ?? ""
                                if value.isInt{
                                    if operation == "+"
                                    {
                                        result = result + (Int(value) ?? 0)
                                        if isInt16Overflowed(result){
                                            print("Error: 16bit Interger overflow occured!!!")
                                            return 2
                                        }
                                    }else if operation == "-"{
                                        result = result - (Int(value) ?? 0)
                                    }else if operation == "*"{
                                        if result == 0{
                                            result = result + (Int(value) ?? 0)
                                        }else{
                                            result = result * (Int(value) ?? 0)
                                        }
                                    }else if operation == "/"{
                                        if result == 0{
                                            result = result + (Int(value) ?? 0)
                                        }else{
                                            result = result / (Int(value) ?? 0)
                                        }
                                    }else{
                                        
                                        if match(.symbol, value: ";"){
                                            // return true
                                            numberOfAssignments += 1
                                            return 1
                                        }
                                        
                                        print("Unknow operation type!!!", currentIndex)
                                        return 2
                                    }
                                }else{
                                    let assignedValue = Int(assignedValueList[value] as? String ?? "")
                                    if operation == "+"
                                    {
                                        result = result + (assignedValue ?? 0)
                                        if isInt16Overflowed(result){
                                            print("Error: 16bit Interger overflow occured!!!")
                                            return 2
                                        }
                                    }else if operation == "-"{
                                        result = result - (assignedValue ?? 0)
                                    }else if operation == "*"{
                                        
                                    }else if operation == "/"{
                                        
                                    }else{
                                        
                                        if match(.symbol, value: ";"){
                                            // return true
                                            numberOfAssignments += 1
                                            return 1
                                        }
                                        
                                        print("Unknow operation type!!!")
                                        return 2
                                    }
                                    // result = result + assignedValue
                                }
                            }
                        }
                        
                        if match(.symbol, value: ";"){
                            // return true
                            numberOfAssignments += 1
                            return 1
                        }else{
                            return 2
                        }
                    }else{
                        print("Unknown Expression!!!")
                    }
                    
                }
            }
        }else{
            // it dose not match the syntax of Assignment
            if numberOfAssignments > 0{
                numberOfAssignments = 0
                return 3
            }else{
                return 0
            }
        }
        return 2
    }
    
    /// To parse indetifiers
    /// - Returns: The Result in Boolean.
    ///             True, is identifier.
    ///             False, is not identifier.
    public func identifier() -> Bool {
        return match(.identifier)
    }
    
    /// This method is checking the overflow in Int16 bits.
    /// - Parameter value: Your integer value
    /// - Returns: The result of will be in Bool. True, is overflowed. False, is not overflowed.
    func isInt16Overflowed(_ value: Int) -> Bool {
        return value > 65535 || value < -65535
    }
}

extension String {
    /// Add a feature in String Class of Swift Language to handle if String has interger value.
    var isInt: Bool {
        return Int(self) != nil
    }
}
