unit comproc;

interface

uses ComTypes, SysUtils, Dbtables, Dialogs, Classes;

const
  K2 = '.'+Chr(1)+'F%'+Chr(255)+'�,��n'+Chr(5)+'t�Uz?Cd@#$'+Chr(9)+'��D��S��Fdt nj� '+Chr(10)+'y#$%dsfs@'+Chr(0)+
  'd�f�4�!@����'+Chr(1)+'��()$!���'+Chr(3)+'_d�s���$'+Chr(13)+'���;'+Chr(10)+'l�����k4'+Chr(3)+'��'+
  Chr(1)+'�-0�'+Chr(255)+'i'+Chr(8)+'�o';

function Crypt(Source: String): TPassString;
Procedure LightCrypt(Source: String; var Buffer : PChar);
Function LightDeCrypt(var Buffer : PChar; size : integer):string;

  // ���������� ������
function DeCrypt(Source: TPassString): String;
  // ������������ ������
function iif(Logic, Val1, Val2: Variant): Variant;
  // � ����������� �� logic ������ ���� Val1, ���� Val2
  // ������� ��������� ���������� � ����� ������

procedure CryptStream(Source: TMemoryStream; var Dest : TMemoryStream);
procedure DeCryptStream(Source: TMemoryStream; var Dest : TMemoryStream);

procedure DelSpaces(var s: string);
  // ��������� ������� �� ������ ������ �������

implementation

uses Forms;

//============= FUNCTIONS =============


Procedure LightCrypt(Source: String; var Buffer : PChar);
var
  TmpRandom: Byte;
  TmpStr, Key: String;
  I, B: Integer;
begin
  for I := 0 to Length(Source)-1 do
    Buffer[i] := Source[I+1];
end;

Function LightDeCrypt(var Buffer : PChar; size : integer):string;
var
  TmpRandom: Byte;
  TmpStr, Key: String;
  I, B: Integer;
begin
  TmpStr := '';
  for I := 0 to size-1 do
    TmpStr := TmpStr + Buffer[I];
  Result := TmpStr;
end;


function Crypt(Source: String): TPassString;
var
  TmpRandom: Byte;
  TmpStr, Key: String;
  I, B: Integer;
begin
  TmpStr := '';
  Key := K;
  Randomize;
  TmpRandom := Random(25) + $9E;
  SetLength(TmpStr, Length(Key) + 2);
  TmpStr[5] := Chr(not TmpRandom);
  TmpStr[13] := Chr(Length(Source) xor TmpRandom);
  for I := 1 to Length(Key) do
  begin
    if I < 5 then B := 0 else if I < 12 then B := 1 else B := 2;
    if I <= Length(Source) then
      TmpStr[I + B] := Chr((Ord(Source[I]) xor Ord(Key[I])) xor TmpRandom)
    else TmpStr[I + B] := Chr(Ord(Key[I]) xor TmpRandom);
  end;
  Result := TmpStr;
//  Result := TmpStr;
end;

procedure DeCryptStream(Source: TMemoryStream; var Dest : TMemoryStream);
var
  TmpRandom, D, B: Byte;
  Key: String;
  L, J : Integer;
  Buf,BufOut : array [1..1000] of Byte;
begin
  Key := K2;
  L := Length(Key);
  J := 1;
  Source.Read(TmpRandom,1);
  while Source.Position < (Source.Size-L) do
  begin
    Source.Read(Buf,L);
    for J := 1 to L do
     BufOut[J] :=  TmpRandom xor Ord(Key[J]) xor Buf[J];
    Dest.Write(BufOut,L);
  end;
  J := 1;
  while Source.Position < Source.Size do
  begin
    Source.Read(B,1);
     D :=  TmpRandom xor Ord(Key[J]) xor B;
    Dest.Write(D,1);
    Inc(J);
    if J>Length(Key) then J:=1;
  end;
end;

procedure CryptStream(Source: TMemoryStream; var Dest : TMemoryStream);
var
  TmpRandom, D, B: Byte;
  Key: String;
  L, J : Integer;
  Buf,BufOut : array [1..1000] of Byte;
begin
  Randomize;
  TmpRandom := Random(25) + $9E;
  Key := K2;
  L := Length(Key);
  J := 1;
  Dest.Write(TmpRandom,1);
  while Source.Position < (Source.Size-L) do
  begin
    Source.Read(Buf,L);
    for J := 1 to L do
     BufOut[J] :=  TmpRandom xor Ord(Key[J]) xor Buf[J];
    Dest.Write(BufOut,L);
  end;
  J := 1;
  while Source.Position < Source.Size do
  begin
    Source.Read(B,1);
     D :=  TmpRandom xor Ord(Key[J]) xor B;
    Dest.Write(D,1);
    Inc(J);
    if J>Length(Key) then J:=1;
  end;
end;

function DeCrypt(Source: TPassString): String;
var
  TmpRandom: Byte;
  TmpStr, Key: String;
  I, ResLength, B: Integer;
begin
  TmpStr := '';
  Key := K;
  TmpRandom := not Ord(Source[5]);
  ResLength := Ord(Source[13]) xor TmpRandom;
  for I := 1 to ResLength do
  begin
    if I < 5 then B := 0 else if I < 12 then B := 1 else B := 2;
    TmpStr := TmpStr + Chr(Ord(Source[I + B]) xor TmpRandom xor Ord(Key[I]));
  end;
  Result := TmpStr;
end;

function iif(Logic, Val1, Val2: Variant): Variant;
begin
  if Logic then Result := Val1 else Result := Val2;
end;

//============= PROCEDURES =============

procedure DelSpaces;
Var
  State: (AfterSpace, WaitSpace);
  i, j: Integer;
begin
  State := AfterSpace; j := 0;
  for i := 1 to Length(s) do
    begin
      case State of
        AfterSpace:
          begin
            if s[i]<>' ' then
              begin
                Inc(j);
                s[j] := s[i];
                State := WaitSpace;
              end;
          end;
        WaitSpace:
          begin
            Inc(j);
            s[j] := s[i];
            if s[i]=' ' then
              State := AfterSpace;
          end;
      end;
    end;
  if (j<>0)and(s[j]=' ') then
    SetLength(s, j-1)
   else
    SetLength(s, j);
  s := AnsiUpperCase(s);
end;

end.
