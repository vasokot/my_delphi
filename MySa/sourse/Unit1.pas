unit Unit1;

interface

uses
  iniFiles,
  SNMPsend,
  asn1util,
  Clipbrd,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls, Menus,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient,
  AdvObj, ExtCtrls, tmsAdvGridExcel, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection ;

type
   table = record
     port : string;
     mac : string;
     mtype : string;
     vid : string;
   end;

   itable = record
     imp_ip : string;
     imp_mac : string;
     imp_port : string;
     imp_status : string;
     imp_type : string;
   end;

   dtable = record
      dhcp_ip : string;
      dhcp_mac : string;
      dhcp_port : string;
      dhcp_time : string;
      dhcp_status : string;
   end;

   import = record
      state :string;
      zeroip :string;
      fwdhcp :string;
      max_entry :string;
   end;

    mbltable = record
      vid :string;
      mac :string;
      vlname :string;
      port:string;
      mtype:string;
      status:string;
   end;


  TMainForm = class(TForm)
    SysGB: TGroupBox;
    PortSL: TAdvStringGrid;
    DTEdit: TEdit;
    SNEdit: TEdit;
    RFbtn: TButton;
    Edit4: TEdit;
    NPEdit: TEdit;
    Edit7: TEdit;
    DPEdit: TEdit;
    NSEdit: TEdit;
    PSLPopUp: TPopupMenu;
    Btn1: TMenuItem;
    DownUP1: TMenuItem;
    PingCl: TIdIcmpClient;
    NTPSet: TButton;
    DSEdit: TEdit;
    MainPanel: TPanel;
    IPEdit: TEdit;
    Button6: TButton;
    PortClBtn: TButton;
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    Connect1: TMenuItem;
    Exit1: TMenuItem;
    Ser1: TMenuItem;
    Options1: TMenuItem;
    About1: TMenuItem;
    Button7: TButton;
    Button8: TButton;
    IMPSgSd: TFileSaveDialog;
    DHCPSgSd: TFileSaveDialog;
    MbSgSd: TFileSaveDialog;
    DHCPEx: TAdvGridExcelIO;
    MbEx: TAdvGridExcelIO;
    ImpPopUp: TPopupMenu;
    MenuItem1: TMenuItem;
    DHCPPopUp: TPopupMenu;
    MenuItem2: TMenuItem;
    MbPopUp: TPopupMenu;
    MenuItem3: TMenuItem;
    ZC_MDB: TZConnection;
    ZQ_MDB: TZQuery;
    Net1: TMenuItem;
    SerNEdit: TEdit;
    MACEd: TEdit;
    FWEdit: TEdit;
    HWEdit: TEdit;
    PortSLMag: TAdvStringGrid;
    PortSL1: TAdvStringGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MacGB: TGroupBox;
    GetBtn: TButton;
    ClearMacBtn: TButton;
    MacEdit: TEdit;
    FindBtn: TButton;
    Button5: TButton;
    MACSG: TAdvStringGrid;
    TabSheet2: TTabSheet;
    IMPPORTSG: TAdvStringGrid;
    TabSheet3: TTabSheet;
    IMPSG: TAdvStringGrid;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DHCPSG: TAdvStringGrid;
    MBSG: TAdvStringGrid;
    GetImpBtn: TButton;
    ClearBtn: TButton;
    MacPopUp: TPopupMenu;
    ExporttoExcell1: TMenuItem;
    MacSgSd: TFileSaveDialog;
    MACSGEx: TAdvGridExcelIO;
    ImpEx: TAdvGridExcelIO;
    MBSrch: TMenuItem;
    Button3: TButton;
    MacSrch1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure GetBtnClick(Sender: TObject);
    procedure WriteStringsToGrid(const i : integer; const str: array of
    string; grd : TStringGrid);
    procedure MACSGGetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aSuffix: String);
    procedure PortSLClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ClearMacBtnClick(Sender: TObject);
    procedure GetImpBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure RFbtnClick(Sender: TObject);
    procedure PortSLRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure DownUP1Click(Sender: TObject);
    procedure DHCPSGGetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aSuffix: String);
    procedure DHCPSGCustomCompare(Sender: TObject; str1, str2: String;
      var Res: Integer);
    procedure IMPSGGetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aSuffix: String);
    procedure NPEditDblClick(Sender: TObject);
    procedure NSEditDblClick(Sender: TObject);
    procedure DPEditDblClick(Sender: TObject);
    procedure NPEditExit(Sender: TObject);
    procedure DPEditExit(Sender: TObject);
    procedure NSEditExit(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure NTPSetClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure PortClBtnClick(Sender: TObject);
    procedure ExporttoExcell1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure PortSLPopUp(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure IMPPORTSGGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure IMPPORTSGComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: string);
    procedure FormShow(Sender: TObject);
    procedure IPEditKeyPress(Sender: TObject; var Key: Char);
    function ItIsIp(str:string):boolean;
    function MACtohex( arpmac : ansistring): ansistring;
    function StrToMac(str : string) : string;

    procedure Net1Click(Sender: TObject);
    procedure MBSrchClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MacSrch1Click(Sender: TObject);

     private
     {Private declarations }
  public
    { Public declarations }
  end;

const
macs: string =   '1.3.6.1.2.1.17.4.3.1.1';
ports: string =  '1.3.6.1.2.1.17.7.1.2.2.1.2';
types: string =  '1.3.6.1.2.1.17.7.1.2.2.1.3';
names: string =  '1.3.6.1.2.1.1.5.0';
states: string = '1.3.6.1.2.1.2.2.1.8.';
inerr: string =  '1.3.6.1.2.1.2.2.1.14.';
outerr: string = '1.3.6.1.2.1.2.2.1.20.';
adms: string =   '1.3.6.1.2.1.2.2.1.7.';
portsp: string = '1.3.6.1.2.1.31.1.1.1.15.';


clrm: string =   '1.3.6.1.2.1.16.19.2';
firm: string =   '1.3.6.1.2.1.16.19.2.0';
hardm: string =  '1.3.6.1.2.1.16.19.3.0';

devi: string =   '1.3.6.1.2.1.1.1.0';
serialnum: string = '1.3.6.1.4.1.171.12.1.1.12.0';
macaddr: string = '1.3.6.1.4.1.171.12.42.3.2.5.0';

imp:  string = '1.3.6.1.4.1.171.12.23.4.1.1.2';
imps: string = '1.3.6.1.4.1.171.12.23.4.1.1.5';
impt: string = '1.3.6.1.4.1.171.12.23.4.1.1.6';

imp_port_state: string = '1.3.6.1.4.1.171.12.23.3.2.1.2.';
imp_port_zeroip: string = '1.3.6.1.4.1.171.12.23.3.2.1.3.';
imp_port_dhcp: string = '1.3.6.1.4.1.171.12.23.3.2.1.4.';
imp_port_max: string = '1.3.6.1.4.1.171.12.23.3.2.1.5.';


dhcp: string =   '1.3.6.1.4.1.171.12.23.4.3.1.2';
dhcp_t: string = '1.3.6.1.4.1.171.12.23.4.3.1.3';
dhcp_p: string = '1.3.6.1.4.1.171.12.23.4.3.1.4';
dhcp_s: string = '1.3.6.1.4.1.171.12.23.4.3.1.5';

ntp_e: string = '1.3.6.1.4.1.171.12.10.11.1.0';
ntp_sp: string = '1.3.6.1.4.1.171.12.10.11.3.0';
ntp_ss: string = '1.3.6.1.4.1.171.12.10.11.4.0';

dhcpr_e: string = '1.3.6.1.4.1.171.12.42.1.1.0';
dhcpr_s: string = '1.3.6.1.4.1.171.12.42.3.1.1.2';

reboot: string = '1.3.6.1.4.1.171.12.1.2.3.0'; //3 - warmstart
save: string = '1.3.6.1.4.1.171.12.1.2.6.0'; //5 - all, 4 log

port_ad: string = '.1.3.6.1.4.1.171.11.63.11.2.2.2.1.3.';

macblock_vid: string = '1.3.6.1.4.1.171.12.23.4.2.1.1';
macblock_mac: string = '1.3.6.1.4.1.171.12.23.4.2.1.2';
macblock_vlname: string = '1.3.6.1.4.1.171.12.23.4.2.1.3';
macblock_port: string = '1.3.6.1.4.1.171.12.23.4.2.1.4';
macblock_type: string = '1.3.6.1.4.1.171.12.23.4.2.1.5';
macblock_status: string = '1.3.6.1.4.1.171.12.23.4.2.1.7';


var
  MainForm: TMainForm;
  portnum : integer;
  mactable : array [1..1000] of table;
  imptable : array [1..50] of itable;
  dhcptable : array [1..50] of dtable;
  iporttable : array [1..24] of import;
  mbtable:array [1..50] of mbltable;
  portn : integer;
  coms,comrw,username : string;
  implementation

uses f_Settings, f_Connection, f_NETsrch, f_MacBlock, f_MacSrch;

{$R *.dfm}

function TMainForm.ItIsIp(str:string):boolean;
var
k:boolean;
i,z:integer;
st:TStringList;
begin
k:=true;
st := TStringlist.Create;
st.Delimiter:='.';
st.DelimitedText:=str;
if st.Count = 4
 then
  begin
   for i:=0 to 3 do
    try
      z := StrToInt(st.Strings[i]);
      if (z > 255) or(z < 0) then k:=false;
    except
      k:=false;
    end;
  end
 else k:=false;
result:=k;
end;

function IntToMac(str:string):string;
var
s:string;
begin
s:=Format('%x',[StrToInt(str)]);
if Length(s) < 2 then s:= '0' + s ;
result:=s;
end;


function tohex( str : string): string;
var
TS : TStringList;
c,i: integer;
z2,z: string;
begin
  TS := TStringList.Create;
  TS.Delimiter := '.';
  TS.DelimitedText := str;
  for i := 0 to TS.Count - 1 do
   begin
    z:=z + IntToMAC(TS.Strings[i]);
    if(i<TS.Count-1) then z:=z+':';
   end;
  result:=AnsiLowerCase(z);
  TS.Destroy;
  end;

function TMainForm.StrToMac(str : string) : string;
var
i:integer;
s,s0,s1,s2: string;
begin
s0:=Trim(str);
s:=AnsiLowerCase(s0);


  for i:=1 to Length(s) do
   begin
      if (Ord(s[i]) > 47) and (Ord(s[i])<58) then s1:=s1+s[i];
      if (Ord(s[i]) > 96 ) and (Ord(s[i])<103) then s1:=s1+s[i];
      //перевод на английский
      if s[i]='а' then s1:=s1+'a';
      if s[i]='с' then s1:=s1+'c';
      if s[i]='е' then s1:=s1+'e';
      if s[i]='o' then s1:=s1+'0';
      if s[i]='о' then s1:=s1+'0';
      if s[i]='в' then s1:=s1+'b';
    end;
if Length(s1) = 12
  then s2:=   Copy(s1,1,2) + ':'
            + Copy(s1,3,2) + ':'
            + Copy(s1,5,2) + ':'
            + Copy(s1,7,2) + ':'
            + Copy(s1,9,2) + ':'
            + Copy(s1,11,2)
  else s2:='00:00:00:00:00:00';

result:=AnsiLowerCase(s2);

end;

function TMainForm.MACtohex( arpmac : ansistring): ansistring;
var
i,k: integer;
z: ansistring;
begin
for i:=1 to Length(arpmac)do
    begin
    k:=ord(arpmac[i]);
    z:=z + format('%16x',[k]);
    end;
 result:=z;
end;



procedure TMainForm.MBSrchClick(Sender: TObject);
begin
MBForm.Show;
end;

procedure TMainForm.GetBtnClick(Sender: TObject);
var
  sttable,toidtable,oidtable,ttable,ptable,mtable:tstringlist;
  sdevi,sname,sp,s,o,v,st,stoid,cm,es,ads,adss: AnsiString;
  i,e,d,k,n:integer;

begin

ClearMacBtn.Click;

es:=Trim(IpEdit.Text);
IPEdit.Text:=es;

If not ItIsIP(IpEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

//---------------------получение мак-таблицы--------------
  //забираем порт
   ptable:=TStringlist.Create;
   oidtable:=TStringlist.Create;
  if SNMPGetTable(ports,coms,IPEdit.Text,ptable,oidtable)
    then
      begin
          for n  := 1 to ptable.count-1 do
               begin
                s := ptable.strings[n];
                Delete(s,1,1);
                Delete(s,Length(s),1);
                o:= oidtable.strings[n];
                Delete(o,1,27);
                v:=Copy(o,1,Pos('.',o)-1);
                Delete(o,1,Pos('.', o));
               // Memo1.Lines.Add(o + ' : ' + s);
                with mactable[n] do
                   begin
                      port := s;
                      vid := v;
                      mac := tohex(o);
                   end
              end
      end
    else
      begin
         MessageDlg('Ошибка при запросе мак-таблицы',mtError,[mbOK],0);
      end;

//забираем тип
   ttable:=TStringlist.Create;
   toidtable:=TStringlist.Create;
  if SNMPGetTable(types,coms,IPEdit.Text,ttable,toidtable)
    then
      begin
           for n  := 1 to ttable.count-1 do
               begin
                if  ttable.strings[n]='"1"' then s:='other';
                if  ttable.strings[n]='"2"' then s:='invalid';
                if  ttable.strings[n]='"3"' then s:='learned';
                if  ttable.strings[n]='"4"' then s:='self';
                if  ttable.strings[n]='"5"' then s:='mgmt';
                with mactable[n] do mtype := s;
                o:= toidtable.strings[n];
                Delete(o,1,27);
                //Memo1.Lines.Add(o + ' : ' + s);
              end

      end
    else
      begin
     MessageDlg('Ошибка при запросе Type MAC',mtError,[mbOK],0);
      end;


WriteStringsToGrid(0,['Port  ', 'VID  ', 'MAC-address  ', 'Type  '], MACSG);
 k:=0;
 for n := 1 to oidtable.count-1 do
  begin
  if  Length(mactable[n].port) < 3 then
     begin
  e:= StrToInt(mactable[n].port);
 if  e < 25 then
       begin
          k:=k+1;
     WriteStringsToGrid(k,[mactable[n].port,
                           mactable[n].vid,
                           mactable[n].mac,
                           mactable[n].mtype], MACSG);
       end
     end;
  end;

ptable.Destroy;
oidtable.Destroy;
toidtable.Destroy;
ttable.Destroy;

end;





procedure TMainForm.WriteStringsToGrid(const i : integer; const str: array of
    string; grd : TStringGrid);
var j : integer;
begin
  if i>= grd.RowCount
  then
    grd.RowCount := i+1;

  if high(str)>= grd.ColCount
  then
    grd.ColCount := high(str)+1;

  for j := 0 to high(str) do
    grd.Cells[j,i] := str[j];
end;




procedure TMainForm.MACSGGetFormat(Sender: TObject; ACol: Integer;
  var AStyle: TSortStyle; var aPrefix, aSuffix: String);
begin
 case
  acol
 of
   0,1:astyle:=ssNumeric;
   2:astyle:=ssAlphabetic;
   3:astyle:=ssAlphabetic;
 end;
end;


procedure TMainForm.MacSrch1Click(Sender: TObject);
begin

MacSrchForm := TMacSrchForm.Create(Self);
MacSrchForm.ShowModal;

end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin
if ImpSgSd.Execute then ImpEx.XLSExport(ImpSgSd.FileName);
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
if DHCPSgSd.Execute then DHCPEx.XLSExport(DHCPSgSd.FileName);
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
if MbSgSd.Execute then MbEx.XLSExport(MbSgSd.FileName);
end;

procedure TMainForm.PortSLClickCell(Sender: TObject; ARow, ACol: Integer);
var
st: string;
n: integer;
begin
portn:=StrToInt(PortSL.Cells[Acol,Arow]);

end;

procedure TMainForm.ClearMacBtnClick(Sender: TObject);
begin
MACSG.RowCount:=2;
MACSG.Clear;
//Memo1.Clear;
WriteStringsToGrid(0,['Port  ', 'VID  ', 'MAC-address  ', 'Type  '], MACSG);

end;


//============Получение свзок IMP и DHCP ===========================
procedure TMainForm.PortSLPopUp(Sender: TObject);
var
ads,s2: AnsiString;
begin
//Port down
ads:=adms + IntToStr(portn);
if SNMPGet(ads,coms, IPEdit.Text, s2)
then
    begin
      if s2 = '2' then Btn1.Caption:='Up';
      if s2 = '1' then Btn1.Caption:='Down';
    end
else  ShowMessage('error');

end;

procedure TMainForm.PortClBtnClick(Sender: TObject);
begin
PortSL.Clear;
PortSL.ColCount:= 12;
PortSL.Width:=376;

SNEdit.Text:='Device Name';
DTEdit.Text:='Device Type';
SNEdit.Text:='Serial Number';
HWEdit.Text:='hardware';
MacEd.Text:='MAC address';
FWEdit.Text:='firmware';
NPEdit.Text:='primary';
NSEdit.Text:='secondary';
DSEdit.Text:='Status';
DPEdit.Text:='IP';


PortSL1.Visible := true;
PortSL1.Clear;

PortSLMag.ColCount:=2;
PortSLMag.Width:=66;
PortSLMag.Left  :=763;
PortSLMag.Clear;

end;

procedure TMainForm.Btn1Click(Sender: TObject);
var
ads,s2: AnsiString;
begin

ads:=adms + IntToStr(portn);
if Btn1.Caption= '&Down' then
     begin
     if SNMPSet(ads,comrw, IPEdit.Text, '2', ASN1_INT)
      then
        begin
          RFBtn.Click;
          ShowMessage('Port '+ IntToStr(portn) + ' down!!!');
        end
          else  ShowMessage('error');

     end;

if Btn1.Caption = '&Up' then
      begin
       if SNMPSet(ads,comrw, IPEdit.Text, '1', ASN1_INT)
          then
            begin
              RFBtn.Click;
              ShowMessage('Port '+ IntToStr(portn) + ' up!!!');
          end
        else  ShowMessage('error');


end;


end;

procedure TMainForm.GetImpBtnClick(Sender: TObject);
var
i,c,c1,c2: integer;
simp, simp1:tstringlist;
oid,stimp,sis,sis0,sis1: Ansistring;
es: string;

begin

ClearBtn.Click;

es:=Trim(IpEdit.Text);
IPEdit.Text:=es;

If not ItIsIP(IpEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

//-----------------------MAC BLOCK LIST----------------------------------
//vid
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_vid,coms,IPEdit.Text,simp,simp1)
   then
     begin
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[i+1] do vid:=sis0;
          end;
     end;
simp.Destroy;
simp1.Destroy;

//mac
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_mac,coms,IPEdit.Text,simp,simp1)
   then
     begin
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if Length(sis0)<11 then sis := AnsiLowerCase(MACtoHex(sis0)) else sis:=sis0;
            with mbtable[i+1] do mac:=StrToMac(sis);
          end;
     end;
simp.Destroy;
simp1.Destroy;

//vlname
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_vlname,coms,IPEdit.Text,simp,simp1)
   then
     begin
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[i+1] do vlname:=sis0;
          end;
     end;
simp.Destroy;
simp1.Destroy;


//port
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_port,coms,IPEdit.Text,simp,simp1)
   then
     begin
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[i+1] do port:=sis0;
          end;
     end;
simp.Destroy;
simp1.Destroy;

//type
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_type,coms,IPEdit.Text,simp,simp1)
   then
     begin
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if sis0 = '1' then sis:='Other';
            if sis0 = '2' then sis:='BlockByAddrBind';
            if sis0 = '3' then sis:='Delete';
            with mbtable[i+1] do mtype:=sis;
          end;
     end;
simp.Destroy;
simp1.Destroy;

//status
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(macblock_status,coms,IPEdit.Text,simp,simp1)
   then
     begin
        c2:=simp1.Count;
        for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if sis0 = '1' then sis:='Active';
            if sis0 = '2' then sis:='NotInService';
            if sis0 = '3' then sis:='NotRedy';
            if sis0 = '4' then sis:='CreateAndGo';
            if sis0 = '5' then sis:='CreateAndWait';
            if sis0 = '6' then sis:='Destroy';
            with mbtable[i+1] do status:=sis;
          end;
     end;
simp.Destroy;
simp1.Destroy;

//-------------------таблица состояния портов-----------------------------

for i:=1 to 24 do
  begin
//port state
  oid:=imp_port_state+ IntToStr(i);
  if SNMPGet(oid,coms,IPEdit.Text,sis)
    then with iporttable[i]
      do
        begin
         if sis ='2' then  state:='Enable(Strict)' else state:='Disable';
        end

    else showmessage('error');
//zero ip
    oid:=imp_port_zeroip+ IntToStr(i);
  if SNMPGet(oid,coms,IPEdit.Text,sis)
    then with iporttable[i]
      do
        begin
        if sis ='1' then  zeroip:='Enable' else zeroip:='Disable';
        end
    else showmessage('error');
//dhcp
  oid:=imp_port_dhcp + IntToStr(i);
  if SNMPGet(oid,coms,IPEdit.Text,sis)
    then with iporttable[i]
      do
        begin
        if sis ='1' then  fwdhcp:='Enable' else fwdhcp:='Disable';
        end
    else showmessage('error');
//max entry
    oid:=imp_port_max + IntToStr(i);
  if SNMPGet(oid,coms,IPEdit.Text,sis)
    then with iporttable[i]
      do
        begin
        max_entry:=sis;
        end
    else showmessage('error');

  end;






//-------получаем ип и мак-------------------------------------------------
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(imp,coms,IPEdit.Text,simp,simp1)
    then
      begin
        c:=simp1.Count;
        for i:=0 to simp1.Count-1 do
          begin
            sis1:=simp1.Strings[i];
            Delete(sis1,1,30);
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if Length(sis0)<11 then sis := AnsiLowerCase(MACtoHex(sis0)) else sis:=sis0;
            with imptable[i+1] do
                  begin
                   imp_ip  := sis1;
                   imp_mac := StrToMac(sis);
                  end;
          end;
      end
    else MessageDlg('Ошибка при запросе IP MAC',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;




//---------------получаем статус связки-----------------------------------
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
if SNMPGetTable(imps,coms,IPEdit.Text,simp,simp1)
    then
      begin
        for i:=0 to simp.Count-1 do
            begin
             sis0:=simp.Strings[i];
             Delete(sis0,1,1);
             Delete(sis0,2,1);
             if sis0 = '2' then sis:='Active' else sis:='Inactive';
             with imptable[i+1] do imp_status := sis;
            end;
      end
    else  MessageDlg('Ошибка при запросе Status',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;

//-------------------получаем тип связки----------------------------------

simp:=TStringlist.Create;
simp1:=TStringlist.Create;
if SNMPGetTable(impt,coms,IPEdit.Text,simp,simp1)
    then
      begin
        for i:=0 to simp.Count-1 do
            begin
             sis0:=simp.Strings[i];
             Delete(sis0,1,1);
             Delete(sis0,2,1);
             if sis0 = '3' then sis:='AUTO';
             if sis0 = '1' then sis:='ARP';
             with imptable[i+1] do imp_type := sis;
            end;
      end
    else  MessageDlg('Ошибка при запросе IMP Type',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;

//=========================DHCP ENTRY SETTINGS============================

//-------------забираем ip и мак ------------------------------
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
  if SNMPGetTable(dhcp,coms,IPEdit.Text,simp,simp1)
    then
      begin
        c1:=simp1.Count;
        for i:=0 to simp1.Count-1 do
          begin
            sis1:=simp1.Strings[i];
            Delete(sis1,1,30);
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if Length(sis0)<11 then sis := AnsiLowerCase(MACtoHex(sis0)) else sis:=sis0;
            with dhcptable[i+1] do
                  begin
                   dhcp_ip  := sis1;
                   dhcp_mac := StrToMac(sis);
                  end;
          end;
      end
    else MessageDlg('Ошибка при запросе DHCP IP MAC',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;



//----------------------получаем порт на котором была связка -------------
simp:=TStringlist.Create;
simp1:=TStringlist.Create;
if SNMPGetTable(dhcp_p,coms,IPEdit.Text,simp,simp1)
    then
      begin
        for i:=0 to simp.Count-1 do
            begin
             sis0:=simp.Strings[i];
             Delete(sis0,1,1);
             Delete(sis0,Length(sis0),1);
             with dhcptable[i+1] do dhcp_port := sis0;
            end;
      end
    else  MessageDlg('Ошибка при запросе DHCP Port',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;

//------------забираем lease time-----------------------------------------

simp:=TStringlist.Create;
simp1:=TStringlist.Create;
if SNMPGetTable(dhcp_t,coms,IPEdit.Text,simp,simp1)
    then
      begin
        for i:=0 to simp.Count-1 do
            begin
             sis0:=simp.Strings[i];
             Delete(sis0,1,1);
             Delete(sis0,Length(sis0),1);
             with dhcptable[i+1] do dhcp_time := sis0;
            end;
      end
    else  MessageDlg('Ошибка при запросе Lease Time',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;

//------------забираем Status-----------------------------------------

simp:=TStringlist.Create;
simp1:=TStringlist.Create;
if SNMPGetTable(dhcp_s,coms,IPEdit.Text,simp,simp1)
    then
      begin
        for i:=0 to simp.Count-1 do
            begin
             sis0:=simp.Strings[i];
             Delete(sis0,1,1);
             Delete(sis0,Length(sis0),1);
             if sis0 = '2' then sis := 'Active';
             if sis0 = '1' then sis := 'InActive';
             with dhcptable[i+1] do dhcp_status := sis;
            end;
      end
    else  MessageDlg('Ошибка при запросе IMP Status',mtError,[mbOK],0);
simp.Destroy;
simp1.Destroy;

//----------закидываем данные в таблицы-----------------------------------
//IMP-MAC Binding Entry
for i:=1 to c do
WriteStringsToGrid(i,[imptable[i].imp_ip, imptable[i].imp_mac,imptable[i].imp_status, imptable[i].imp_type], IMPSG);
//DHCP Snooping
for i:=1 to c1 do
WriteStringsToGrid(i,[dhcptable[i].dhcp_ip, dhcptable[i].dhcp_mac,dhcptable[i].dhcp_port, dhcptable[i].dhcp_time, dhcptable[i].dhcp_status], DHCPSG);
//IMP Port Settings
for i := 1 to 24 do
WriteStringsToGrid(i,[IntToStr(i),iporttable[i].state,iporttable[i].zeroip,iporttable[i].fwdhcp,iporttable[i].max_entry],IMPPORTSG);
//MAC Block List
for i := 1 to c2 do
WriteStringsToGrid(i,[mbtable[i].vid,mbtable[i].mac,mbtable[i].vlname,mbtable[i].port, mbtable[i].mtype, mbtable[i].status],MBSG);

end;

//===================Чистка IMP и DHCP таблиц===================================

procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
IMPSG.Clear;
DHCPSG.Clear;
IMPPORTSG.Clear;
MBSG.Clear;
IMPSG.RowCount:=2;
DHCPSG.RowCount:=2;
IMPPORTSG.RowCount:=2;
MBSG.RowCount:=2;
WriteStringsToGrid(0,['Port  ', 'Status  ', 'Allow Zero IP  ', 'Forward DHCP  ', 'Max Entry  '],IMPPORTSG);
WriteStringsToGrid(0,['IP  ', 'MAC-address  ', 'Status  ', 'Type  '],IMPSG);
WriteStringsToGrid(0,['IP  ', 'MAC-address  ', 'Port  ', 'Lease  ', 'Status  '], DHCPSG);
WriteStringsToGrid(0,['VID  ', 'MAC-address  ', 'VLAN NAME  ', 'Port  ', 'Type  ', 'Status  '], MBSG);
end;


//======================получение состояния портов==============================
procedure TMainForm.RFbtnClick(Sender: TObject);
var
n, i: integer;
oid1,sis1,nps,nss,sname,sernum,macAD,sfirm,sdevi,stoid,ads,st,adss,es,cm,ps: AnsiString;
tbl,tbl1: TStringlist;
begin
es:=Trim(IpEdit.Text);
IPEdit.Text:=es;

If not ItIsIP(IpEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

RFbtn.Enabled:=false;
PortClBtn.Click;





//------------имя коммутатора----_------------------------
if SNMPGet(names,coms,IPEdit.Text,sname)
   then SNEdit.Text := sname
   else SNEdit.Text := 'Connection error';


//------------LOL чистим мибыыыыыы----_------------------------
if SNMPGet(clrm,coms,IPEdit.Text,sname)
   then FWEdit.Text:= sname
   else FWEdit.Text := 'Connection error';


//------------firmware----_------------------------
if SNMPGet(firm,coms,IPEdit.Text,sfirm)
   then FWEdit.Text := sfirm
   else FWEdit.Text := 'Connection error';


//------------LOL чистим мибыыыыыы второй раааз----_------------------------
if SNMPGet(clrm,coms,IPEdit.Text,sname)
   then HWEdit.Text:= sname
   else HWEdit.Text := 'Connection error';


//------------hardware----_------------------------
if SNMPGet(hardm,coms,IPEdit.Text,sfirm)
   then HWEdit.Text := sfirm
   else HWEdit.Text := 'Connection error';


//--------------Тип Коммутатора---------------------------
if SNMPGet(devi,coms,IPEdit.Text,sdevi)
    then DTEdit.Text:= sdevi
    else DTEdit.Text:= 'error';

oid1:='1.3.6.1.2.1.17.1.2.0';
if SNMPGet(oid1,coms,IPEdit.Text,sis1)
   then
   begin
   n := STrToInt(sis1);
   end;


case n of

//52 портовые коммутаторы

52: begin
      Portnum:=52;
    end;

//28 портовые коммутаторы

28: begin
      Portnum:=28;
      PortSL1.Visible := false;
      PortSLMag.Left  := PortSL.Left + PortSL.Width + 2;
     end;

// 26

26: begin
      Portnum:=26;
      PortSL1.Visible := false;
      PortSLMag.Left  := PortSL.Left + PortSL.Width + 2;
      PortSLMag.ColCount:=1;
      PortSLMag.Width:=35;
    end;

//16 портовые

18: begin
      Portnum:=10;
      PortSL1.Visible := false;
      PortSL.ColCount:=8;
      PortSL.Width:=PortSL.ColCount*31+4;
      PortSLMag.Left  := PortSL.Left + PortSL.Width + 2;
      PortSLMag.ColCount:=1;
      PortSLMag.Width:=35;
    end;

//10 портовые

10: begin
      Portnum:=10;
      PortSL1.Visible := false;
      PortSL.ColCount:=4;
      PortSL.Width:=PortSL.ColCount*31+4;
      PortSLMag.Left  := PortSL.Left + PortSL.Width + 2;
      PortSLMag.ColCount:=1;
      PortSLMag.Width:=35;
    end;

  end;

  if n > 52
    then
     begin
      Portnum:=28;
      PortSL1.Visible := false;
      PortSLMag.Left  := PortSL.Left + PortSL.Width + 2;
     end;


//-----------------------------------------------------------

//подписываем порты


for i := 0 to PortSL.ColCount-1 do
   begin
      PortSL.Cells[i,0] := IntToStr(i+1);
      PortSL.Cells[i,1] := IntToStr(PortSL.ColCount+i+1);
   end;


if PortSL1.Visible = true
  then
    begin

     for i := 0 to PortSL1.ColCount-1 do
        begin
          PortSL1.Cells[i,0] := IntToStr(PortSL.ColCount*2+i+1);
          PortSL1.Cells[i,1] := IntToStr(PortSL.ColCount*2 + PortSL1.ColCount + i+1);
        end;

     for i := 0 to PortSLMag.ColCount-1 do
        begin
          PortSLMag.Cells[i,0] := IntToStr(PortSL.ColCount*2 + PortSl1.ColCount*2 +i+1);
          PortSLMag.Cells[i,1] := IntToStr(PortSL.ColCount*2 + PortSL1.ColCount*2 + PortSLMag.ColCount + i+1);
        end;
   end
  else
   begin
     for i := 0 to PortSLMag.ColCount-1 do
        begin
          PortSLMag.Cells[i,0] := IntToStr(PortSL.ColCount*2 + i + 1);
          PortSLMag.Cells[i,1] := IntToStr(PortSL.ColCount*2 + PortSLMag.ColCount + i + 1);
        end;
   end;




//--------------Serial Number---------------------------
if SNMPGet(serialnum,coms,IPEdit.Text,sernum)
    then SerNEdit.Text:= sernum
    else SerNEdit.Text:= 'error';


//--------------MAC Address---------------------------
if SNMPGet(macaddr,coms,IPEdit.Text,macAD)
    then MACEd.Text:= macAD
    else MACEd.Text:= 'error';

//---------------NTPServer--------------------------------
  //primary
  if SNMPGet(ntp_sp,coms,IPEdit.Text,nps)
    then NPEdit.Text:= nps
    else NPEdit.Text:= 'error';
  //secondary
  if SNMPGet(ntp_ss,coms,IPEdit.Text,nss)
    then NSEdit.Text:= nss
    else NSEdit.Text:= 'error';

//------------------DHCP Relay Server----------------------

 if SNMPGet(dhcpr_e,coms,IPEdit.Text,nss)
    then
      begin
      if nss = '1'
        then DSEdit.Text:='Enable'
        else DSEdit.Text:='Disable';
      end
    else DSEdit.Text:= 'error';


   tbl:=TStringlist.Create;
   tbl1:=TStringlist.Create;
  if SNMPGetTable(dhcpr_s,coms,IPEdit.Text,tbl,tbl1)
    then
      begin
      if tbl.Count > 0
        then
          begin
            st:=tbl.Strings[0];
            Delete(st,1,1);
            Delete(st,Length(st),1);
            DPEdit.Text:=st;
          end;
      end;



 //---------------------получение состояния порта (up/down)-------


 PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;


//-------PortSL --------------------
for i:=1 to PortSL.ColCount do
  begin
    stoid:=states + PortSL.Cells[i-1,0];
  //admin port status
    ads:=adms + PortSL.Cells[i-1,0];
    if SNMPGet(ads,coms,IPEdit.Text,adss)
      then
        begin
          if adss <> '1' then PortSL.Colors[i-1,0]:= clRed;
        end;

    ads:=adms + PortSL.Cells[i-1,1];
    if SNMPGet(ads,coms,IPEdit.Text,adss)
      then
        begin
          if adss <> '1' then PortSL.Colors[i-1,1]:= clRed;
        end;

  //поиск ошибок на портах
    es:=inerr + PortSL.Cells[i-1,0];
    if SNMPGet(es,coms,IPEdit.Text,cm)
      then
        begin
          if cm <> '0' then PortSL.AddComment(i-1,0,'Ошибок: ' + cm);
        end;

     es:=inerr + PortSL.Cells[i-1,1];
    if SNMPGet(es,coms,IPEdit.Text,cm)
      then
        begin
          if cm <> '0' then PortSL.AddComment(i-1,1,'Ошибок: ' + cm);
        end;

  //скорость порта
     ps:= portsp + PortSL.Cells[i-1,0];
         if SNMPGet(ps,coms,IPEdit.Text,cm)
      then
        begin
          if cm = '10' then PortSL.CellProperties[i-1,0].FontColor:=clOlive;
          if cm = '100' then PortSL.CellProperties[i-1,0].FontColor:=clGreen;
          if cm = '1000' then PortSL.CellProperties[i-1,0].FontColor:=clNavy;

        end;

     ps:= portsp + PortSL.Cells[i-1,1];
         if SNMPGet(ps,coms,IPEdit.Text,cm)
      then
        begin
          if cm = '10' then PortSL.CellProperties[i-1,1].FontColor:=clOlive;
          if cm = '100' then PortSL.CellProperties[i-1,1].FontColor:=clGreen;
          if cm = '1000' then PortSL.CellProperties[i-1,1].FontColor:=clNavy;
        end;

    // линк статус
    if SNMPGet(stoid,coms,IPEdit.Text,st)
      then
        begin
          if st = '1' then PortSL.CellProperties[i-1,0].FontSize:=12
          else PortSL.CellProperties[i-1,0].FontColor:=clBlack;
        end;

    stoid:=states + PortSL.Cells[i-1,1];
    if SNMPGet(stoid,coms,IPEdit.Text,st)
      then
        begin
          if st = '1' then PortSL.CellProperties[i-1,1].FontSize:=12
          else PortSL.CellProperties[i-1,1].FontColor:=clBlack;
        end;



  end;



//-------PortSL1 ---------------------------------------------------
if PortSL1.Visible = true
  then
    begin
      for i:=1 to PortSL1.ColCount do
        begin
          stoid:=states + PortSL1.Cells[i-1,0];

        //admin port status
          ads:=adms + PortSL1.Cells[i-1,0];
          if SNMPGet(ads,coms,IPEdit.Text,adss)
            then
              begin
                if adss <> '1' then PortSL1.Colors[i-1,0]:= clRed;
              end;

          ads:=adms + PortSL1.Cells[i-1,1];
          if SNMPGet(ads,coms,IPEdit.Text,adss)
            then
              begin
                if adss <> '1' then PortSL1.Colors[i-1,1]:= clRed;
              end;

        //поиск ошибок на портах
          es:=inerr + PortSL1.Cells[i-1,0];
          if SNMPGet(es,coms,IPEdit.Text,cm)
            then
              begin
                if cm <> '0' then PortSL1.AddComment(i-1,0,'Ошибок: ' + cm);
              end;

          es:=inerr + PortSL1.Cells[i-1,1];
          if SNMPGet(es,coms,IPEdit.Text,cm)
            then
              begin
                if cm <> '0' then PortSL1.AddComment(i-1,1,'Ошибок: ' + cm);
              end;

       //скорость порта
          ps:= portsp + PortSL1.Cells[i-1,0];
          if SNMPGet(ps,coms,IPEdit.Text,cm)
            then
              begin
                if cm = '10' then PortSL1.CellProperties[i-1,0].FontColor:=clOlive;
                if cm = '100' then PortSL1.CellProperties[i-1,0].FontColor:=clGreen;
                if cm = '1000' then PortSL1.CellProperties[i-1,0].FontColor:=clNavy;
              end;

          ps:= portsp + PortSL1.Cells[i-1,1];
          if SNMPGet(ps,coms,IPEdit.Text,cm)
           then
            begin
             if cm = '10' then PortSL1.CellProperties[i-1,1].FontColor:=clOlive;
             if cm = '100' then PortSL1.CellProperties[i-1,1].FontColor:=clGreen;
             if cm = '1000' then PortSL1.CellProperties[i-1,1].FontColor:=clNavy;
            end;

       // линк статус
          if SNMPGet(stoid,coms,IPEdit.Text,st)
            then
              begin
                if st = '1' then PortSL1.CellProperties[i-1,0].FontSize:=12
                else PortSL1.CellProperties[i-1,0].FontColor:=clBlack;

              end;

          stoid:=states + PortSL1.Cells[i-1,1];
          if SNMPGet(stoid,coms,IPEdit.Text,st)
            then
              begin
                if st = '1' then PortSL1.CellProperties[i-1,1].FontSize:=12
                else PortSL1.CellProperties[i-1,1].FontColor:=clBlack;

              end;


        end;
    end;


    // Магистральные порты
for i:=1 to PortSLMag.ColCount do
  begin
    stoid:=states + PortSLMag.Cells[i-1,0];
  //admin port status
    ads:=adms + PortSLMag.Cells[i-1,0];
    if SNMPGet(ads,coms,IPEdit.Text,adss)
      then
        begin
          if adss <> '1' then PortSLMag.Colors[i-1,0]:= clRed;
        end;

    ads:=adms + PortSLMag.Cells[i-1,1];
    if SNMPGet(ads,coms,IPEdit.Text,adss)
      then
        begin
          if adss <> '1' then PortSLMag.Colors[i-1,1]:= clRed;
        end;

  //поиск ошибок на портах
    es:=inerr + PortSLMag.Cells[i-1,1];
    if SNMPGet(es,coms,IPEdit.Text,cm)
      then
        begin
          if cm <> '0' then PortSLMag.AddComment(i-1,0,'Ошибок: ' + cm);
        end;

     es:=inerr + PortSLMag.Cells[i-1,1];
    if SNMPGet(es,coms,IPEdit.Text,cm)
      then
        begin
          if cm <> '0' then PortSLMag.AddComment(i-1,1,'Ошибок: ' + cm);
        end;

    //скорость порта
     ps:= portsp + PortSLMag.Cells[i-1,0];
         if SNMPGet(ps,coms,IPEdit.Text,cm)
      then
        begin
          if cm = '10' then PortSLMag.CellProperties[i-1,0].FontColor:=clOlive;
          if cm = '100' then PortSLMag.CellProperties[i-1,0].FontColor:=clGreen;
          if cm = '1000' then PortSLMag.CellProperties[i-1,0].FontColor:=clNavy;

        end;

     ps:= portsp + PortSLMag.Cells[i-1,1];
         if SNMPGet(ps,coms,IPEdit.Text,cm)
      then
        begin

          if cm = '10' then PortSLMag.CellProperties[i-1,1].FontColor:=clOlive;
          if cm = '100' then PortSLMag.CellProperties[i-1,1].FontColor:=clGreen;
          if cm = '1000' then PortSLMag.CellProperties[i-1,1].FontColor:=clNavy;
        end;

   // линк статус
    if SNMPGet(stoid,coms,IPEdit.Text,st)
      then
        begin
          if st = '1' then PortSLMag.CellProperties[i-1,0].FontSize:=12
          else PortSLMag.CellProperties[i-1,0].FontColor:=clBlack;

        end;

    stoid:=states + PortSLMag.Cells[i-1,1];
    if SNMPGet(stoid,coms,IPEdit.Text,st)
      then
        begin
          if st = '1' then PortSLMag.CellProperties[i-1,1].FontSize:=12
          else PortSLMag.CellProperties[i-1,1].FontColor:=clBlack;
        end;






  end;

RFbtn.Enabled:=true;

end;

procedure TMainForm.PortSLRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
portn:=StrToInt(PortSL.Cells[Acol,Arow]);
end;



//================Тушим, а затем поднимает порты ==========================
procedure TMainForm.DownUP1Click(Sender: TObject);
var
ads: string;
begin
//Port down
ads:=adms + IntToStr(portn);
if SNMPSet(ads,comrw, IPEdit.Text, '2', ASN1_INT)
then
    begin
      RFBtn.Click;
      ShowMessage('Port '+ IntToStr(portn) + ' down!!!');
    end
else  ShowMessage('error');



//Delay
Sleep(1000);

//Port up
ads:=adms + IntToStr(portn);
if SNMPSet(ads,comrw, IPEdit.Text, '1', ASN1_INT)
then
    begin
      RFBtn.Click;
      ShowMessage('Port '+ IntToStr(portn) + ' up!!!');
    end
else  ShowMessage('error');

Sleep(2000);
RFBtn.Click;

end;

procedure TMainForm.DHCPSGGetFormat(Sender: TObject; ACol: Integer;
  var AStyle: TSortStyle; var aPrefix, aSuffix: String);
begin

 case
  acol
 of
   2,3:astyle:=ssAlphaNumeric;
   1,4:astyle:=ssAlphabetic;
   0  :astyle:=ssCustom;
 end;

end;

procedure TMainForm.DHCPSGCustomCompare(Sender: TObject; str1, str2: String;
  var Res: Integer);
var
i1,i2:integer;
st1,st2:TstringList;
s1,s2:string;
begin

st1 := TStringList.Create;
st1.Delimiter:='.';
st1.DelimitedText:=str1;
//s1:=st1[0]+st1[1]+st1[2]+st1[3];
s1:=st1[1]+st1[2]+st1[3];
i1:=StrToInt(s1);

st2 := TStringList.Create;
st2.Delimiter:='.';
st2.DelimitedText:=str2;
//s2:=st2[0]+st2[1]+st2[2]+st2[3];
s2:=st2[1]+st2[2]+st2[3];
i2:=StrToInt(s2);

if (i1 = i2)
  then res:=0
  else
    begin
      if (i1 > i2)
        then res:=1
        else res:=-1;
    end;

end;

procedure TMainForm.IMPPORTSGComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
  var
  a:integer;
  oid:ansistring;
  begin
a:= MessageDLG('Применить изменение?',mtWarning,[mbYes,mbNo],0);
  if a= 6 then
      begin
        oid:= imp_port_max + IntToStr(ARow);
        if SNMPSet(oid,comrw, IPEdit.Text, ASelection, ASN1_INT)
          then
            begin
            ClearBtn.Click;
            GetIMPBtn.Click;
            end;
         // else Memo1.Lines.Add('error');
      end;

end;

procedure TMainForm.IMPPORTSGGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
with IMPPORTSG do
    case ACol of
 {     1: begin
          aEditor := edComboList;
          ClearComboString;
          combobox.Items.Add('Enable');
          combobox.Items.Add('Disable');
         end;

       2: begin
            aEditor := edComboList;
            ClearComboString;
            combobox.Items.Add('Enable');
            combobox.Items.Add('Disable');
          end;

       3: begin
            aEditor := edComboList;
            ClearComboString;
            combobox.Items.Add('Enable');
            combobox.Items.Add('Disable');
          end; }

       4: begin
            aEditor := edComboList;
            ClearComboString;
            combobox.Items.Add('1');
            combobox.Items.Add('2');
            combobox.Items.Add('3');
            combobox.Items.Add('4');
            combobox.Items.Add('5');
          end;



    end;

end;

procedure TMainForm.IMPSGGetFormat(Sender: TObject; ACol: Integer;
  var AStyle: TSortStyle; var aPrefix, aSuffix: String);
begin
  case
   acol
  of
   1,2,3:astyle:=ssAlphabetic;
   0    :astyle:=ssCustom;
  end;
end;


procedure TMainForm.IPEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then RFBtn.Click;
end;

procedure TMainForm.Net1Click(Sender: TObject);
begin
SrchForm.Show;
end;

procedure TMainForm.NPEditDblClick(Sender: TObject);
begin
NPEdit.ReadOnly:=false;
NPEdit.Color:=clWhite;
end;

procedure TMainForm.NSEditDblClick(Sender: TObject);
begin
NSEdit.ReadOnly:=false;
NSEdit.Color:=clWhite;
end;

procedure TMainForm.DPEditDblClick(Sender: TObject);
begin
DPEdit.ReadOnly:=false;
DPEdit.Color:=clWhite;
end;


procedure TMainForm.NPEditExit(Sender: TObject);
begin
NPEdit.ReadOnly:=true;
NPEdit.Color:=clBtnFace;
end;

procedure TMainForm.DPEditExit(Sender: TObject);
begin
DPEdit.ReadOnly:=true;
DPEdit.Color:=clBtnFace;
end;

procedure TMainForm.NSEditExit(Sender: TObject);
begin
NSEdit.ReadOnly:=true;
NSEdit.Color:=clBtnFace;
end;

procedure TMainForm.FindBtnClick(Sender: TObject);
var
i: integer;
fs: string;
st:TstringList;

begin

fs:=StrToMac(MacEdit.Text);
for i:=1 to MACSG.RowCount-1 do
  begin
  if fs = MACSG.Cells[2,i]
    then
      begin
       ShowMessage(MACSG.Cells[0,i]);
       Exit;
      end;
  end;
ShowMessage('Not in Table');



end;


//=============Запуск с параметрами=============================================


procedure TMainForm.FormShow(Sender: TObject);
var
log,pas,param:string;
iniFile:TiniFile;
begin

param:= ParamStr(1);
log:= ParamStr(2);
pas:= ParamStr(3);

if (param <> '') and (log <> '') and (pas <> '')  then
  begin

     iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
     ZC_MDB.Database := iniFile.ReadString('MDB', 'db', '');
     ZC_MDB.HostName := iniFile.ReadString('MDB', 'ip', '');
     ZC_MDB.User:=log;
     ZC_MDB.Password:=pas;
       try
         ZC_MDB.Connect;
       except
        On e: Exception do
          begin
            MessageDlg('Не могу соединиться с базой данных', mtError, [mbOk], 0);
            Exit;
          end;
       end;
username:=log;
with ZQ_MDB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT name FROM c_emp WHERE login = :l AND NOT disabled');
        parambyname('l').AsString := UserName;
        try
          Open;
        except
          On e: Exception do
          begin
            MessageDlg(e.Message, mtError, [mbOk], 0);
            exit;
          end;
        end;
        if RecordCount = 1 then
          MainForm.caption := 'Multifunctional SNMP Agent.  Использует: ' + fieldbyname('name').AsString
        else
          MainForm.caption := 'Multifunctional SNMP Agent.  Использует: ' + username;
       Close;
       SQL.Clear;
       SQL.Add('select value from adm_program_params where param_name = :c');
        parambyname('c').AsString:='comr';
       try
        Open;
       except
         On e: Exception do
            begin
              MessageDlg(e.Message, mtError, [mbOk], 0);
              exit;
            end;
       end;
       coms:=fieldbyname('value').AsString;

       Close;
       SQL.Clear;
       SQL.Add('select value from adm_program_params where param_name = :c');
        parambyname('c').AsString:='comw';
       try
        Open;
       except
         On e: Exception do
            begin
              MessageDlg(e.Message, mtError, [mbOk], 0);
              exit;
            end;
       end;
       comrw:=fieldbyname('value').AsString;

    end;

    MainPanel.Visible:=true;
    SysGB.Visible:=true;
    MACGB.Visible:=true;
    PageControl1.Visible:=true;
    IPEdit.Text:= param;
    RFBtn.Click;

  end;

end;

//==============================================================================






procedure TMainForm.About1Click(Sender: TObject);
begin
ShowMessage('Multifunctional SNMP Agent. v.1.0b by KotoVAS ( vasiliy@tomtel.ru ) (c) 2011');
end;


procedure TMainForm.Button3Click(Sender: TObject);
begin
           if SNMPSet(reboot,comrw, IPEdit.Text, '3', ASN1_INT)
            then
              begin
                MessageDlg('ээээ',mtInformation,[mbOk],0);
              end
            else
              begin
                MessageDlg('Коммутатор перезагружается. Ждите.',mtInformation,[mbOk],0);
                PingCl.Host:=IPEdit.Text;
                Application.ProcessMessages();
                Sleep(1000);
                PingCl.Ping;
                while PingCl.ReplyStatus.TimeToLive = 0 do
                  begin
                  Application.ProcessMessages();
                  PingCl.Ping;
                  end;
                MessageDlg('Коммутатор перезагрузился',mtInformation,[mbOk],0);
                RFbtn.Click;
              end;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
MacEdit.Text:= Trim(ClipBoard.AsText);
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
IPEdit.Text:= Trim(ClipBoard.AsText);
RFbtn.Click;
end;

procedure TMainForm.Button8Click(Sender: TObject);
var
es:string;

begin
es:=Trim(IpEdit.Text);
IPEdit.Text:=es;

If not ItIsIP(IpEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

if MessageDlg('Перезагрузить коммутатор?',mtConfirmation,[mbNo,mbYes],0) = mrYes
  then
    if MessageDlg('Перед перезагрузкой сохранить текущую конфигурацию?',mtConfirmation,[mbNo,mbYes],0) = mrYes
      then
        begin
          if SNMPSet(save,comrw, IPEdit.Text, '5', ASN1_INT)
            then
              begin
               MessageDlg('Конфигурация и Логи сохранены',mtInformation,[mbOk],0);
              end;

           Sleep(1000);

           if SNMPSet(reboot,comrw, IPEdit.Text, '3', ASN1_INT)
            then
              begin
                MessageDlg('ээээ',mtInformation,[mbOk],0);
              end
            else
              begin
                MessageDlg('Коммутатор перезагружается. Ждите.',mtInformation,[mbOk],0);
                PingCl.Host:=IPEdit.Text;
                Application.ProcessMessages();
                Sleep(1000);
                PingCl.Ping;
                while PingCl.ReplyStatus.TimeToLive = 0 do
                  begin
                  Application.ProcessMessages();
                  PingCl.Ping;
                  end;
                MessageDlg('Коммутатор перезагрузился',mtInformation,[mbOk],0);
                RFbtn.Click;
              end
        end
      else
        begin
           if SNMPSet(reboot,comrw, IPEdit.Text, '3', ASN1_INT)
            then
              begin
                MessageDlg('ээээ',mtInformation,[mbOk],0);
              end
            else
              begin
                MessageDlg('Коммутатор перезагружается',mtInformation,[mbOk],0);
                PingCl.Host:=IPEdit.Text;
                Sleep(1000);
                PingCl.Ping;
                while PingCl.ReplyStatus.TimeToLive = 0 do PingCl.Ping;
                MessageDlg('Коммутатор перезагрузился',mtInformation,[mbOk],0);
                RFbtn.Click;
              end
        end;


end;

procedure TMainForm.NTPSetClick(Sender: TObject);
var
es:string;
begin
es:=Trim(IpEdit.Text);
IPEdit.Text:=es;
If not ItIsIP(NPEdit.Text)
  then
    begin
    ShowMessage('Разве это IP для Основного ДНС?');
    Exit;
    end;

If not ItIsIP(NSEdit.Text)
  then
    begin
    ShowMessage('Разве это IP для Дополнительного ДНС?');
    Exit;
    end;

If not ItIsIP(IPEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

if SNMPSet(ntp_sp,comrw, IPEdit.Text, NPEdit.Text, ASN1_IPADDR)
            then
              begin
               MessageDlg('Основной NTP Сервер коммутатора указан как ' + NPEdit.Text,mtInformation,[mbOk],0);
              end;

if SNMPSet(ntp_ss,comrw, IPEdit.Text, NSEdit.Text, ASN1_IPADDR)
            then
              begin
               MessageDlg('Альтернативный NTP Сервер коммутатора указан как ' + NSEdit.Text,mtInformation,[mbOk],0);
              end;

end;


procedure TMainForm.Button7Click(Sender: TObject);
var
s:string;
begin
s:=IPEdit.Text;
IPEdit.Text:=Trim(s);

If not ItIsIP(IpEdit.Text)
  then
    begin
    ShowMessage('Разве это IP коммутатора?');
    Exit;
    end;

PingCl.Host:=IPEdit.Text;
PingCl.Ping;
if PingCl.ReplyStatus.TimeToLive = 0
  then
    begin
    ShowMessage('Host seemd to be down');
    Exit;
    end;

if SNMPSet(save,comrw, IPEdit.Text, '5', ASN1_INT)
 then MessageDlg('Конфигурация и логи сохранены',mtInformation,[mbOk],0)
 else ShowMessage('Сохранить не получилось');

end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.ExporttoExcell1Click(Sender: TObject);
begin
if MacSgSd.Execute then MACSGEx.XLSExport(MacSgSd.FileName);
end;

procedure TMainForm.Connect1Click(Sender: TObject);
var
iniFile: TIniFile;
begin
ConForm.ShowModal;

if ConForm.ModalResult = mrOk
  then
    begin
     iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
     ZC_MDB.Database := iniFile.ReadString('MDB', 'db', '');
     ZC_MDB.HostName := iniFile.ReadString('MDB', 'ip', '');
     ZC_MDB.User:=ConForm.LogEdit.Text;
     ZC_MDB.Password:=ConForm.PasEdit.Text;
       try
         ZC_MDB.Connect;
       except
        On e: Exception do
          begin
            MessageDlg('Не могу соединиться с базой данных', mtError, [mbOk], 0);
            Exit;
          end;
       end;
username:=Conform.LogEdit.Text;
with ZQ_MDB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT name FROM c_emp WHERE login = :l AND NOT disabled');
        parambyname('l').AsString := UserName;
        try
          Open;
        except
          On e: Exception do
          begin
            MessageDlg(e.Message, mtError, [mbOk], 0);
            exit;
          end;
        end;
        if RecordCount = 1 then
          MainForm.caption := 'Multifunctional SNMP Agent.  Использует: ' + fieldbyname('name').AsString
        else
          MainForm.caption := 'Multifunctional SNMP Agent.  Использует: ' + username;

       Close;
       SQL.Clear;
       SQL.Add('select value from adm_program_params where param_name = :c');
        parambyname('c').AsString:='comr';
       try
        Open;
       except
         On e: Exception do
            begin
              MessageDlg(e.Message, mtError, [mbOk], 0);
              exit;
            end;
       end;
       //coms:=fieldbyname('value').AsString;
       coms:='private';
       Close;
       SQL.Clear;
       SQL.Add('select value from adm_program_params where param_name = :c');
        parambyname('c').AsString:='comw';
       try
        Open;
       except
         On e: Exception do
            begin
              MessageDlg(e.Message, mtError, [mbOk], 0);
              exit;
            end;
       end;
       //comrw:=fieldbyname('value').AsString;
        comrw:='private';
    end;

    MainPanel.Visible:=true;
    SysGB.Visible:=true;
    MACGB.Visible:=true;
    PageControl1.Visible:=true;
    Net1.Visible:=true;
    MBSrch.Visible := true;
    MacSrch1.Visible := true;

    end;
  end;

procedure TMainForm.Options1Click(Sender: TObject);
var
iniFile : TiniFile;

begin
iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
SetForm.ServEdit.Text:= iniFile.ReadString('MDB', 'ip', '');
SetForm.DbEdit.Text:= iniFile.ReadString('MDB', 'db', '');

SetForm.ShowModal;
if SetForm.ModalResult = mrOK
  then
     begin
      iniFile.WriteString('MDB', 'ip', SetForm.ServEdit.Text);
      iniFile.WriteString('MDB', 'db', SetForm.DbEdit.Text);
     end;

end;

end.
