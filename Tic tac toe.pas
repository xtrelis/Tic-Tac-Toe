program tictactoe;

uses crt;

var table:array[1..9] of string;
	bool:array[1..9] of boolean;
	i, y, p, c, z:integer;
	Player1, Player2, Draw, Comp:boolean;
    key, yesorno:char;
    x, o, e:string;
    p12points, p1cpoints, p2points, cpoints, d1points, d2points, color:integer;
    
	
procedure intro();
	begin
	writeln('        .____,   |            |    ____   ."             _');
	writeln('       . \  / ,  |            |  ,` __ `.;           _  (_)');
	writeln('       |`-  -`|  |            | / ,`  ..`\         _| |_ _  ____ ');
	writeln('       |,-  -.|  |            | | | ;" | |        (_   _) |/ ___)');
	writeln('       ` /__\ `  |            | \ ;`__,` /          | |_| ( (___');
	writeln('        `    `   |            |  :.____,`            \__)_|\____)');
	writeln('    _____________|____________|_._____________');
	writeln('        .____,   |    ____    :`                         _');
	writeln('       . \  / ,  |  ,` __ ..."|                        _| |_ _____  ____');
	writeln('       |`-  -`|  | / ,` :". \ |                       (_   _|____ |/ ___)');
	writeln('       |,-  -.|  | | |..) | | |                         | |_/ ___ ( (___');
	writeln('       ` /__\ `  | \ ;.__,` / |                          \__)_____|\____)');
	writeln('        `    `   | .".____,`  |');
	writeln('    _____________:`___________|_______________               _   ');
	writeln('         ____  ""|            |   .____,                   _| |_ ___  _____');
	writeln('       ,` __ `:  |            |  . \  / ,                 (_   _) _ \| ___ |');
	writeln('      / ,`  ." \ |            |  |`-  -`|                   | || |_| | ____|');
	writeln('      | | .; | | |            |  |,-  -.|                    \__)___/|_____)');
	writeln('      \ .:__,` / |            |  ` /__\ `             ');
	writeln('       :.____,`  |            |   `    `             ');
	writeln('     :"');
	writeln();
	end;
	
procedure mode();
	begin
	writeln('        .____,   |            |    ____   ."');
	writeln('       . \  / ,  |            |  ,` __ `.;');
	writeln('       |`-  -`|  |            | / ,`  ..`\');
	writeln('       |,-  -.|  |            | | | ;" | |');
	writeln('       ` /__\ `  |            | \ ;`__,` /');
	writeln('        `    `   |            |  :.____,`');
	writeln('    _____________|____________|_._____________          Select Mode.');
	writeln('        .____,   |    ____    :`');
	writeln('       . \  / ,  |  ,` __ ..."|                     [1].Player1 vs Player2.');
	writeln('       |`-  -`|  | / ,` :". \ |');
	writeln('       |,-  -.|  | | |..) | | |                     [2].Player1 vs Computer.');
	writeln('       ` /__\ `  | \ ;.__,` / |');
	writeln('        `    `   | .".____,`  |');
	writeln('    _____________:`___________|_______________');
	writeln('         ____  ""|            |   .____,');
	writeln('       ,` __ `:  |            |  . \  / ,');
	writeln('      / ,`  ." \ |            |  |`-  -`|');
	writeln('      | | .; | | |            |  |,-  -.|');
	writeln('      \ .:__,` / |            |  ` /__\ `');
	writeln('       :.____,`  |            |   `    `');
	writeln('     :"');
	writeln();
	end;
	
procedure credits();
	begin
	writeln('                  .____,   |            |    ____   ."');
	writeln('                 . \  / ,  |   ΤΡΕΛΗΣ   |  ,` __ `.;');
	writeln('                 |`-  -`|  |            | / ,`  ..`\');
	writeln('                 |,-  -.|  | ΧΑΡΑΛΑΜΠΟΣ | | | ;" | |');
	writeln('                 ` /__\ `  |            | \ ;`__,` /');
	writeln('                  `    `   |            |  :.____,`');
	writeln('              _____________|____________|_._____________');
	writeln('                  .____,   |    ____    :`');
	writeln('                 . \  / ,  |  ,` __ ..."|');
	writeln('                 |`-  -`|  | / ,` :". \ |   1ΙΤΕΠ01');
	writeln('                 |,-  -.|  | | |..) | | |');
	writeln('                 ` /__\ `  | \ ;.__,` / |');
	writeln('                  `    `   | .".____,`  |');
	writeln('              _____________:`___________|_______________');
	writeln('                   ____  ""|            |   .____,');
	writeln('                 ,` __ `:  |            |  . \  / ,');
	writeln('                / ,`  ." \ |   2016     |  |`-  -`|');
	writeln('                | | .; | | |            |  |,-  -.|');
	writeln('                \ .:__,` / |            |  ` /__\ `');
	writeln('                 :.____,`  |            |   `    `');
	writeln('               :"');
	writeln();
	end;

procedure wrongbutton();
	begin
	writeln('Wrong choice! Try Again!');
	delay(2000);
	clrscr;
	end;
	
procedure enter();
	begin
	writeln();
	writeln('Press <Enter> to continue.');
	readln();
	clrscr;
	end;
	
procedure escenter();
	begin
		repeat
			begin
			writeln ('Press <Enter> to start the game or <Esc> for exit.');
			key:=readkey;
			clrscr;	
				case key of
				#13, #0, #28:	begin
								writeln ('Tic Tac Toe starts ! ! !':50);
								delay(2000);
								clrscr;
								end;
				#27:	begin
							repeat
							writeln ('Are you sure? You want finish the game? (Y)es or (N)o.');
							yesorno:=readkey;	
							clrscr;
								case yesorno of
								#89, #121:	begin
												writeln ('Exit game...':45);
												delay(2000);
												credits();
												delay(2000);
												clrscr;
												halt;
												end;
								#78, #110:	begin
											writeln ('Tic Tac Toe starts ! ! !':50);
											delay(2000);
											clrscr;
											end
								else wrongbutton();
								end;
						until (yesorno=#78) or (yesorno=#110) or (yesorno=#89) or (yesorno=#121);
					end;
				else wrongbutton();
				end;
			end;
		until (key=#13) or (key=#27) or (key=#0) or (key=#28);
	end;
	
procedure colors();
	begin
		if table[z]=x then color:=9
		else if table[z]=o then color:=12
		else if table[z]=e then color:=15;
	end;
	
procedure map();
	begin
	writeln('_______________________________');
	writeln('|         |         |         |');
	write('|1)');
	z:=1;
	colors();
	textcolor(color);
	write(table[1]);
	textcolor(15);
	write('|2)');
	z:=2;
	colors();
	textcolor(color);
	write(table[2]);
	textcolor(15);
	write('|3)');
	z:=3;
	colors();
	textcolor(color);
	write(table[3]);
	textcolor(15);
	writeln('|');
	writeln('|_________|_________|_________|');
	writeln('|         |         |         |');
    write('|4)');
    z:=4;
	colors();
    textcolor(color);
    write(table [4]);
    textcolor(15);
    write('|5)');
    z:=5;
	colors();
    textcolor(color);
    write(table[5]);
    textcolor(15);
    write('|6)');
    z:=6;
	colors();
    textcolor(color);
    write(table[6]);
    textcolor(15);
    writeln('|');
    writeln('|_________|_________|_________|');
    writeln('|         |         |         |');
    write('|7)');
    z:=7;
	colors();
    textcolor(color);
    write(table [7]);
    textcolor(15);
    write('|8)');
    z:=8;
	colors();
    textcolor(color);
    write(table[8]);
    textcolor(15);
    write('|9)');
    z:=9;
	colors();
    textcolor(color);
    write(table[9]);
    textcolor(15);
    writeln('|');
    writeln('|_________|_________|_________|');
    writeln();
    writeln('            SCORE');
    writeln();
    	if (p=1) then begin
    				  write('Player1= ');
    				  textcolor(9);
    				  write(p12points);
    				  textcolor(15);
    				  write('    Player2= ');
    				  textcolor(12);
    				  write(p2points);
    				  textcolor(15);
    				  writeln('    Draws= ', d1points);
    				  end
    		else if (p=2) then begin
    						   write('Player1= ');
    						   textcolor(9);
    						   write(p1cpoints);
    						   textcolor(15);
    						   write('    Computer= ');
    						   textcolor(12);
    						   write(cpoints);
    						   textcolor(15);
    						   writeln('    Draws= ', d2points);
    						   end;
    writeln();    		
    end;
	
procedure P1();
	begin
		repeat
		clrscr;
		map();
		writeln();
		write('Player1 choose a number (1-9)');
		readln(y);
			if (y>0) and (y<10) then
				begin
					if (table[y]=x) or (table[y]=o) then 
						begin
						writeln('The Block', y ,' is already in use ');
						delay(2000);
						end;
				end
			else wrongbutton();
		until (table[y]=e);
		table[y]:=x;
		bool[y]:=true;
	if (table[1]=x) and (table[2]=x) and (table[3]=x) or (table[4]=x) and (table[5]=x) and (table[6]=x) or (table[7]=x) and (table[8]=x) and (table[9]=x) or (table[1]=x) and (table[4]=x) and (table[7]=x) or (table[2]=x) and (table[5]=x) and (table[8]=x) or (table[3]=x) and (table[6]=x) and (table[9]=x) or (table[1]=x) and (table[5]=x) and (table[9]=x) or (table[3]=x) and (table[5]=x) and (table[7]=x) then
		begin
		clrscr;
   		map();
   		writeln('Player1 has won');
   		enter();
   		clrscr;
   			if (p=1) then p12points:=p12points+1
   			else if (p=2) then p1cpoints:=p1cpoints+1;
   		Player1:=true;
   		end
   else if (Player1=false) and (bool[1]=true) and (bool[2]=true) and (bool[3]=true) and (bool[4]=true) and (bool[5]=true) and (bool[6]=true) and (bool[7]=true) and (bool[8]=true) and (bool[9]=true) then 
   		begin
   		writeln('The game is Draw');
   		enter();
   		clrscr;
   			if (p=1) then d1points:=d1points+1
   			else if (p=2) then d2points:=d2points+1;
   		Draw:=true;
   		end;
	end;
	
procedure CompNumb();
	begin
	table[c]:=o;
	bool[c]:=true;
	writeln('Computer chose number ', c);
	enter();
	end;	
    
    
begin
p12points:=0;
p1cpoints:=0;
p2points:=0;
cpoints:=0;
d1points:=0;
d1points:=0;
repeat
x:='   X   ';
o:='   O   ';
e:='   ­   ';
for i:=1 to 9 do
	begin
	table[i]:=e;
	bool[i]:=false;
	end;
Player1:=false;
Player2:=false;
Comp:=false;
draw:=false;
cursoroff;
randomize();
intro();
escenter();
mode();
readln(p);
	case p of
	1:	begin
		writeln('Your selection is 1.Player1 vs Player2.');
		enter();
		clrscr;
			repeat
			P1();
				if (Player1=false) and (Draw=false) then
				begin
					repeat
					clrscr;
					map();
					writeln();
					write('Player2 choose a number (1-9)');
					readln(y);
						if (y>0) and (y<10) then
							begin
								if (table[y]=o) or (table[y]=x) then 
									begin
						 			writeln('The Block', y ,' is already in use ');
						 			delay(2000);
						 			end;
						 	end
						else wrongbutton();
					until (table[y]=e) ;
				table[y]:=o;
				bool[y]:=true;
				if (table[1]=o) and (table[2]=o) and (table[3]=o) or (table[4]=o) and (table[5]=o) and (table[6]=o) or (table[7]=o) and (table[8]=o) and (table[9]=o) or (table[1]=o) and (table[4]=o) and (table[7]=o) or (table[2]=o) and (table[5]=o) and (table[8]=o) or (table[3]=o) and (table[6]=o) and (table[9]=o) or (table[1]=o) and (table[5]=o) and (table[9]=o) or (table[3]=o) and (table[5]=o) and (table[7]=o) then 
   					begin
   					clrscr;
   					map();
   					writeln('Player2 has won');
   					enter();
   					clrscr;
   					p2points:=p2points+1;
   					Player2:=true;
   					end;
   				end;
   			until (Player1=true) or (Player2=true) or (Draw=true);
   		end;
		2:	begin
			writeln('Your selection is 2.Player1 vs Computer.');
			enter();
			clrscr;
				repeat
				P1();
					if (Player1=false) and (Draw=false) then
						begin
						clrscr;
						map();
						writeln();
						if (table[1]=o) and (table[2]=o) and (table[3]=e) then c:=3
						else if (table[1]=o) and (table[3]=o) and (table[2]=e) then	c:=2
						else if (table[2]=o) and (table[3]=o) and (table[1]=e) then	c:=1
						else if (table[4]=o) and (table[5]=o) and (table[6]=e) then	c:=6
						else if (table[4]=o) and (table[6]=o) and (table[5]=e) then	c:=5
						else if (table[5]=o) and (table[6]=o) and (table[4]=e) then c:=4
						else if (table[7]=o) and (table[8]=o) and (table[9]=e) then c:=9
						else if (table[7]=o) and (table[9]=o) and (table[8]=e) then c:=8
						else if (table[8]=o) and (table[9]=o) and (table[7]=e) then c:=7
						else if (table[1]=o) and (table[4]=o) and (table[7]=e) then c:=7
						else if (table[1]=o) and (table[7]=o) and (table[4]=e) then c:=4
						else if (table[4]=o) and (table[7]=o) and (table[1]=e) then c:=1
						else if (table[2]=o) and (table[5]=o) and (table[8]=e) then c:=8
						else if (table[2]=o) and (table[8]=o) and (table[5]=e) then c:=5
						else if (table[5]=o) and (table[8]=o) and (table[2]=e) then c:=2
						else if (table[3]=o) and (table[6]=o) and (table[9]=e) then c:=9
						else if (table[3]=o) and (table[9]=o) and (table[6]=e) then c:=6
						else if (table[6]=o) and (table[9]=o) and (table[3]=e) then c:=3
						else if (table[1]=o) and (table[5]=o) and (table[9]=e) then c:=9
						else if (table[1]=o) and (table[9]=o) and (table[5]=e) then c:=5
						else if (table[5]=o) and (table[9]=o) and (table[1]=e) then c:=1
						else if (table[3]=o) and (table[5]=o) and (table[7]=e) then c:=7
						else if (table[3]=o) and (table[7]=o) and (table[5]=e) then c:=5
						else if (table[5]=o) and (table[7]=o) and (table[3]=e) then c:=3																				
						else if (table[1]=x) and (table[2]=x) and (table[3]=e) then c:=3
						else if (table[1]=x) and (table[3]=x) and (table[2]=e) then	c:=2
						else if (table[2]=x) and (table[3]=x) and (table[1]=e) then	c:=1
						else if (table[4]=x) and (table[5]=x) and (table[6]=e) then	c:=6
						else if (table[4]=x) and (table[6]=x) and (table[5]=e) then	c:=5
						else if (table[5]=x) and (table[6]=x) and (table[4]=e) then c:=4
						else if (table[7]=x) and (table[8]=x) and (table[9]=e) then c:=9
						else if (table[7]=x) and (table[9]=x) and (table[8]=e) then c:=8
						else if (table[8]=x) and (table[9]=x) and (table[7]=e) then c:=7
						else if (table[1]=x) and (table[4]=x) and (table[7]=e) then c:=7
						else if (table[1]=x) and (table[7]=x) and (table[4]=e) then c:=4
						else if (table[4]=x) and (table[7]=x) and (table[1]=e) then c:=1
						else if (table[2]=x) and (table[5]=x) and (table[8]=e) then c:=8
						else if (table[2]=x) and (table[8]=x) and (table[5]=e) then c:=5
						else if (table[5]=x) and (table[8]=x) and (table[2]=e) then c:=2
						else if (table[3]=x) and (table[6]=x) and (table[9]=e) then c:=9
						else if (table[3]=x) and (table[9]=x) and (table[6]=e) then c:=6
						else if (table[6]=x) and (table[9]=x) and (table[3]=e) then c:=3
						else if (table[1]=x) and (table[5]=x) and (table[9]=e) then c:=9
						else if (table[1]=x) and (table[9]=x) and (table[5]=e) then c:=5
						else if (table[5]=x) and (table[9]=x) and (table[1]=e) then c:=1
						else if (table[3]=x) and (table[5]=x) and (table[7]=e) then c:=7
						else if (table[3]=x) and (table[7]=x) and (table[5]=e) then c:=5
						else if (table[5]=x) and (table[7]=x) and (table[3]=e) then c:=3							
						else begin
								repeat									
								c:=random(9)+1;
								until (table[c]=e);
							end;
						CompNumb();	
						if (table[1]=o) and (table[2]=o) and (table[3]=o) or (table[4]=o) and (table[5]=o) and (table[6]=o) or (table[7]=o) and (table[8]=o) and (table[9]=o) or (table[1]=o) and (table[4]=o) and (table[7]=o) or (table[2]=o) and (table[5]=o) and (table[8]=o) or (table[3]=o) and (table[6]=o) and (table[9]=o) or (table[1]=o) and (table[5]=o) and (table[9]=o) or (table[3]=o) and (table[5]=o) and (table[7]=o) then 
   							begin
   							clrscr;
   							map();
   							writeln('Computer has won');
   							enter();
   							clrscr;
   							cpoints:=cpoints+1;
   							Comp:=true;
   							end;
   						end;
				until (Player1=true) or (Comp=true) or (Draw=true);
			end
			else	wrongbutton();
		end;	
until (yesorno=#89) or (yesorno=#121);
end.
 