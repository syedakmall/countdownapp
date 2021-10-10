
var hello = "hello";
var hello1s = "hello1";
var hello2 = "hello2";
var hello3 = "hello3";

var helloCollection = [hello, hello1s, hello2, hello3];


String checkHello(colorcol){
  var i;
  var colorFinal = "hello1";
   for (i in colorcol) {
    if (i == "hello"){
      colorFinal = i;
    } else {
      colorFinal = "a";
    }
  }

  return colorFinal;
}


void main(){
  print(checkHello(helloCollection));
}
