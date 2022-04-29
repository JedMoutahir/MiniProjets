with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure lire is
   File_Name : String :=  "test.txt";
   File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
   S         : Stream_Access;
   c : Character;
   str : Unbounded_String;
begin
   -- Lire le contenu du fichier
   -- --------------------------
   --   Ouvrir le fichier en lecture
   Open(File, In_File, File_Name);

   --   Lire, vérifier et afficher de temps en temps le contenu
   --   Attention, il faut lire les données dans le même ordre qu'elles ont été écrite.
   --   Ici, le problème ne se pose pas car il n'y a que des octets.
   S := Stream(File);
   while not End_Of_File(File) loop
      c := Character'Input(S);
      Append(str, c);
      Put("Character = " & Character'Value(c'Image));
      Put(" '" & c & "'");
      New_Line;
   end loop;
   Put(To_String(str));
   New_Line;

   --   Fermer le fichier
   Close (File);

end lire;
