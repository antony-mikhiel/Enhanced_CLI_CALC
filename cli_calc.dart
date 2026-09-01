#!/usr/bin/env dart

import 'dart:io';


/// super advanced calculator
void main (List<String> args){
  /// user input 
  stdout.write("Do your calculation:  ");
  String calcinput = stdin.readLineSync() ?? ''; //take input

  String cleaned = calcinput.replaceAll(' ', ''); //cut input into small things
    

  cleaned = cleaned.replaceAll('--', '+');

  
  //parse user input take it in a list of strings and seperate it by space



  List<String> terms = []; // numbers
  List<String> operators = []; // + , - , * , / , etc
  String current = ''; //the save result and the calculating bank before result

  /// for loop and categorize characters
  /// 
  /// 
  for (int i = 0; i < cleaned.length; i++) { // starts a loop and read every character 
    String char = cleaned[i]; // get the position of each character (increasing the number)
    if (char == '+' || char == '-' || char == '*' || char == '/') { // checks if it is a mathmatical operator
      terms.add(current); //takes the number currently in and ads it to "terms LISt" a number (THE THING(s) WE ARE DOING THE OPERATIONS ON) saves the number before the operator.
      operators.add(char); //checks SAVES CHAR in char list
      current = ''; // empties the string buffer "used as storage" then clarification in SEPERATED LISTS and then empties the string buffer temporary storage
    } else {
      current += char; // character reader every time by operator or number 
    }
  }
  if (current.isNotEmpty) { // when loop is empty
    terms.add(current); /// a number or a decimal point
  }

  double result = double.parse(terms[0]); // take the first item in the list which is the result

  // Apply operators left to right
  for (int i = 0; i < operators.length; i++) { // runs for every operator
    double next = double.parse(terms[i + 1]); //checks every term after the first term and (does the operation on the [0] first term)
    switch (operators[i]) {
      case '+':
        result += next;
        break;

      case '--':
        result += next;
        break;
      case '-':
        result -= next;
        break;

      case '*':
        result *= next;
        break;
      case '/':
        result /= next;
        break;
    }
  }

  print('Result: $result');
}
