with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Huffman;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure decomp is
    type T_Octet is mod 2 ** 8;	-- sur 8 bits
   for T_Octet'Size use 8;

   package Char_Natural_Huffman_Tree is new Huffman
     (--Symbol_Type => Character,
      Put => Ada.Text_IO.Put,
      Symbol_Sequence => String,
      Frequency_Type => Natural);
   Tree         : Char_Natural_Huffman_Tree.Huffman_Tree;
   Frequencies  : Char_Natural_Huffman_Tree.Frequency_Maps.Map;
   Input_String : Unbounded_String;
   File_Name_In : constant String :=  "testSujet.txt";
   File_Name_Out : constant String :=  "testSujet.txt.huff";
   File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
   S         : Stream_Access;
   recover : Unbounded_String := To_Unbounded_String("");

begin
      -----------------BUILD THE DECOMPRESSED FILE-----------------   
   Ada.Text_IO.Put("reconstruction de l'arbre");
   New_Line;
   New_Line;
   Open(File, In_File, File_Name_Out);
   
   S := Stream(File);
   
   --numChar := String'Input(S);
   --Ada.Text_IO.Put(Integer'Image(numChar));
   
   --recover list of character
   declare
      charCarac : Unbounded_String := To_Unbounded_String("");
      char : Character;
      charPrec : Character;
   begin
      --Ada.Text_IO.Put(testString);

      
      char := Character'Input(S);
      --Ada.Text_IO.Put(char);
      Append(charCarac, char);
      charPrec := char;
      char := Character'Input(S);
      while char/=charPrec loop     
         --Ada.Text_IO.Put(char);
         Append(charCarac, char);
         charPrec := char;
         char := Character'Input(S);
      end loop;
      Ada.Text_IO.Put(To_String(charCarac));
      New_Line;
   end;
   
   --recover tree
   declare
      charArbre : Unbounded_String := To_Unbounded_String("");
      --testString : String := String'Input(S);
      char : Character;
      Octet : T_Octet := 0;
      OctetPrecedent : T_Octet;
   begin
      for i in 0..7 loop
         char := Character'Input(S);
         if char /= '0' then
            Octet := Octet + 2**(8-i);
            Ada.Text_IO.Put(char);
            Append(charArbre, '1');
         else
            Ada.Text_IO.Put(char);
            Append(charArbre, '0');
         end if;
      end loop;
      --New_Line;
      OctetPrecedent := Octet;
      Octet := 0;
      for i in 0..7 loop
         char := Character'Input(S);
         if char /= '0' then
            Octet := Octet + 2**(8-i);
            Ada.Text_IO.Put(char);
            Append(charArbre, '1');
         else
            Ada.Text_IO.Put(char);
            Append(charArbre, '0');
         end if;
      end loop;
      --New_Line;
      while Octet/=OctetPrecedent loop     
         OctetPrecedent := Octet;
         Octet := 0;
         for i in 0..7 loop
            char := Character'Input(S);
            if char /= '0' then
               Octet := Octet + 2**(8-i);
               Ada.Text_IO.Put(char);
               Append(charArbre, '1');
            else
               Ada.Text_IO.Put(char);
               Append(charArbre, '0');
            end if;
         end loop;
         --New_Line;
      end loop;
      --recover := charArbre;-- Unbounded_Slice(charArbre, To_String(charArbre)'Length-12, To_String(charArbre)'Length);
      charArbre := Unbounded_Slice(charArbre, 1, To_String(charArbre)'Length);
      New_Line;
      New_Line;
      Ada.Text_IO.Put(To_String(charArbre));
      New_Line;
      New_Line;
   end;
   
   --store rest of the file
   declare
      charResteFichier : Unbounded_String := recover;
      Octet : T_Octet := 0;
      Bit : T_Octet;
   begin
      while not End_Of_File(File) loop     
         Octet := T_Octet'Input(S);
         for i in 0..7 loop
            Bit := Octet / 128;
            Ada.Text_IO.Put(Integer'Image(Integer(Bit)));
            Append(charResteFichier, Integer'Image(Integer(Bit))(2));
            Octet := Octet * 2;
         end loop;
      end loop;
      
      New_Line;
      New_Line;
      Ada.Text_IO.Put("reste du fichier :");
      New_Line;
      New_Line;
      Ada.Text_IO.Put(To_String(charResteFichier));
      New_Line;
      New_Line;
      declare
         CodeReccupere : constant  Char_Natural_Huffman_Tree.Bit_Sequence := Char_Natural_Huffman_Tree.StringToBitSeq(To_String(charResteFichier)(1..To_String(charResteFichier)'Length));
      begin
         Ada.Text_IO.Put("decode :");
         New_Line;
         New_Line;
         --Ada.Text_IO.Put_Line(Char_Natural_Huffman_Tree.Decode (Tree => Tree, Code => CodeReccupere));
      end; 
   end;
   
   --   Fermer le fichier
   Close (File);
   New_Line;
   New_Line;
   Ada.Text_IO.Put("fichier fermé");
   New_Line;
   New_Line;
end decomp;
