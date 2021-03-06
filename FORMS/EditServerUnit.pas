unit EditServerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, HtmlHlp;

type
  TEditServerForm = class(TForm)
    TabControl1: TTabControl;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ServerName: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    MainPort1: TEdit;
    Label17: TLabel;
    MainPort2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    Edit1: TEdit;
    IP1: TEdit;
    IP2: TEdit;
    IP3: TEdit;
    IP4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure IP1KeyPress(Sender: TObject; var Key: Char);
    procedure IP2KeyPress(Sender: TObject; var Key: Char);
    procedure IP3KeyPress(Sender: TObject; var Key: Char);
    procedure IP4KeyPress(Sender: TObject; var Key: Char);
    procedure MainPort1KeyPress(Sender: TObject; var Key: Char);
    procedure MainPort2KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure MainPort1Change(Sender: TObject);
    procedure IP1Change(Sender: TObject);
    procedure IP2Change(Sender: TObject);
    procedure IP3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    i1, i2, i3, i4 : string;
  end;

var
  EditServerForm: TEditServerForm;

implementation

{$R *.DFM}

procedure TEditServerForm.Button1Click(Sender: TObject);
var
 i : integer;
begin
 if length(Edit1.Text)=0 then
 begin
  ShowMessage('������� ������������ �������.');
  ModalResult := mrNone;
  Exit;
 end;
 try
  if Length(IP1.Text)>0 then i := StrToInt(IP1.Text);
  if Length(IP2.Text)>0 then i := StrToInt(IP2.Text);
  if Length(IP3.Text)>0 then i := StrToInt(IP3.Text);
  if Length(IP4.Text)>0 then i := StrToInt(IP4.Text);
 except
  ShowMessage('�������� IP ������ ��������� �����������.');
  ModalResult := mrNone;
  Exit;
 end;
 try
  i := StrToInt(MainPort1.Text);
  i := StrToInt(MainPort2.Text);
 except
  ShowMessage('�������� ������ ��������� �����������.');
  ModalResult := mrNone;
  Exit;
 end;
 ModalResult := mrOK;
end;

procedure TEditServerForm.IP1KeyPress(Sender: TObject; var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.IP2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.IP3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.IP4KeyPress(Sender: TObject; var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.MainPort1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.MainPort2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key='0') or (key='1') or
 (key='2') or (key='3') or
 (key='4') or (key='5') or
 (key='6') or (key='7') or
 (key='8') or (key='9') then
 else
   key:=chr($0);
end;

procedure TEditServerForm.RadioButton2Click(Sender: TObject);
begin
 IP1.Text := '';
 IP2.Text := '';
 IP3.Text := '';
 IP4.Text := '';
end;

procedure TEditServerForm.RadioButton1Click(Sender: TObject);
begin
 ServerName.Text := '';
end;

procedure TEditServerForm.MainPort1Change(Sender: TObject);
begin
 try
  MainPort2.Text := IntToStr(StrToInt(MainPort1.Text) + 1);
 except
 end;
end;

procedure TEditServerForm.IP1Change(Sender: TObject);
begin
 if IP1.GetTextLen = 3 then IP2.SetFocus;
end;

procedure TEditServerForm.IP2Change(Sender: TObject);
begin
 if IP2.GetTextLen = 3 then IP3.SetFocus;
end;

procedure TEditServerForm.IP3Change(Sender: TObject);
begin
 if IP3.GetTextLen = 3 then IP4.SetFocus;
end;

procedure TEditServerForm.FormShow(Sender: TObject);
begin
 IP1.Text := i1;
 IP2.Text := i2;
 IP3.Text := i3;
 IP4.Text := i4;
 Edit1.SetFocus;
end;

procedure TEditServerForm.Button3Click(Sender: TObject);
begin
 HtmlHelp(Application.Handle, PChar(ExtractFilePath(paramstr(0))+'qeditor.chm::/html/par_rem2.htm'), HH_DISPLAY_TOC, 0);
end;

end.
