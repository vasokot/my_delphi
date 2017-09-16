unit f_MacSrch;

interface

uses
  Unit1,
  mmsystem,
  SNMPsend,
  asn1util,
  WideStrUtils,
  RegularExpressionsAPI,
  RegularExpressionsCore,
  RegularExpressionsConsts,
  RegularExpressions,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient, Mask;

type
  TMacSrchForm = class(TForm)
    MacIpSt: TEdit;
    MacIpEnd: TEdit;
    MacEd: TEdit;
    MacSRchBtn: TButton;
    MacIPSG: TAdvStringGrid;
    png: TIdIcmpClient;
    vlEd: TEdit;
    SprLbl: TLabel;
    uvlanLbl: TLabel;
    MacLbl: TLabel;
    DotLbl: TLabel;
    MacIpEd: TEdit;
    MacSubNet: TEdit;
    Edit1: TEdit;
    procedure MacSRchBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MacSrchForm: TMacSrchForm;

implementation

{$R *.dfm}

procedure TMacSrchForm.MacSRchBtnClick(Sender: TObject);
var
i,n,z : integer;
mac,mac1,oid,oid1,my_ip : string;
regs : TRegEx;
sis,sis1: Ansistring;

begin
MacIPSG.ClearAll;
mac:='';
mac1:='';
i := 0;
n := 1;

if StrToInt(trim(MacIpSt.Text)) > StrToInt(trim(MacIpEnd.Text)) then Exit;
mac:= trim(MacEd.Text);
if length(mac) < 12 then Exit;

mac:= StringReplace(mac,'.','',[rfReplaceAll, rfIgnoreCase]);
mac:= StringReplace(mac,'-','',[rfReplaceAll, rfIgnoreCase]);
mac:= StringReplace(mac,':','',[rfReplaceAll, rfIgnoreCase]);
MAcEd.Text := mac;
if length(mac) <> 12 then Exit;

mac1:=IntToSTr(StrToInt('$'+Copy(mac,1,2))) + '.'
    + IntToSTr(StrToInt('$'+Copy(mac,3,2))) + '.'
    + IntToSTr(StrToInt('$'+Copy(mac,5,2))) + '.'
    + IntToSTr(StrToInt('$'+Copy(mac,7,2))) + '.'
    + IntToSTr(StrToInt('$'+Copy(mac,9,2))) + '.'
    + IntToSTr(StrToInt('$'+Copy(mac,11,2)));

MacEd.Hint:= mac1;
oid:='1.3.6.1.2.1.17.7.1.2.2.1.2.'+ vlEd.Text + '.' + mac1;
Edit1.Text := oid;
oid1:='1.3.6.1.2.1.17.1.2.0';
for i := StrToInt(trim(MacIpSt.Text)) to StrToInt(trim(MacIpEnd.Text)) do
  begin
    my_ip := MacIpEd.Text + MacSubNet.Text + '.' + IntToStr(i);
    if MacIPSG.RowCount = n then MAcIPSG.RowCount:= MacIPSG.RowCount + 1;
    if regs.IsMatch(my_ip,'((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)')
    then
     begin
       png.host := my_ip;
       png.Ping;
       if png.ReplyStatus.TimeToLive > 0
        then
          bEgin
           if SNMPGet(oid1,coms,my_ip,sis1)
              then
                begin
                 MacIpSG.Cells[0,n] := sis1;
                end;

            if SNMPGet(oid,coms,my_ip,sis)
              then
                begin
                 MacIPSG.Cells[1,n] := my_ip;
                 MacIpSG.Cells[2,n] := sis;
                 n:= n+1;
                end;
          end;

     end;

  end;


for i := 1 to MacIPSG.RowCount-2 do
   begin
   z:= StrToInt(MacIPSG.Cells[0,i]) div 8;
   if ((Length(MacIPSG.Cells[2,i]) >0) AND (Length(MacIPSG.Cells[0,i]) >0)) then
   if StrToInt(MacIPSG.Cells[2,i]) <= z*8
          then
           begin
             MacIPSG.CellProperties[1,i].FontColor:=clRed;
             MacIPSG.CellProperties[2,i].FontColor:=clRed;
             MacIPSG.CellProperties[1,i].FontSize:= 12;
             MacIPSG.CellProperties[2,i].FontSize:= 12;
           end;



   end;


end;

end.
