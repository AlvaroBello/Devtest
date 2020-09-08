public class bxt_number_to_letter 
{
    public static String number_letter(Decimal num)
    {
        String finalNumber='';
        Decimal aux = num;
        Decimal auxdecimales = aux - Math.floor(num);
        aux = Math.floor(aux);
        String temp = aux.toPlainString();
        Integer len = temp.length();
        String mill, mile, cien;

        // Se divide el digito recibido en partes de 3 para identificar millones, miles, y centenas
        switch on len {
            when  9{ mill = temp.substring(0, 3); mile = temp.substring(3,6); cien = temp.substring(6);}
            when  8{ mill = temp.substring(0, 2); mile = temp.substring(2,5); cien = temp.substring(5);}
            when  7{ mill = temp.substring(0, 1); mile = temp.substring(1,4); cien = temp.substring(4);}
            when  6{ mile = temp.substring(0,3); cien = temp.substring(3);}
            when  5{ mile = temp.substring(0,2); cien = temp.substring(2);}
            when  4{ mile = temp.substring(0,1); cien = temp.substring(1);}
            when  else{ cien = temp;}
        }
        finalNumber = concatenar(mill,mile,cien,auxdecimales);

        // -----------------------------------------------------------------------------------------------------
        // Bloque para correccion ortografica en casos como "quinientos uno mil" en lugar de "quinientos un mil"
        String errorgramatical = 'uno mil';
        String corregir= 'un mil';
        System.debug(finalNumber.CONTAINS(errorgramatical));
        
        if(finalNumber.CONTAINS(errorgramatical) == true)
        {
            System.debug('un mil');
            finalNumber= finalNumber.replace(errorgramatical,'un mil');
        }
        //------------------------------------------------------------------------------------------------------
        return finalNumber;
    }

    // Metodo de asignacion de nombres para bloque de 3 numeros ex: "536"
    public static String setNombres( String op)
    {   

        Integer aux2 = Integer.valueOf(op);
        String numerofinal;

        List<String> Unidad = new List<String>{' ','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve',
                                                'diez','once','doce','trece','catorce','quince','diesiseis','diesisiete','diesiocho','diesinueve',
                                                'veinte', 'veintiuno','ventidos','veintitres','veinticuatro','veinticinco','veintiseis','veintisiete','veintiocho','veintinueve'};
        List<String> Decenas = new List<String>{' ','','treinta','cuarenta','cincuenta','sesenta','setenta','ochenta','noventa'};
        List<String> Centenas = new List<String>{'ciento','doscientos','trescientos','cuatrocientos','quinientos','seiscientos','setecientos','ochocientos','novecientos'};
        
        // Validacion para saber si es mayor de 100
        if(aux2/100 >= 1)
        {   
            // Caso especifico donde el numero es 100
            if((math.floor(aux2/100) == 1) && (op.substring(1) == '00'))
            {numerofinal = 'cien';}
            else {
                {
                    //Asignacion de la centena "5xx"
                    numerofinal = Centenas[Integer.valueOf(op.substring(0,1))-1];
                    /*Validacion si el valor siguiente es menor a 30 debido a lexico de los numeros 
                    por ejemplo "veintidos" ya que no usa el formato generico " decena y unidad"*/
                    if((aux2 - math.floor(aux2/100)*100) < 30)
                    {
                        numerofinal = numerofinal + ' ' + Unidad[aux2 - (Integer)math.floor(aux2/100)*100];
                    }
                    else 
                    {
                        if(op.substring(2)== '0')
                        {
                            numerofinal = numerofinal+' '+ Decenas[Integer.valueOf(op.substring(1,2))-1];
                        }
                        else
                            numerofinal = numerofinal+' '+ Decenas[Integer.valueOf(op.substring(1,2))-1] +' y ' + Unidad[Integer.valueof(op.substring(2))];
                    }  
                }
            }
        }
        //--------------------------------------------------------------------------------------------------
        //Bloque para asignacion de numeros cuando son menores de 100 
        else {
            {
                    if((aux2 - math.floor(aux2/100)*100) < 30)
                    {
                        numerofinal = Unidad[aux2 - (Integer)math.floor(aux2/100)*100];
                    }
                    else
                    {   
                        if(op.substring(op.length()-1) == '0')
                        {
                            numerofinal = Decenas[Integer.valueOf(op.substring(0,op.length()-1))-1];
                        }
                        else
                            numerofinal = Decenas[Integer.valueOf(op.substring(0,op.length()-1))-1] +' y ' + Unidad[Integer.valueof(op.substring(op.length()-1))];
                    } 
            }
        }
        //--------------------------------------------------------------------------------------------------
        return numerofinal;
    }

    //Metodo para analisis de gramatica en los numeros
    public static String concatenar(String a, String b, String c, Decimal d)
    {
        String endNumber;
        //Analiza si el numero comprende a los millones
        if(a == null)
        {   //Analiza si el numero comprende a los miles
            if(b == null)
            {   
                endNumber = setNombres(c);
                return endNumber;
            }
            //Caso especial donde el numero es "1,xxx"
            if(b == '001'|| b == '1')
            {
                return endNumber = ' mil ' + setNombres(c);
            }
            else
            {
                return endNumber = setNombres(b) + ' mil ' + setNombres(c);
            }
        }
        else
        {   //Caso donde el numero es "1,xxx,xxx"
            if(a == '1' || a== '001')
            {
                if(b == '000')
                {
                    return endNumber = 'un millon ' + setNombres(c);
                }

                if(b == '001'|| b == '1')
                {
                return endNumber = 'un millon mil ' + setNombres(c);
                }
                else 
                    return endNumber = 'un millon ' +  setNombres(b) + ' mil ' + setNombres(c);
            }
            else 
            {   
                //Casos donde el numero tiene los miles en 000 o 001 para ahorrar llamada de un metodo
                if(b == '000')
                {
                    return endNumber = setNombres(a) + ' millones ' + setNombres(c);
                }
                if(b == '001'|| b == '1')
                {
                    return endNumber = setNombres(a) + ' millones mil ' + setNombres(c);
                }
                else 
                    return endNumber = setNombres(a) + ' millones ' +  setNombres(b) + ' mil ' + setNombres(c);
            }
        }
    }
}