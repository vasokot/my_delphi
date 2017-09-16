unit f_NETsrch;

interface

uses
  Unit1,
  f_DHCPFile,
  SNMPsend,
  asn1util,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, ExtCtrls, Menus;

type
  TSrchForm = class(TForm)
    Panel1: TPanel;
    RezSG: TAdvStringGrid;
    Panel2: TPanel;
    Button1: TButton;
    endEd: TEdit;
    startEd: TEdit;
    mainEd: TEdit;
    Label1: TLabel;
    PUM: TPopupMenu;
    SD: TSaveDialog;
    SaveasCVS1: TMenuItem;
    Label2: TLabel;
    NLab: TLabel;
    Savegridtodhcpconf1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure RezSGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
     procedure SaveasCVS1Click(Sender: TObject);
    procedure Savegridtodhcpconf1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SrchForm: TSrchForm;

implementation

{$R *.dfm}

procedure TSrchForm.Button1Click(Sender: TObject);
var
sname, sfirm, sdevi, snum, saddr, es, mip: AnsiString;
n, sip, i, i2: integer;
begin
RezSG.Clear;
REzSG.RowCount:=5;

es:=Trim(mainEd.Text);
mainEd.Text:=es;

es:=Trim(startEd.Text);
startEd.Text:=es;

es:=Trim(endEd.Text);
endEd.Text:=es;

 if StrToInt(startEd.Text) <= 0
  then
    begin
    ShowMessage('Начальный ip введён не верно');
    Exit;
    end;
 if StrToInt(endEd.Text) <= 0
  then
   begin
   ShowMessage('Последний ip введён не верно');
   Exit;
   end;
 if StrToInt(startEd.Text) > StrToInt(endEd.Text)
  then
    begin
    ShowMessage('Последний ип должен быть больше начального');
    Exit;
    end;



  n:=0;
  RezSG.Cells[0,0]:='IP';
  RezSG.Cells[1,0]:='NAME';
  RezSG.Cells[2,0]:='Firmware';
  RezSG.Cells[3,0]:='Type';
  RezSG.Cells[4,0]:='Serial Number';
  RezSG.Cells[5,0]:='MAC Addres';
  RezSG.Cells[6,0]:='Ping';

  i2:= StrToInt(endEd.Text)-StrToInt(startEd.Text);
  RezSG.RowCount:=i2 + 3;

  for i:=0 to i2 do
    begin
    sip:= StrToInt(startEd.Text)+i;
    mip:= mainEd.Text + IntToStr(sip);

    If not MainForm.ItIsIP(mip)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;


    //-----записываем ip коммутатора--------------------------
    RezSG.Cells[0,i+1]:= mip;

   //-----пингуется ли коммутатор?----------------------------
    MainForm.PingCl.Host:=mip;
    MainForm.PingCl.Ping;
    if MainForm.PingCl.ReplyStatus.TimeToLive = 0
     then
        begin
           RezSG.CellProperties[6,i+1].FontColor:=clRed;
           RezSG.Cells[6,i+1]:= 'DOWN';
           Continue;
        end
     else
        begin
           n:=n+1;
           RezSG.CellProperties[6,i+1].FontColor:=clGreen;
           RezSG.Cells[6,i+1]:='UP(' + IntToStr(MainForm.PingCl.ReplyStatus.TimeToLive) + ')';
        end;


    //------------имя коммутатора----_------------------------
    if SNMPGet(names,coms,mip,sname)
        then RezSG.Cells[1,i+1] := sname
        else RezSG.Cells[1,i+1] := 'Connection error';

    //--------------firmware----------------------------------
    if SNMPGet(firm,coms,mip,sfirm)
        then RezSG.Cells[2,i+1]:=  sfirm
        else RezSG.Cells[2,i+1]:= 'error';

    //--------------Тип Коммутатора---------------------------
    if SNMPGet(devi,coms,mip,sdevi)
        then RezSG.Cells[3,i+1]:= sdevi
        else RezSG.Cells[3,i+1]:= 'error';

    //--------------Serial Number Коммутатора---------------------------
    if SNMPGet(serialnum,coms,mip,snum)
        then RezSG.Cells[4,i+1]:= snum
        else RezSG.Cells[4,i+1]:= 'error';

    //--------------MAC Addres Коммутатора---------------------------
    if SNMPGet(macaddr,coms,mip,saddr)
        then RezSG.Cells[5,i+1]:= saddr
        else RezSG.Cells[5,i+1]:= 'error';



    end;

 NLab.Caption:=IntToStr(n);

end;




procedure TSrchForm.RezSGMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  P:=GetClientOrigin;
  if Button = mbRight then PUM.Popup(x+P.X+RezSG.Left,y+P.Y+REzSG.Top);
end;

procedure TSrchForm.SaveasCVS1Click(Sender: TObject);
var
s : string;

begin
SD.FileName:= mainEd.Text + startEd.Text + '-' + endEd.Text;
SD.Title:='Сохранить таблицу как...(тип файла можно выбрать)';

if SD.Execute then
    begin

    if SD.FilterIndex = 1 then RezSG.SaveToXLS(SD.FileName + '.xls');
    if SD.FilterIndex = 2 then RezSG.SaveToCSV(SD.FileName + '.csv');

    end;

end;



procedure TSrchForm.Savegridtodhcpconf1Click(Sender: TObject);
var
i,y: integer;


begin

 DHCPForm.Memo1.Clear;
 y:=StrToInt(endEd.Text)-StrToInt(startEd.Text);

for i := 0 to y do
  begin
  if RezSG.Cells[6,i+1]= 'DOWN' then Continue;

  DHCPForm.Memo1.Lines.Add('#===================================================================');
  DHCPForm.Memo1.Lines.Add('host ' + RezSG.Cells[1,i+1]+ ' { #  ' + RezSG.Cells[3,i+1] + '   ' + RezSG.Cells[4,i+1]);
  DHCPForm.Memo1.Lines.Add('hardware ethernet '+ RezSG.Cells[5,i+1] + ';');
  DHCPForm.Memo1.Lines.Add('fixed-address '+ RezSG.Cells[0,i+1] + ';');
  DHCPForm.Memo1.Lines.Add('}');
  DHCPForm.Memo1.Lines.Add('  ');


  end;

DHCPForm.Show;

end;

end.
