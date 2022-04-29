package body BinCode is

   function CreateListeOctet(Octet : T_Octet) return T_ListeOctet
   is
      Result : Node_Access := new T_ListeOctet;
   begin
      Result.Octet := Octet;
      return Result;
   end CreateListeOctet;
   
   
   procedure AddOctet(Liste : T_ListeOctet ; Octet : T_Octet);

end BinCode;
