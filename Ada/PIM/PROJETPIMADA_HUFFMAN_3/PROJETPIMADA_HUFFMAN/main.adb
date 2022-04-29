with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Huffman;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
 
procedure Main is
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
   c : Character;
   finArbre : constant Character := '$';
   recover : Unbounded_String := To_Unbounded_String("");
   --numChar : Integer;

begin
   Open(File, In_File, File_Name_In);
   S := Stream(File);
   while not End_Of_File(File) loop
      c := Character'Input(S);
      Append(Input_String, c);
      --Put("Character = " & Character'Value(c'Image));
      --Put(" '" & c & "'");
      --New_Line;
   end loop;
   Put(To_String(Input_String));
   New_Line;
   Close (File);

   -- build frequency map
   for I in To_String(Input_String)'Range loop
      declare
         use Char_Natural_Huffman_Tree.Frequency_Maps;
         Position : constant Cursor := Frequencies.Find (To_String(Input_String) (I));
      begin
         if Position = No_Element then
            Frequencies.Insert (Key => To_String(Input_String) (I), New_Item => 1);
         else
            Frequencies.Replace_Element
              (Position => Position,
               New_Item => Element (Position) + 1);
         end if;
      end;
   end loop;
 
   -- create huffman tree
   Char_Natural_Huffman_Tree.Create_Tree
     (Tree        => Tree,
      Frequencies => Frequencies);
 
   -- dump encodings
   Char_Natural_Huffman_Tree.Dump_Encoding (Tree => Tree);
 

   -----------------BUILD THE COMPRESSED FILE-----------------   
   Create (File, Out_File, File_Name_Out);
   
   S := Stream (File);
    
   -----------------WRITE DATA NECESSARY FOR DECOMPRESSION-----------------
   --write number of character in the tree
   Ada.Text_IO.Put(Integer'Image(Char_Natural_Huffman_Tree.Number_Of_Character(Tree)));
   New_Line;
    
   --String'Write(S, Integer'Image(Char_Natural_Huffman_Tree.Number_Of_Character(Tree)));
    
   --write list of the characters
   declare
      str : constant String := Char_Natural_Huffman_Tree.List_Of_Character(Tree);
   begin
      Ada.Text_IO.Put("list of char : ");
      New_Line;
      Ada.Text_IO.Put(str);
      New_Line;
      New_Line;
      String'Write(S, str);
      Character'Write(S, str(str'Length));
   end;
   --write tree
   declare
      str : constant String := Char_Natural_Huffman_Tree.Tree_Code(Tree);
   begin
      Ada.Text_IO.Put("tree : ");
      New_Line;
      Ada.Text_IO.Put(str);
      New_Line;
      New_Line;
      String'Write(S, str);
   end;
   
   --write end of tree
   Character'Write(S, finArbre);
   --Character'Write(S, finArbre);

   -----------------WRITE ENCODED FILE-----------------
   declare
      Code : constant Char_Natural_Huffman_Tree.Bit_Sequence := Char_Natural_Huffman_Tree.Encode(Tree    => Tree, Symbols => To_String(Input_String));
      Octet : T_Octet := 0;
      indice_reste : Integer;
   begin
      Char_Natural_Huffman_Tree.Put (Code);
      Ada.Text_IO.Put_Line(Char_Natural_Huffman_Tree.Decode (Tree => Tree, Code => Code));
      for k in 0..(Code'Length/8 - 1) loop
         for i in 0..7 loop
            if Code(i+8*k+1) then
               Octet := Octet + 2**(8-i-1);
               --Ada.Text_IO.Put("1");
            else
               --Ada.Text_IO.Put("0");
               null;
            end if;
         end loop;
         Ada.Text_IO.Put(Integer'Image(Integer(Octet)));
         T_Octet'Write(S, Octet);
         Octet := 0;
         Ada.Text_IO.New_Line;
      end loop;
      indice_reste := Code'Length - Code'Length mod 8 ;--+1;
      for i in 0..7 loop
         if (i + indice_reste) > Code'Length then
            --Ada.Text_IO.Put("0");
            null;
         else
            if Code(i+indice_reste) then
               Octet := Octet + 2**(8-i-1);
               --Ada.Text_IO.Put("1");
            else
               --Ada.Text_IO.Put("0");
               null;
            end if;
         end if;
      end loop;
      Ada.Text_IO.Put(Integer'Image(Integer(Octet)));
      T_Octet'Write(S, Octet);
      Ada.Text_IO.New_Line;
   end;
   --   Close the file
   Close (File);
    
    
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
   
      --recover tree
      declare
         charArbre : Unbounded_String := To_Unbounded_String("");
         --testString : String := String'Input(S);
         char : Character;
         charPrecedent : Character;
      begin
         char := Character'Input(S);
         while char/=finArbre loop     
            if char /= '0' then
               Ada.Text_IO.Put(char);
               Append(charArbre, '1');
            else
               Ada.Text_IO.Put(char);
               Append(charArbre, '0');
            end if;
            char := Character'Input(S);
         end loop;
         --New_Line;
         --recover := charArbre;-- Unbounded_Slice(charArbre, To_String(charArbre)'Length-12, To_String(charArbre)'Length);
         --charArbre := Unbounded_Slice(charArbre, 1, To_String(charArbre)'Length-5);
         New_Line;
         New_Line;
         --Ada.Text_IO.Put(To_String(charArbre));
         New_Line;
         New_Line;
   
         --store rest of the file
         declare
            charResteFichier : Unbounded_String := recover;
            Octet : T_Octet := 0;
            Bit : T_Octet;
         begin
            while not End_Of_File(File) loop     
               Octet := T_Octet'Input(S);
               for i in 0..7 loop
                  Bit := (Octet+1) / 128;
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
            --charResteFichier := Unbounded_Slice(charResteFichier, 1, To_String(charResteFichier)'Length-3);
            Ada.Text_IO.Put(To_String(charResteFichier));
            New_Line;
            New_Line;
            declare
               TreeRecc : Char_Natural_Huffman_Tree.Huffman_Tree;
            begin
               Char_Natural_Huffman_Tree.Create_Tree(TreeRecc, Frequencies);
               declare
                  CodeReccupere : constant  Char_Natural_Huffman_Tree.Bit_Sequence := Char_Natural_Huffman_Tree.StringToBitSeq(To_String(charResteFichier)(1..To_String(charResteFichier)'Length));
               begin
                  Ada.Text_IO.Put("decode :");
                  New_Line;
                  New_Line;
                  Ada.Text_IO.Put_Line(Char_Natural_Huffman_Tree.Decode (Tree => TreeRecc, Code => CodeReccupere));
               end; 
            end; 
         end;
      end;
   end;

   --   Fermer le fichier
   Close (File);
   New_Line;
   New_Line;
   Ada.Text_IO.Put("fichier fermé");
   New_Line;
   New_Line;
end Main;
