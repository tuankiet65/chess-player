{This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.}
{*-------------------------------------------------------------------------*}
program chessplayer;
uses crt;
var chessboard: array [1..8, 1..8] of string;
    i, i2: longint;
    bmove, emove: string[2];
    lose: boolean;
{*-------------------------------------------------------------------------*}
procedure printboard;
 begin
  writeln('    a    b    c    d    e    f    g    h   ');
  writeln('  +----+----+----+----+----+----+----+----+');
  for i:=1 to 8 do begin
   write(i, ' ');
   for i2:=1 to 8 do begin
    write('|');
    if length(chessboard[i][i2])=0 then
     write('    ')
    else
     if length(chessboard[i][i2])=1 then
      write('  ', chessboard[i][i2], ' ')
     else
      write(' ', chessboard[i][i2], ' ');
   end;
   write('|');
   write(' ', i);
   writeln;
   writeln('  +----+----+----+----+----+----+----+----+');
  end;
  writeln('    a    b    c    d    e    f    g    h   ');
 end;
{*-------------------------------------------------------------------------*}
procedure boardinit;
 begin
  chessboard[8][1]:='DX';
  chessboard[8][2]:='DM';
  chessboard[8][3]:='DT';
  chessboard[8][4]:='DH';
  chessboard[8][5]:='DV';
  chessboard[8][6]:='DT';
  chessboard[8][7]:='DM';
  chessboard[8][8]:='DX';
  for i:=1 to 8 do chessboard[7][i]:='D';
  chessboard[1][1]:='TX';
  chessboard[1][2]:='TM';
  chessboard[1][3]:='TT';
  chessboard[1][4]:='TH';
  chessboard[1][5]:='TV';
  chessboard[1][6]:='TM';
  chessboard[1][7]:='TT';
  chessboard[1][8]:='TX';
  for i:=1 to 8 do chessboard[2][i]:='T';
 end;
{*-------------------------------------------------------------------------*}
procedure convertmove (basebegin, baseend: string);
 begin
  for i:=1 to 2 do begin
   case ord(upcase(bmove[i])) of
    65: bmove[i]:='1';
    66: bmove[i]:='2';
    67: bmove[i]:='3';
    68: bmove[i]:='4';
    69: bmove[i]:='5';
    70: bmove[i]:='6';
    71: bmove[i]:='7';
    72: bmove[i]:='8';
   end;
   case ord(upcase(emove[i])) of
    65: emove[i]:='1';
    66: emove[i]:='2';
    67: emove[i]:='3';
    68: emove[i]:='4';
    69: emove[i]:='5';
    70: emove[i]:='6';
    71: emove[i]:='7';
    72: emove[i]:='8';
   end;
  end;
 end;
{*-------------------------------------------------------------------------*}
procedure checklose;
 begin
  for i:=1 to 8 do begin
   for i2:=1 to 8 do begin
    if (chessboard[i][i2]='DV') or (chessboard[i][i2]='TV') then
     lose:=false
    else
     lose:=true;
   end;
  end;
 end;
{*-------------------------------------------------------------------------*}
begin
 clrscr;
 boardinit;
 writeln('Chess player');
 writeln('Press enter to begin');
 readln;
 clrscr;
 writeln('Press enter to print the chess board');
 readln;
 clrscr;
 printboard;
 writeln;
 writeln;
 while lose<>true do begin
  checklose;
  writeln('Choose your move: ');
  readln(bmove);
  writeln('To where?: ');
  readln(emove);
  convertmove(bmove, emove);
  readln;
 end;
end.
