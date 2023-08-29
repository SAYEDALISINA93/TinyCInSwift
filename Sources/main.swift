import Darwin
import Foundation

 let inputCode1 = """
 int main() {
     int x;
     x = 10;
     return 0;
  }
 """;


 let inputCode2 = """
 int main () {
 bool x;
 float y, z;

 z = 0;
 y = 0;
 x = true;

 if(x) {
 y = y + z;
 }
 else {
 y = y - z;
 }
 return 0; }
 """

 let inputCode3 = """
 int main () { int i;
 char c; i = 20;
 while (i > 0) {
     c = 'a'; }
 return 0; }
 """


 let inputCode4 = """
 int sum(int a, int b) { int c;
 a = 10;
 b = 20;
 c = a + b; return c;
 }
 int main () {
 int a, b, c;
 a = 10;
 b = 20;
 c = sum(a, b); return 0;
 }
 """

// Failures
 let inputCode5 = """
 int main () {
 int i;
 i = 20;
 char c;
 }
 """

 let inputCode6 = """
 int main () { int c;
 c = a;
 Int a;
 }
 """

 let inputCode7 = """
 int x;
 int main(){ int x = 3; return 0; }
 """

let inputCode8 = """
int main () {
int a, b, c;
a = 65535; b = 2;
c = a + b; return c;
}
"""

let inputs = [inputCode1,inputCode2,inputCode3,inputCode4,inputCode5,inputCode6,inputCode7,inputCode8]

for a in 0...(inputs.count - 1){
    let tokenizer = TinyTokenizer(input: inputs[a])
    let tokens = tokenizer.tokenize()

    print("******************************************************** \n")
    
    let parser = TinyParser(tokens: tokens)
    let isParsed = parser.parse()

    if isParsed{
        print("Your Program Matched With the Grammar!!!! :)")
        print("\n ******************************************************** \n\n")
    }else{
        print("Your Program Dose not Matched With the Grammar!!!! :(")
        
        print("******************************************************** \n\n")
    }
}
