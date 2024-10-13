public class Language{
  
  public String spanish(String text){
    if(text == "Score: "){
      return "Puntos: ";
    }else if(text == "SNAKE"){
      return "SERPIENTE";
    }else if(text == "START"){
      return "COMENZAR";
    }else if(text == "SPANISH"){
      return "ENGLISH";
    }else if(text == "GAME OVER"){
      return "JUEGO TERMINADO";
    }else if(text == "Press TAB or ENTER to restart"){
      return "Presione TAB o ENTER para reiniciar";
    }
    return null;
  }
  
  public String english(String text){
    if(text == "Puntos: "){
      return "Score: ";
    }else if(text == "SERPIENTE"){
      return "SNAKE";
    }else if(text == "COMENZAR"){
      return "START";
    }else if(text == "ENGLISH"){
      return "SPANISH";
    }else if(text == "JUEGO TERMINADO"){
      return "GAME OVER";
    }else if(text == "Presione TAB o ENTER para reiniciar"){
      return "Press TAB or ENTER to restart";
    }
    return null;
  }
  
  // could be an override method
  public String toSpanishCheck(String input){
    String text = input;
    if(spanish){
      text = spanish(text);
    }
    return text;
  }
    
}
