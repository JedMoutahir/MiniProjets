with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Huffman;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   type T_Octet is mod 2 ** 8;	-- sur 8 bits
   for T_Octet'Size use 8;

   package Char_Natural_Huffman_Tree is new Huffman
     (Symbol_Type => Character,
      Put => Ada.Text_IO.Put,
      Symbol_Sequence => String,
      Frequency_Type => Natural);
   Tree         : Char_Natural_Huffman_Tree.Huffman_Tree;
   Frequencies  : Char_Natural_Huffman_Tree.Frequency_Maps.Map;
   Input_String : Unbounded_String;
   File_Name_In : String :=  "testBanque.txt";
   File_Name_Out : String :=  "testBanque.txt.huff";
   File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
   S         : Stream_Access;
   c : Character;
   empty : Unbounded_String := To_Unbounded_String("");
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
   --Put(To_String(str));
   --New_Line;
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
 
   -- encode example string
   
   Create (File, Out_File, File_Name_Out);
   
   S := Stream (File);
   for i in To_String(Input_String)'Range loop
      Append(empty, To_String(Input_String)(i));
      declare
         str : String := To_String(empty);
         Code : constant Char_Natural_Huffman_Tree.Bit_Sequence := Char_Natural_Huffman_Tree.Encode(Tree    => Tree, Symbols => str);
         Octet : T_Octet := 0;
      begin
         Char_Natural_Huffman_Tree.Put (Code);
         --Ada.Text_IO.Put_Line(Char_Natural_Huffman_Tree.Decode (Tree => Tree, Code => Code));

         for k in 1..Code'Length loop
            --Put_Line(Integer'Image(i));
            --Put_Line(Integer'Image(k));
            if Code(k) then
               Octet := Octet + 2**k;
            end if;
         end loop;
         T_Octet'Write(S, Octet);
      end;
      empty := To_Unbounded_String("");
   end loop;

end Main;
