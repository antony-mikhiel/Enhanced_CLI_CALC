#!/usr/bin/env dart

import 'dart:io';
import 'dart:math';

showMenu() {
  print('\n######## calculator ########');
  stdout.write('want to use the calculater (ENTER/y/m/n) : ');
}

/// super advanced calculator
void main(List<String> args) {
  bool printed = false;
  try {
    while (true) {
      showMenu();
      String option = stdin.readLineSync() ?? ''; //take input
      
      if (option.isEmpty) option = 'y';  //ENTER
      if (option == "m"){
        print("menu of calculations:   + - * / ^ %");
      }
      if (option == "y") {
        /// user input
        stdout.write('calculate : ');
        String calcinput = stdin.readLineSync() ?? ''; //take input



        String cleaned = calcinput;

        cleaned = cleaned.replaceAll('--', '+');

        //parse user input take it in a list of strings and seperate it by space

        List<String> terms = []; // numbers
        List<String> operators = []; // + , - , * , / , etc
        String current =
            ''; //the save result and the calculating bank before result

        /// for loop and categorize characters
        ///
        ///
        for (int i = 0; i < cleaned.length; i++) {
          // starts a loop and read every character
          String char = cleaned[i]; // get the position of each character (increasing the number)
          if (char == '+' ||
              char == '-' ||
              char == '*' ||
              char == '/' ||
              char == '^' ||
              char == '%') {
            // checks if it is a mathmatical operator
            terms.add(current); //takes the number currently in and ads it to "terms LISt" a number (THE THING(s) WE ARE DOING THE OPERATIONS ON) saves the number before the operator.
            operators.add(char); //checks SAVES CHAR in char list
            current = ''; // empties the string buffer "used as storage" then clarification in SEPERATED LISTS and then empties the string buffer temporary storage
          } else {
            current += char; // character reader every time by operator or number
          }
        }
        if (current.isNotEmpty) {
          // when loop is empty
          terms.add(current);

          /// a number or a decimal point
        }

        num result = num.parse(
          terms[0],
        ); // take the first item in the list which is the result

        // Apply operators left to right
        for (int i = 0; i < operators.length; i++) {
          // runs for every operator
          num next = num.parse(terms[i + 1]); //checks every term after the first term and (does the operation on the [0] first term)
          switch (operators[i]) {
            case '+':
              result += next;
              printed = true;
              break;

            case '--':
              result += next;
              printed = true;
              break;
            case '-':
              result -= next;
              printed = true;
              break;

            case '*':
              result *= next;
              printed = true;
              break;
            case '%':
              result %= next;
              printed = true;
              break;
            case '/':
              if (next == 0) {
                print('undefined: you cannot divide by zero');
                printed = false;
                break;
              } else {
                result /= next;
                printed = true;
                break;
              }
            case '^':
              // Only use BigInt if both are integers
              if (result is int && next is int) {
                BigInt power = BigInt.one;
                BigInt base = BigInt.from(result);
                for (int i = 0; i < next; i++) {
                  /// multiplies itself how many times the power is
                  power *= base;
                }
                print('Result: $power');
                printed = false;
                break;
              } else {
                result = pow(result, next);
                printed = true; 
                break;
              }
              
          }
        }

        if (printed) {
          print('Result: $result');
        }
      }
      if (option == "n") {
        print("** quitting the app **");
        break;
      }
    }



    // All parsing and calculation here
  } on FormatException {
    print('Error: Invalid number format (use digits or decimals)');
  } on UnsupportedError {
    print('Error');
  } catch (e) {
    print('Error: $e');
  }
}
