unit uPinger;

interface

uses
  Classes, Windows, SysUtils, winsock, ExtCtrls, Graphics;

const
ip_status_base  =11000;
ip_success  =0;
ip_buf_too_small  =11001;
ip_dest_net_unreachable  =11002;
ip_dest_host_unreachable  =11003;
ip_dest_prot_unreachable  =11004;
ip_dest_port_unreachable  =11005;
ip_no_resources =11006;
ip_bad_option =11007;
ip_hw_error =11008;
ip_packet_too_big =11009;
ip_req_timed_out =11010;
ip_bad_req =11011;
ip_bad_route =11012;
ip_ttl_expired_transit =11013;
ip_ttl_expired_reassem =11014;
ip_param_problem =11015;
ip_source_quench =11016;
ip_option_too_big =11017;
ip_bad_destination =11018;
ip_addr_deleted =11019;
ip_spec_mtu_change =11020;
ip_mtu_change =11021;
ip_unload =11022;
ip_general_failure =11050;
max_ip_status = ip_general_failure;
ip_pending =11255;


type

  T_PingResultList = class;
  T_Pinger = class;
  T_Ip_Option_Information = packed record
    Ttl: Byte;
    Tos: Byte;
    Flags: Byte;
    OptionsSize: Byte;
    OptionsData: Pointer;
  end;
  
  T_Icmp_Echo_Reply = packed record
    Address: u_long;
    Status: u_long;
    RTTime: u_long;
    DataSize: u_short;
    Reserved: u_short;
    Data: Pointer;
    Options: T_Ip_Option_Information;
  end;
  
  PIPINFO = ^T_Ip_Option_Information;
  PVOID = Pointer;

  T_OnResultChange = procedure (Sender : TObject) of object;
  T_PingResult = record
    IP: string;
    Status: string;
    Time: Integer;
    DataSize: Integer;
    Date : TDateTime;
  end;
  
  T_Pinger = class(TThread)
  private
    FHost: string;
    FOnResultChange: T_OnResultChange;
    FPingBufferSize: Integer;
    FPingInterval: Integer;
    FResults: T_PingResultList;
    FStatus: Integer;
    FStep: Integer;
    procedure ResChangeProc;
  protected
    procedure Execute; override;
  public
    NeedSuspend: Boolean;
    constructor create2(CreateSuspended : boolean; aHost: string);
    property Host: string read FHost write FHost;
    property OnResultChange: T_OnResultChange read FOnResultChange write
            FOnResultChange;
    property PingBufferSize: Integer read FPingBufferSize write FPingBufferSize;
    property PingInterval: Integer read FPingInterval write FPingInterval;
    property Results: T_PingResultList read FResults;
    property Status: Integer read FStatus;
    property Step: Integer read FStep;
  end;
  
  T_Elem = T_Pinger;
  T_PingerList = class(TObject)
  private
    FCount: Integer;
    fElem: array of T_Elem;
    FMax: Integer;
    function GetElem(i : integer): T_Elem;
    procedure SetMax(const Value: Integer);
  public
    procedure AddElem(aElem : T_Elem); overload;
    procedure Clear;
    procedure RemoveElem(index : integer);
    procedure AddElem(ip : string); overload;
    procedure ClearResults;
    procedure SinglePing;
    procedure StartPing;
    procedure StopPing;
    property Count: Integer read FCount;
    property Elem[i : integer]: T_Elem read GetElem;
    property Max: Integer read FMax write SetMax;
  end;

  T_PingResultList = class(TObject)
  private
    Capacity: Integer;
    FCount: Integer;
    FItem: array of T_PingResult;
    function GetItem(Index: Integer): T_PingResult;
    function Get_Item(Index: Integer): T_PingResult;
    procedure Grow;
    procedure SetItem(Index: Integer; Value: T_PingResult);
  public
    constructor Create;
    procedure Add(aItem : T_PingResult);
    procedure Clear(hard : boolean = false);
    procedure Delete(Index : integer);
    procedure Insert(aItem : T_PingResult; Index : integer);
    function Last: T_PingResult;
    procedure SetCapacity(NewCapacity : integer);
    function Statistics: string;
    property Count: Integer read FCount;
    property Item[Index: Integer]: T_PingResult read GetItem write SetItem;
            default;
    property _Item[Index: Integer]: T_PingResult read Get_Item;
  end;
  
function mPing(aHost: string; aPingBufferSize : integer; Latency : integer =
    1000): T_Icmp_Echo_Reply;

function inetAtoN(a: Longword): string;

function ICMP_echo_replyToPingRes(repl : T_Icmp_Echo_Reply): T_PingResult;

var
  PingerList : T_PingerList;

implementation
  procedure wait(interval : longint);
  var t0: TDateTime;
  begin
    t0 := Now;
    repeat

    until Now > t0 + (interval/1000)/(24*60*60);

  end;


  function IcmpCreateFile() : THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
  function IcmpCloseHandle(IcmpHandle : THandle) : BOOL; stdcall; external 'ICMP.DLL'  name 'IcmpCloseHandle';
  function IcmpSendEcho(
                    IcmpHandle : THandle;    // handle, возвращенный IcmpCreateFile()
                    DestAddress : u_long;    // Адрес получателя (в сетевом порядке)
                    RequestData : PVOID;     // Указатель на посылаемые данные
                    RequestSize : Word;      // Размер посылаемых данных
                    RequestOptns : PIPINFO;  // Указатель на посылаемую структуру
                                       // ip_option_information (может быть nil)
                    ReplyBuffer : PVOID;     // Указатель на буфер, содержащий ответы.
                    ReplySize : DWORD;       // Размер буфера ответов
                    Timeout : DWORD          // Время ожидания ответа в миллисекундах
                   ) : DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';

(*

*)

function mPing(aHost: string; aPingBufferSize : integer; Latency : integer =
    1000): T_Icmp_Echo_Reply;
var
    hIP : THandle;
    _PingBuffer : array of AnsiChar;
    _PingBufferSize : integer;
    Icmp_Echo_Reply : ^T_Icmp_Echo_Reply;
    pHostEn : PHostEnt;
    wVersionRequested : WORD;
    lwsaData : WSAData;
    destAddress : In_Addr;
begin
  // Создаем handle
  hIP := IcmpCreateFile();
  result.RTTime := -1;
  setLength(_PingBuffer, aPingBufferSize );

  _PingBufferSize := Length(_PingBuffer)*sizeof(_PingBuffer[0]);
  GetMem( Icmp_Echo_Reply,  sizeof(T_Icmp_Echo_Reply) + _PingBufferSize);
  Icmp_Echo_Reply.Data := _PingBuffer;
  Icmp_Echo_Reply.DataSize := _PingBufferSize;

  wVersionRequested := MakeWord(1,1);

  if (WSAStartup(wVersionRequested,lwsaData) <> 0)
  then
    Exit;

  pHostEn := gethostbyname(PAnsiChar(AnsiString(aHost)));

  if (GetLastError() <> 0)
  then
    Exit;


  destAddress := PInAddr(pHostEn^.h_addr_list^)^;

  IcmpSendEcho(hIP,
               destAddress.S_addr,
               _PingBuffer,
               _PingBufferSize,
//               sizeof(_PingBuffer) + sizeof(T_Icmp_Echo_Reply),
               Nil,
               Icmp_Echo_Reply,
               sizeof(T_Icmp_Echo_Reply) +
               _PingBufferSize,
//               sizeof(_PingBuffer),
               Latency );

  result := Icmp_Echo_Reply^;
  if result.Status <> ip_success
  then
    Result.RTTime := -1;
  IcmpCloseHandle(hIP);
  WSACleanup();
  FreeMem(Icmp_Echo_Reply);
end;


{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure pinger.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ pinger }


function inetAtoN(a: Longword): string;
var a1,a2,a3,a4 : byte;
begin
  a1 := a mod 256;
  a := a div 256;
  a2 := a mod 256;
  a := a div 256;
  a3 := a mod 256;
  a4 := a div 256;
  result := Format('%d.%d.%d.%d', [a1,a2,a3,a4]);

end;

function ICMP_statusToString(Status : integer): string;
begin
  case Status of
    ip_status_base  : result :=   '?????';
    ip_success  : result :=   'success';
    ip_buf_too_small  : result :=   'buf_too_small';
    ip_dest_net_unreachable  : result :=   'dest_net_unreachable';
    ip_dest_host_unreachable  : result :=   'dest_host_unreachable';
    ip_dest_prot_unreachable  : result :=   'dest_prot_unreachable';
    ip_dest_port_unreachable  : result :=   'dest_port_unreachable';
    ip_no_resources : result :=   'no_resources';
    ip_bad_option : result :=   'bad_option';
    ip_hw_error : result :=   'hw_error';
    ip_packet_too_big : result :=   'packet_too_big';
    ip_req_timed_out : result :=   'req_timed_out';
    ip_bad_req : result :=   'bad_req';
    ip_bad_route : result :=   'bad_route';
    ip_ttl_expired_transit : result :=   'ttl_expired_transit';
    ip_ttl_expired_reassem : result :=   'ttl_expired_reassem';
    ip_param_problem : result :=   'param_problem';
    ip_source_quench : result :=   'source_quench';
    ip_option_too_big : result :=   'option_too_big';
    ip_bad_destination : result :=   'bad_destination';
    ip_addr_deleted : result :=   'addr_deleted';
    ip_spec_mtu_change : result :=   'spec_mtu_change';
    ip_mtu_change : result :=   'mtu_change';
    ip_unload : result :=   'unload';
    ip_general_failure : result :=   'general_failure';
    ip_pending : result :=   'pending';
  else
    result := 'status unknown';
  end;
end;

function ICMP_echo_replyToPingRes(repl : T_Icmp_Echo_Reply): T_PingResult;
begin
  result.DataSize := repl.DataSize;
  result.IP := inetAtoN(repl.Address);
  result.Time := repl.RTTime;
  result.Status := ICMP_statusToString(repl.Status);
end;



{
*********************************** T_Pinger ***********************************
}
constructor T_Pinger.create2(CreateSuspended : boolean; aHost: string);
begin
  Create( CreateSuspended );
  NeedSuspend := false;
  fHost := aHost;
  @fOnResultChange := nil;
  fResults := T_PingResultList.Create;
  fPingInterval := 1000;
  PingBufferSize := 64;
end;

procedure T_Pinger.Execute;
var
  PingRes: T_PingResult;
  interval: LongInt;
begin
  while not terminated do
  begin
    PingRes := ICMP_echo_replyToPingRes( mPing( Host, PingBufferSize ) );
    PingRes.Date := now;
    Results.Add(PingRes);
    Synchronize( ResChangeProc );
    inc(fStep);
    if NeedSuspend
    then begin
      NeedSuspend := false;
      Suspend;
    end
    else begin
      Interval := fPingInterval-PingRes.Time;
      while interval < 0 do
        Interval := Interval + 1000;
      sleep(Interval);
    end;
  end;
end;

procedure T_Pinger.ResChangeProc;
begin
  if @FOnResultChange <> nil
  then
    FOnResultChange(Self);
end;

var PingCount : integer = 4;



{ T_PingerList }

{
********************************* T_PingerList *********************************
}
procedure T_PingerList.AddElem(aElem : T_Elem);
begin
  if fCount>= fMax
  then
    SetMax(round(Max*1.33)+1);
  
   fElem[count] := aElem;
   inc(fCount);
end;

procedure T_PingerList.Clear;
begin
  repeat
    RemoveElem(Count-1);
  until ( fCount = 0 );
//  SetLength(fElem, 0);
end;

function T_PingerList.GetElem(i : integer): T_Elem;
begin
  if (i < count) and (i>=0)
  then
    result := fElem[i]
  else
    result := nil;
  
end;

procedure T_PingerList.RemoveElem(index : integer);
var
  i: Integer;
begin
  if Elem[index] <> nil then
  begin
    Elem[index].Results.Free;
    Elem[index].Free;
    for i := index to Count-2 do
      fElem[i] := fElem[i+1];
    fElem[Count-1] := nil;
    dec(fCount);
  end;
end;

procedure T_PingerList.SetMax(const Value: Integer);
begin
  fMax := Value;
  SetLength(fElem, fMax);
end;

procedure T_PingerList.AddElem(ip : string);    
var Elem : T_Elem;
begin
  Elem := T_Elem.create2(true, ip);
  AddElem(Elem); 
end;

procedure T_PingerList.ClearResults;
var i : integer;
begin
  for i := 0 to Count -1 do
    Elem[i].Results.Clear();

end;

procedure T_PingerList.SinglePing;
begin
  StartPing;
  sleep(2000);
  StopPing;
end;

procedure T_PingerList.StartPing;
var i : integer;
begin
  for i := 0 to Count -1 do
    Elem[i].Resume;
  for i := 0 to Count -1 do
    Elem[i].Suspended := false;
end;

procedure T_PingerList.StopPing;
var i : integer;
begin
  for i := 0 to Count -1 do
    Elem[i].Terminate;
end;


{
******************************* T_PingResultList *******************************
}
constructor T_PingResultList.Create;
begin
  inherited;
  SetCapacity( 0 );
  SetCapacity( 16 );
  fCount := 0;
end;

procedure T_PingResultList.Add(aItem : T_PingResult);
begin
  if (Count >= Capacity)
 then
    Grow;
  FItem[Count] := aItem;
  inc(fCount);
end;

procedure T_PingResultList.Clear(hard : boolean = false);
begin
  if Hard
  then
    SetCapacity(0)
  else
    fCount := 0;
end;

procedure T_PingResultList.Delete(Index : integer);
var
  i: Integer;
begin
  if Index< Count
  then begin
    for i := Index to Count-2 do
      FItem[i] := FItem[i+1];
    dec(fCount);
    if Count < Capacity - ( Capacity div 4)
    then
      SetCapacity(Capacity - ( Capacity div 5) );
  end;
end;

function T_PingResultList.GetItem(Index: Integer): T_PingResult;
begin
  if ( index < count ) and (index >=0 )
  then  Result := FItem[index]
  else begin
     Result.DataSize := 0;
     result.IP := '0.0.0.0';
     result.Time := 0;
     result.Status := 'NULL';
  end;
end;

function T_PingResultList.Get_Item(Index: Integer): T_PingResult;
begin
  Result := FItem[index];
end;

procedure T_PingResultList.Grow;
begin
  SetCapacity( 4 + Count + (Count div 4) );
end;

procedure T_PingResultList.Insert(aItem : T_PingResult; Index : integer);
var
  i: Integer;
begin
  if Index < Count
  then begin
    Add(aItem);
    for i := Index to Count-1 do
      FItem[i+1] := FItem[i];
    FItem[index] := aItem;
  end
  else Add(aItem);
end;

function T_PingResultList.Last: T_PingResult;
begin
  Result := Item[fCount-1]
end;

procedure T_PingResultList.SetCapacity(NewCapacity : integer);
begin
  if ( NewCapacity <> Capacity )
  then begin
    Capacity := NewCapacity;
    SetLength(FItem, Capacity);
    if ( Capacity <= Count )
    then
      fCount := Capacity;
  end;
end;

procedure T_PingResultList.SetItem(Index: Integer; Value: T_PingResult);
begin
  if ( index < count )
  then  FItem[index] := Value;
end;

function T_PingResultList.Statistics: string;
var
  aMax, aMin, aFailed: Integer;
  aAvg: Integer;
  i, a: Integer;
  _cnt : integer;
  function Min(const aaa,bbb : integer) : integer;
  begin
    if aaa< bbb then result := aaa
                else result := bbb;
  end;
  function Max(const aaa,bbb : integer) : integer;
  begin
    if aaa> bbb then result := aaa
                else result := bbb;
  end;
  
begin
  aMax := 0;
  aMin := 3000;
  aAvg := 0;
  aFailed := 0;
  Result := 'statistics can not be calculated';
  if ( Count > 0 )
  then begin
    _cnt := 0;
    for i := 0 to Count-1 do
    begin
      a := _Item[i].Time;
      if a = -1
      then
         inc(aFailed)
      else begin
        inc(_cnt);
        aAvg := aAvg + a;
        aMin := Min(aMin, a);
        aMax := Max(aMax, a);
      end;
    end;
    if _cnt >0
    then
      aAvg := round(aAvg / _cnt)
    else
      aAvg := 0;
    Result := Format('Min: %d; Max: %d; Avg: %d; Lost: %d/%d(%3.1f',
                     [aMin, aMax, aAvg, aFailed, count, 100*aFailed/Count ])+'%)';
  end;


end;


initialization

  PingerList := T_PingerList.Create;

end.
