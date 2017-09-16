unit f_MacBlock;

interface

uses
  SNMPSend,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient;

type
  mbltable = record
      ip : string;
      vid :string;
      mac :string;
      vlname :string;
      port:string;
      mtype:string;
      status:string;
  end;

  TMBForm = class(TForm)
    MBSG: TAdvStringGrid;
    IpEdit: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    png: TIdIcmpClient;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MBForm: TMBForm;
  mbtable:array [1..1500] of mbltable;


implementation

uses Unit1;

{$R *.dfm}

procedure TMBForm.Button1Click(Sender: TObject);
var
c1,c2,i,y,z : integer;
simp, simp1:tstringlist;
oid,stimp,sis,sis0,sis1: Ansistring;
es: string;

begin
 MBSG.Clear;
 if StrToInt(Edit2.Text) > StrToInt(Edit3.Text) then Exit;
 c1:=1;
 c2:=0;
 z := StrToInt(Edit3.Text)- StrToInt(Edit2.Text) + 1;
 for y := StrToInt(Edit2.Text) to StrToInt(Edit3.Text) do
  Begin
  MBForm.Caption:='Сбор данных. Подождите! В Поиске коммутаторов: ' + IntToStr(z) + ' шт.' ;
   es:=IpEdit.Text + IntToStr(y);
   If not MainForm.ItIsIP(es)
    then
      begin
        ShowMessage('Разве это IP коммутатора?');
        Exit;
      end;

   png.Host := es;
   png.Ping;
   Application.ProcessMessages();
  if png.ReplyStatus.TimeToLive > 0
   then
    bEgin


     //-----------------------MAC BLOCK LIST----------------------------------
     //vid
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_vid,coms,es,simp,simp1)
       then
        begin
         for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[c1+i] do vid:=sis0;
          end;
        end;
     simp.Destroy;
     simp1.Destroy;

     //mac
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_mac,coms,es,simp,simp1)
      then
        begin
         for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            if Length(sis0)<11 then sis := AnsiLowerCase(MainForm.MACtoHex(sis0)) else sis:=sis0;
            with mbtable[c1+i] do mac:=MainForm.StrToMac(sis);
          end;
        end;
     simp.Destroy;
     simp1.Destroy;

     //vlname
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_vlname,coms,es,simp,simp1)
      then
        begin
         for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[c1+i] do vlname:=sis0;
          end;
        end;
     simp.Destroy;
     simp1.Destroy;


     //port
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_port,coms,es,simp,simp1)
      then
        begin
         for i:=0 to simp1.Count-1 do
          begin
            sis0:=simp.Strings[i];
            Delete(sis0,1,1);
            Delete(sis0,Length(sis0),Length(sis0));
            with mbtable[c1+i] do port:=sis0;
          end;
        end;
     simp.Destroy;
     simp1.Destroy;

     //type
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_type,coms,es,simp,simp1)
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
            with mbtable[c1+i] do mtype:=sis;
          end;
       end;
     simp.Destroy;
     simp1.Destroy;

     //status
     simp:=TStringlist.Create;
     simp1:=TStringlist.Create;
     if SNMPGetTable(macblock_status,coms,es,simp,simp1)
      then
        begin
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
            with mbtable[c1+i] do
              begin
                ip := es;
                status:=sis;
              end;
            end;
         end;
     c1:=c1+simp1.Count;
     simp.Destroy;
     simp1.Destroy;

    eNd;

  End;
MBForm.Caption:='Поиск завершён. Результат в таблице Ниже.';

 MainForm.WriteStringsToGrid(0,['IP','VID','MAC','Port','Block Type','Status'],MBSG);
 for i := 1 to c1 do
  MainForm.WriteStringsToGrid(i,[mbtable[i].ip,mbtable[i].vid,mbtable[i].mac,mbtable[i].port, mbtable[i].mtype, mbtable[i].status],MBSG);

end;


end.
