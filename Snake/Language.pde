/** Class: Language
  * Handles Language toggles
  */
public class Language{
  
  /** Method: spanish()
    * Basic language change if-statements
    * @param text - the text to translate to Spanish
    * @return the Spanish translation of the text
    */
  public String spanish(String text){
    if(text.equals("SCORE")){
      return "PUNTOS";
    } else if (text.equals("HIGH SCORE")) {
      return "PUNTUACIÓN MÁS ALTA";
    } else if(text.equals("SNAKE")){
      return "SERPIENTE";
    } else if(text.equals("START")){
      return "COMENZAR";
    } else if(text.equals("SPANISH")){
      return "ENGLISH";
    } else if(text.equals("GAME OVER")){
      return "JUEGO TERMINADO";
    } else if (text.equals("RESTART")) {
      return "REINICIAR";
    }
    return text;
  }
  
  /** Method: toSpanishCheck()
    * Checks if language is set to Spanish and 
    * returns text based on current toggle
    * @param input - the text to be checked
    * @param spanish - the language toggle
    * @return String - Spanish variant of text if toggle is true
    */
  public String toSpanishCheck(String input, boolean spanish) {
    if (spanish) {
      return spanish(input);
    } else {
      return input;
    }
  }
}
