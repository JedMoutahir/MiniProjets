with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Exemple_ES is
	type T_Octet is mod 2 ** 8;	-- sur 8 bits
	for T_Octet'Size use 8;

	File_Name : String :=  "exemple_fichier.out";
	File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
	S         : Stream_Access;
	Octet     : T_Octet;

begin
	-- Écrire les premiers octets dans un fichier
	-- ------------------------------------------
	--   Créer un fichier en écriture (écrasement si existant)
	Create (File, Out_File, File_Name);

	--   Écrire dans le fichier via un Stream
	--   (on pourrait écrire des données de type différents)
	S := Stream (File);
	for I in 0..128 loop
		T_Octet'Write(S, T_Octet(I));
	end loop;

	--   Fermer le fichier
	Close (File);


	-- Lire le contenu du fichier
	-- --------------------------
	--   Ouvrir le fichier en lecture
	Open(File, In_File, File_Name);

	--   Lire, vérifier et afficher de temps en temps le contenu
	--   Attention, il faut lire les données dans le même ordre qu'elles ont été écrite.
	--   Ici, le problème ne se pose pas car il n'y a que des octets.
	S := Stream(File);
	while not End_Of_File(File) loop
		Octet := T_Octet'Input(S);
		Put("Octet = " & T_Octet'Image(Octet));
		Put(" '" & Character'Val(Octet) & "'");
		New_Line;
	end loop;

	--   Fermer le fichier
	Close (File);

end Exemple_ES;
