/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.util.Random;

/**
 *
 * @author Manjit Singh
 */
public class resetpassword {
     // DATAS
    // characters with which the password will be composed
    private static final int charactersSize = 100;
    private static char [] characters = new char [charactersSize];

    // keep the counts of used characters
    private static int charactersCount = 0;

    // size of the password to generate
    private int passwordSize;

  // CONSTRUCTOR
    public resetpassword( int passwordSize ) {

      // set the password size
      this.passwordSize = passwordSize;

      // set the characters that will be used to generate the password
      initCharacters();
    }

  // METHODS
    // fill the array of characters that will be used to generate the password 
    private static char [] initCharacters() {
      int i = 0;

      // add 0-9
      for ( int j = 48; j < 58; ++i, ++j, ++charactersCount ) {
        characters[i] = (char) j;
      }

      // add @ + a-z
      for ( int j = 64; j < 91; ++i, ++j, ++charactersCount ) {
        characters[i] = (char) j;
      }

      // add A-Z
      for ( int j = 97; j < 123; ++i, ++j, ++charactersCount ) {
        characters[i] = (char) j;
      }

      return characters;
    }

    // generate a random password
    public char [] get() {

      // initialize the random number generator
      Random rnd = new Random();

      char [] password = new char [passwordSize];


      // choose a random character from the array
      for ( int i = 0; i < passwordSize; ++i ) {
        password[i] = characters[ rnd.nextInt(charactersCount) ];
      }

      return password;
    }

  // DEBUG METHODS
    // show the characters the will be used to compose the pass
    public void showCharacters() {
      for ( int i = 0; i < charactersCount && characters[i] != 0; ++i ) {
        System.out.println(characters[i]);
      }
    }

  // MAIN - testing code 
    
}
