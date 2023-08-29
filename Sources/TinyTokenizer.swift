import Darwin
import Foundation

public let keywords = [ "int", "char", "float", "bool", "if", "else", "while", "return", "true", "false" ]

/// Type of Tokens
public enum TinyTokenType {
    case identifier
    case keyword
    case symbol
    case literal
    case stringLiteral
}

/// Format of token
public struct TinyToken {
    let type: TinyTokenType
    let value: String
}

/// Tokenize the input program
public class TinyTokenizer {
    private let input: String
    private var currentIndex: String.Index
    private var tokens: [TinyToken] = []
    
    public init(input: String) {
        self.input = input
        self.currentIndex = input.startIndex
    }
        
    /// Tokenize the input string
    /// - Returns: list of tokens in TinyToken format
    public func tokenize() -> [TinyToken] {
        while !isEndOfInput() {
            let character = peek()
            
            if character.isWhitespace {
                advance()
            } else if character.isLetter {
                // Handle identifiers and keywords
                let identifier = readIdentifier()
                if isKeyword(identifier) {
                    tokens.append(TinyToken(type: .keyword, value: identifier))
                } else {
                    tokens.append(TinyToken(type: .identifier, value: identifier))
                }
            } else if character.isNumber {
                // Handle numeric literals
                let numericLiteral = readNumericLiteral()
                tokens.append(TinyToken(type: .literal, value: numericLiteral))
            } else if character == "\"" {
                // Handle string literals
                let stringLiteral = readStringLiteral()
                tokens.append(TinyToken(type: .stringLiteral, value: stringLiteral))
            } else if character == "'" {
                // Handle character literals
                let charLiteral = readStringLiteral()
                tokens.append(TinyToken(type: .stringLiteral, value: charLiteral))
            } else {
                // Handle symbols and operators
                let symbol = String(character)
                tokens.append(TinyToken(type: .symbol, value: symbol))
                advance()
            }
        }
//        tokens.indices.forEach{ k in
//            print( tokens[k], k)
//        }
        
        return tokens
    }
    
    /// Method to read an identifier or keyword
    /// - Returns: output identifier or keyword as string
    private func readIdentifier() -> String {
        var identifier = ""
        while !isEndOfInput() {
            let character = peek()
            if character.isLetter || character.isNumber {
                identifier.append(character)
                advance()
            } else {
                break
            }
        }
        return identifier
    }
    
    /// Method to read a numeric literal
    /// - Returns: numeric value in string
    private func readNumericLiteral() -> String {
        var numericLiteral = ""
        while !isEndOfInput() {
            let character = peek()
            if character.isNumber {
                numericLiteral.append(character)
                advance()
            } else {
                break
            }
        }
        return numericLiteral
    }
    
    /// Method to read a string literal
    /// - Returns: return the output as string
    private func readStringLiteral() -> String {
        var literal = ""
        let openingQuote = peek()
        
        if openingQuote == "\"" || openingQuote == "'" {
            literal.append(openingQuote)
            advance()
            
            while !isEndOfInput() {
                let character = peek()
                
                if character == openingQuote {
                    literal.append(character)
                    advance()
                    break
                } else if character == "\\" {
                    literal.append(character)
                    advance()
                    
                    if !isEndOfInput() {
                        let escapedChar = peek()
                        switch escapedChar {
                        case "a": literal.append("\u{0007}")  // Alert (bell)
                        case "b": literal.append("\u{0008}")  // Backspace
                        case "f": literal.append("\u{000C}")  // Form feed
                        case "n": literal.append("\n")       // Newline
                        case "r": literal.append("\r")       // Carriage return
                        case "t": literal.append("\t")       // Horizontal tab
                        case "v": literal.append("\u{000B}")  // Vertical tab
                        case "\\": literal.append("\\")       // Backslash
                        case "\"": literal.append("\"")       // Double quote
                        case "'": literal.append("'")         // Single quote
                        case "?": literal.append("?")         // Question mark
                        default:
                            break
                        }
                        advance() 
                    }
                } else {
                    literal.append(character)
                    advance()
                }
            }
        }
        
        return literal
    }
    
    /// Finds the of input
    /// - Returns: boolean value. True is end of input. False is not end of input.
    private func isEndOfInput() -> Bool {
        return currentIndex >= input.endIndex
    }
    
    /// Peek current value at current index
    /// - Returns: the current value as character
    private func peek() -> Character {
        return input[currentIndex]
    }
    
    /// next index/ currentindex + 1
    private func advance() {
        currentIndex = input.index(after: currentIndex)
    }
    
    /// Helper method to check if an identifier is a keyword
    /// - Parameter identifier: input value as string
    /// - Returns: boolean value. True is keyword. False is not keyword.
    private func isKeyword(_ identifier: String) -> Bool {
        return keywords.contains(identifier)
    }
}
