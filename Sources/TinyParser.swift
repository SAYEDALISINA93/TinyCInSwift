import Darwin
import Foundation

public class TinyParser{
    
    public let tokens: [TinyToken]
    public var declaredValaraibles: [String] = []
    public var assignedValueList: [String: Any] = [:]
    public var currentIndex: Int = 0
    public var errorDic : [String : String] = [:]
    var numberOfAssignments = 0
    
    public init(tokens: [TinyToken]){
        self.tokens = tokens
    }
    
    /// This is the entry point of the program to handle parsing.
    /// - Returns: boolean value as parsed or not.
    ///     True is parsed and everything is correct.
    ///     False is not parser there is an issue.
    public func parse()-> Bool{
        
        if mainFunctionHeader(){
            if mainBlock(){
                return true
            }
        }else{
            currentIndex = 0
            if functions(){
                if mainFunctionHeader(){
                    if mainBlock(){
                        return true
                    }
                    else
                    {
                        print("Error in main block!!!")
                        return false
                    }
                }else{
                    print("Program does not have main function!!!")
                    return false
                }
            }else{
                return false
            }
        }
        
        return false
    }
    
    /// Handle header area of main function
    /// - Returns: Boolean value. Ture is correct. False is not correct.
    public func mainFunctionHeader()->Bool{
        return match(.keyword, value: "int") &&
        match(.identifier, value: "main") &&
        match(.symbol, value: "(") &&
        match(.symbol, value: ")")
    }
    
    /// handle the block of main method.
    /// - Returns: a boolean value. True shows it is correct. False shows is not correct.
    public func mainBlock()->Bool{
        
        if match(.symbol, value: "{")
        {
            if (declarations() == 3)
            {
                if statements()
                {
                    if returnStatement() {
                        if (match(.symbol, value: "}")){
                            return true
                        }else{
                            print("Missing the last '}' at Main Function!!!")
                            return false
                        }
                        
                    }else{
//                        print("There is no return statement for Main Function!!!", currentIndex)
                        return false
                    }
                }else{
                    print("Main statements error")
                }
                
                return false
                
            }else{
                print("Problem in declarations")
                return false;
            }
        }
        else{
            return false
        }
        
    }
    
    /// Checking the statements
    /// - Returns: Boolean value. Ture is correct. False is not correct.
    public func statements() -> Bool {
        
        for _ in currentIndex...(tokens.count - 1)
        {
            switch statement() {
            case 0:
                continue
            case 1:
                return true
            case 2:
                return false
            default:
                continue
            }
        }
        
        return true
    }
    
    /// Checking statement structure
    /// - Returns: an integer value
    /// 0: okay jump to next
    /// 1: everyting is correct stop program
    /// 2: syntax error stop program
    public func statement() -> Int {
        
        if match(.symbol, value: ";")
        {
            return 0
        }
        
        switch assignments(){
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            switch ifStatement(){
            case 0:
                print("")
            case 1:
                print("")
            case 2:
                return 2
            default:
                break
            }
            
            if whileStatement(){
            }else{
//                print("While statement parsing failed!!!")
            }
            
            if arrayStatement(){
            }else{
//                print("While statement parsing failed!!!")
            }
            
            return 1
        default:
            return 1
        }
    }
    

    /// Checks if statement match with grammar or not.
    /// - Returns: integer value
    ///  0: does not match,
    ///  1: matched,
    ///  2: syntax error
    public func ifStatement() -> Int {
        if match(.keyword, value: "if") {
            
            if match(.symbol, value: "(")
                && expression()
                && match(.symbol, value: ")")
                && match(.symbol, value: "{") {
                
                if ifStatementChecker() {
                    if match(.keyword, value: "else") {
                        if match(.symbol, value: "{") {
                            if ifStatementChecker() {
                                return 1
                            } else {
                                print("There is an issue with parsing the statement of ELSE")
                                return 2
                            }
                        } else {
                            print("There is no '}' for else")
                            return 1
                        }
                    } else {
                        if match(.symbol, value: "}") {
                            
                            if match(.keyword, value: "else") {
                                if match(.symbol, value: "{") {
                                    if ifStatementChecker() {
//                                        print("ifStatementChecker() for else block returned true")
                                        if match(.symbol, value: "}"){
                                            return 1
                                        }else{
                                            print("Missing '}' for else")
                                        }
                                    } else {
                                        print("There is an issue with parsing the statement of ELSE")
                                        return 2
                                    }
                                } else {
                                    print("There is no '}' for else")
                                    return 1
                                }
                            }else{
                                print("Noting Matched !!!")
                            }
                            return 1
                        } else {
                            print("Missing '}' in If Statement")
                        }
                    }
                } else {
                    print("There is an issue in statements of IF")
                    return 2
                }
            } else {
                print("There is an issue with syntax of IF")
                return 2
            }
        } else {
            return 0
        }
        
        // This return 1 is also unreachable
        return 1
    }
    
    /// Checks if statement match with grammar or not.
    /// - Returns: Integer value,
    ///     0: does not match,
    ///     1: matched,
    ///     2: syntax error
    public func ifStatementChecker()->Bool{
        switch assignments(){
        case 0:
            return false
        case 1:
            return false
        case 2:
            switch ifStatement(){
            case 0:
                print("")
            case 1:
                return true
            case 2:
                return false
            default:
                break
            }
            
            if whileStatement(){
                return true
            }
            
            if arrayStatement(){
                return true
            }
            
            return true
        default:
            return true
        }
    }
    
    /// Checking while in input program
    /// - Returns: boolean value. True, means matched. False, means it does not matched.
    public func whileStatement() -> Bool {
        return  match(.keyword, value: "while")
        && match(.symbol, value: "(")
        && expression()
        && match(.symbol, value: ")")
        && match(.symbol, value: "{")
        && (statement() == 1)
        && match(.symbol, value: "}")
    }
    
    /// Checking array statement in input program
    /// - Returns: boolean value. True, means matched. False, means it does not matched.
    public func arrayStatement() -> Bool {
        return arrayTarget()
        && match(.symbol, value: "[")
        && expression()
        && match(.symbol, value: "]")
        && match(.symbol, value: "=")
        && expression()
        && match(.symbol, value: ";")
    }
    
    /// chekcing the definition of array
    /// - Returns: boolean value. True, means matched. False, means it does not matched.
    public func arrayTarget() -> Bool {
        return identifier()
    }
    
    /// checking ther reference of array in here
    /// - Returns: boolean value. True, means matched. False, means it does not matched.
    public func arrayRef() -> Bool {
        return match(.symbol, value: "[")
        && expression()
        && match(.symbol, value: "]")
    }
    
    /// checking the return statement in here.
    /// - Returns: boolean value. True, means matched. False, means it does not matched.
    public func returnStatement() -> Bool {
        return match(.keyword, value: "return")
        && (expression() || true) && match(.symbol, value: ";")
    }
    
    /// Increase the current index value by one.
    public func advance() {
        if currentIndex < tokens.count{
            currentIndex += 1
        }
    }
    
    /// Handle matching of tokens value and types.
    /// - Parameters:
    ///   - expectedType: The Type of token as TinyTokenType
    ///   - value: the value it should check
    /// - Returns: Returns: boolean value. True, means matched. False, means it does not matched.
    public func match(_ expectedType: TinyTokenType, value: String? = nil) -> Bool {
        if currentIndex < tokens.count {
            let token = tokens[currentIndex]
            if token.type == expectedType {
                if let v = value {
                    if token.value == v {
                        advance()
                        return true
                    }
                } else {
                    
                    if token.type == .identifier{
                        if !declaredValaraibles.contains(token.value){
                            declaredValaraibles.append(token.value)
                        }
                    }
                    
                    advance()
                    return true
                }
            }
        }
        return false
    }
}
