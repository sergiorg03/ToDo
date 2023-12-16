class Utilities {
  
  static const IP = "";
  static const URL = "";

   List<String> LETRAS_DNI = ["T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"];

   /// Función que comprueba si una cadena contiene texto o no.
   /// @return {bool} -- Devuelve True si la cadena pasada por parametro contiene texto. False si no.
   bool contieneTexto(String cadena){
     bool contiene = false;

     if(cadena.isNotEmpty && cadena != ''){
       contiene = true;
     }

     return contiene;
   }

   /// Función que comprueba si el DNI introducido tiene el formato correcto.
   /// @return {bool} -- Devuelve True si el dni es correcto, False si no.
   bool comprobarDni (String dni){
     bool valido = false;

     if(contieneTexto(dni) && dni.length == 9 && esNumerico(dni.substring(0,8)) && LETRAS_DNI.elementAt((int.parse(dni.substring(0,8))%23)) == dni.substring(8).toUpperCase()){
       valido = true;
     }

     return valido;
   }

   /// Funcion que comprueba si una cadena es numerica o no
   /// @return {bool} -- Devuelve true si una cadena introducida es númerica. True si lo es, False si no.
   bool esNumerico (String cadena){
     bool valido = false;
     
     if(int.tryParse(cadena) != null){
       valido = true;
     }
     
     return valido;
   }
}