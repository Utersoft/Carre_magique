//ALGORITHME : CARRE_MAGIQUE
//BUT : Creer un carre magique de 5x5 ou 7x7
//ENTREE : 
//SORTIE : Carre magique
(*
procedure matrice (var carre : Tableau, n : entier)
	var i, j : entier

DEBUT
	pour i + 1 A 5 faire
	DEBUT
		pour j + 1 A 5 faire
		DEBUT
			ECRIRE Carre[i, j]
		FIN
	FIN
FIN

procedure remplir_matrice(var carre : tableau, n : entier)
var : i, a, j: ENTIER
DEBUT
	 i <- n div 2
	 j <- (n div 2) +1
	 a <- 0

	REPETER
	SI carre[i, j] = 0 ALORS
	DEBUT
		a <- a + 1
		Carre[i, j] <- a
		i <- i - 1
		j <- j + 1
		SI Carre[i, j] <> 0 ALORS
		DEBUT
			i <- i  - 1
			j <- j -1
		FINSI
		SI i <- 5 ALORS
			i <- 1
		SI i <- 1 ALORS
			i <- 5
		SI j <- 5 ALORS
			j <- 1
		SI j < 1 ALORS
			i <- 5
	FINSI
	JUSQU'A a = 25
	ECRIRE carre[i,j]
FIN 

var : Carre : Tableau[1..5,1..5] de ENTIER
i, a, j, n: ENTIER

DEBUT
	ECRIRE "taille de la matrice"
	LIRE n
	SI (n = 5) ou (n=7) ALORS
		remplir_matrice(carre, n)
		matrice(carre,n)
	SINON
		ECRIRE "Ce n'est pas 5 ou 7"
	FINSI
FIN
*)
program carre_magique;

uses crt;

type
mat = array [0..8, 0..8] of integer;

procedure matrice (var carre : mat; n : integer); 
	var i, j : integer;
	begin
		for i := 0 to n+1 do// il s'agit de l'affichage du tableau
		begin
			for j := 0 to n+1 do
			begin
        		if (i = 0) or (i = n +1) or (j = 0)  or (j = n+1) then// de 64 à 68 : c'est le cadre du carre magique
        		begin
        			carre[i,j] := -1;
        			Textcolor(green);
        			write('[ ]');
            	end
            	else
            	begin
        		(*if carre[i,j] = -1 then
        			write('[ ]')
        		else*)
        		(*if (i <> 0) or (i <> n +1) or (j <> 0)  or (j <> n+1) then*)
        			Textcolor(yellow);
        			if carre[i,j] < 10 then// J'ai ajouté un espace en plus pour qu'il y ait le même espace entre les chiffres qu'ils soient inferieur ou superieur a 10
        				write('  ', carre[i,j])
        			else
        				write (' ', carre[i,j]);
				end;
			end;
			writeln;
		end;
	end;

	procedure remplir_matrice (var carre : mat; n : integer);
	var i, j, a : integer;
	begin
		a := 0;
		i:= (n DIV 2);
		j:= (n DIV 2) +1;
		repeat
		begin
			if carre[i,j] = 0 then
			begin
				a := a+1;
				carre[i,j] := a;
				i := i -1;// déplacement dans la matrice
				j := j +1;
				if i < 1 then //faire retourner au debut de la matrice si elle dépasse le max ou le min
					i := n;
				if j > n then
					j := 1;
			end
			else
			begin
				if carre[i,j] <> 0 then
				begin
					while carre[i,j] <> 0 do
					begin
						i := i -1;
						j := j -1;
						if i < 1 then
							i := n;
						if j < 1 then
							j := n;
						
					end;
				end;
			end;
		end;
		until a = sqr(n);
	end;


var
carre : mat;
i, j, a, n : integer;

BEGIN
	clrscr;
	writeln('programme carre magique');
	writeln('Voici un carre magique');
	writeln('Entrez la dimension entre 5 et 7.');
	readln(n);
	if (n = 7) or (n = 5) then
	begin
		remplir_matrice(carre,n);
		matrice(carre,n);
		readln;
	end
	else
		writeln('Ce n''est pas 5 ou 7');
		readln;
end.
	(*begin
	for i := 0 to 6 do
	begin
		for j := 0 to 6 do
		begin
			carre[i, j] := 0;
		end
	end;

	a:= 0;
	x := 2;
	y := 3;

		for i:=0 to 6 do
    	Begin
        	for j:=0 to 6 do
        	Begin
        		if (i = 0) or (i = 6) or (j = 0)  or (j = 6) then
        		begin
        			carre[i, j] := 1;
        			Textcolor(green);
            	end
        		else
        		begin
        			carre[i,j]:= -2;
        			Textcolor(yellow);
        		end;
        		if carre[i,j] = 1 then
        			write('[ ]')
        		else
        		begin
    				a := a +1;
    				if (carre[i,j] = -2) then
        				begin
        					carre[x,y] := a;
        					x := x -1;
        					y := y +1;
        					if x < 1 then
        						x := 5;
        					if y > 5 then
        						y := 1;
        					carre[i,j] := carre[x, y];
    						if carre[x,y] < 10 then
        						write('  ',carre[x,y])
        					else
        						write(' ',carre[x,y]);
        				end
        				else
        				begin
        					if carre[i,j] <> -2 then
        					begin
        						x := x +1;
        					end
        					else
        					begin
        						if carre[i,j] = -2 then
        							carre[x, y] := a;
        							if x < 1 then
        								x := 5;
        							if y < 1 then
        								y := 5;
        							carre[i,j] := carre[x, y];
    								if carre[x,y] < 10 then
        								write('  ',carre[x,y])
        							else
        								write(' ', carre[x,y]);
        					end;

        				end;
        			end;
    		end;

        	writeln;
    	
    	end;

  
	readln;
end.*)