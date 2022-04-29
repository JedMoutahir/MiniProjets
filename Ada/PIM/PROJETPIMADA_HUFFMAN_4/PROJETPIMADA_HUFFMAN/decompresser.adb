with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Huffman;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Command_Line; use Ada.Command_Line;
 
procedure Decompresser is
    
   type T_Octet is mod 2 ** 8;	-- sur 8 bits
   for T_Octet'Size use 8;

   package Char_Natural_Huffman_Tree is new Huffman
     (--Symbol_Type => Character,
      Put => Ada.Text_IO.Put,
      Symbol_Sequence => String,
      Frequency_Type => Natural);
   
   
   procedure Afficher_Usage is
   begin
      New_Line;
      Put_Line ("Usage : decompresser un fichier");
      New_Line;
      Put_Line ("   ./decompresser fichier_texte.txt.hff");
      New_Line;
   end Afficher_Usage;

   Nom_Fichier_In : Unbounded_String;
   Nom_Fichier_Out : Unbounded_String;
   File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
   S         : Stream_Access;

begin
   if Argument_Count /= 1 then
      Afficher_Usage;
   else
      -- Ouvrir le fichier source pour lire
      Nom_Fichier_In := To_Unbounded_String(Argument(1));
      Unbounded_Slice(Nom_Fichier_In, Nom_Fichier_Out, 1, To_String(Nom_Fichier_In)'Length-8);
      Append(Nom_Fichier_Out, "_decomp.txt");
      -----------------BUILD THE DECOMPRESSED FILE-----------------   
      Ada.Text_IO.Put("reconstruction de l'arbre");
      New_Line;
      New_Line;
      Open(File, In_File, To_String(Nom_Fichier_In));
   
      S := Stream(File);
   
      --recover tree
      declare
         FrequenciesRecc : Char_Natural_Huffman_Tree.Frequency_Maps.Map;
      begin
         FrequenciesRecc := Char_Natural_Huffman_Tree.Frequency_Maps.Map'Input(S);
         New_Line;
         New_Line;
   
         --store rest of the file
         declare
            charResteFichier : Unbounded_String;
            Octet : T_Octet := 0;
            Bit : T_Octet;
         begin
            while not End_Of_File(File) loop     
               Octet := T_Octet'Input(S);
               for i in 0..7 loop
                  Bit := (Octet) / 128;
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
               Char_Natural_Huffman_Tree.Create_Tree(TreeRecc, FrequenciesRecc);
               declare
                  CodeReccupere : constant  Char_Natural_Huffman_Tree.Bit_Sequence := Char_Natural_Huffman_Tree.StringToBitSeq(To_String(charResteFichier)(1..To_String(charResteFichier)'Length-6));
                  fichierDecompresse : constant String := Char_Natural_Huffman_Tree.Symbol_Seq_to_string(Char_Natural_Huffman_Tree.Decode (Tree => TreeRecc, Code => CodeReccupere));
               begin
                  Ada.Text_IO.Put("decode :");
                  New_Line;
                  New_Line;
                  Ada.Text_IO.Put_Line(Char_Natural_Huffman_Tree.Decode (Tree => TreeRecc, Code => CodeReccupere));
                  
                  
                  
                  --   Fermer le fichier
                  Close (File);
                  New_Line;
                  New_Line;
                  Ada.Text_IO.Put("fichier fermé");
                  New_Line;
                  New_Line;
      
                  --write decompressed file
                  Create (File, Out_File, To_String(Nom_Fichier_Out));
                  S := Stream (File);
    
                  --write string
                  String'Write(S, fichierDecompresse);
               end; 
            end; 
         end;
      end;
   end if;
end Decompresser;
