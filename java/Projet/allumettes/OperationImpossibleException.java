package allumettes;
/*
* @author Guet paul-henri
* @version 2.1
*/
public class OperationImpossibleException extends RuntimeException
{
    
    public OperationImpossibleException()
    {
        super("Cette Opération est interdite dans le jeu,faut pas tricher voyons :) !");
    }
}
