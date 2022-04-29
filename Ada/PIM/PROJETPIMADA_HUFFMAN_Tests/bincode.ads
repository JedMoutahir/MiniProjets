package BinCode is

   type Octet_Node;

   
   type T_Octet is mod 2 ** 8;	-- sur 8 bits
   for T_Octet'Size use 8;
   type T_ListeOctet is access Octet_Node;
   
   type Octet_Node is record
      Octet   : T_Octet;
      Next : T_ListeOctet := null;
   end record;
   
   function CreateListeOctet(Octet : T_Octet) return T_ListeOctet;
   procedure AddOctet(Liste : T_ListeOctet ; Octet : T_Octet);
end BinCode;
