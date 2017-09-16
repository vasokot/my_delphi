unit Main;

interface

uses
  uPinger,
  Jpeg,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ExtDlgs, Menus;

type
  TPingForm = class(TForm)
    IPEdit1: TEdit;
    Button1: TButton;
    PctSizeBtn1: TUpDown;
    PctSizeEdit1: TEdit;
    PingBtn1: TButton;
    SaveDialog1: TSaveDialog;
    ResultMemo: TMemo;
    StatEdit: TEdit;
    StatSaveBtn: TButton;
    PingIntEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PingIntBtn: TUpDown;
    Label3: TLabel;
    SaveDialog2: TSaveDialog;
    CheckBox1: TCheckBox;
    ResultImg: TImage;
    SavePictureDialog1: TSavePictureDialog;
    PopupMenu1: TPopupMenu;
    SaveImageAs1: TMenuItem;
    StatusBar1: TStatusBar;
    CheckBox2: TCheckBox;
    procedure SaveImageAs1Click(Sender: TObject);
    procedure ResultImgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ResultImgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ResultImgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PctSizeEdit1Change(Sender: TObject);
    procedure PingIntEditChange(Sender: TObject);
    procedure IPEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnPingerResultChange(Sender: TObject);
    procedure StatSaveBtnClick(Sender: TObject);
    procedure PingBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PingForm: TPingForm;
  Pinger1: T_Pinger;
  t: integer;
  x0,y0:integer;
  move:boolean;
  rec: TRect;
  const
    StartPingCaption : string = 'Start';
    StopPingCaption : string = 'Stop';
implementation

{$R *.dfm}



procedure TPingForm.PctSizeEdit1Change(Sender: TObject);
begin
if Pinger1 <> nil then Pinger1.PingBufferSize := PctSizeBtn1.Position;
end;

procedure TPingForm.PingBtn1Click(Sender: TObject);
var
localPinger: ^T_Pinger;
Btn: TButton;
IP: string;
PingSize: Integer;
begin
  t:=1;
  localPinger := nil;
  Btn := nil;
  IP:= IPEdit1.Text;
  PingSize := 0;
if Sender = PingBtn1 then
    begin
            localPinger := @Pinger1;
      Btn := PingBtn1;
      IP := IPEdit1.Text;
   //   PingSize := PctSizeBtn1.Position;
      PingSize := StrToInt(trim(PctSizeEdit1.Text));
      PingForm.Caption:= IP;
      end;
if Btn <> nil then
         begin
         if localPinger^ <> nil then
        begin
          FreeAndNil(localPinger^);
          Btn.Caption := StartPingCaption;
        end
                             else
         begin
            ResultImg.Canvas.Pen.Color := clWhite;
            ResultImg.Canvas.Brush.Color := clWhite;
            ResultImg.Canvas.Rectangle(0,0, ResultImg.Width, ResultImg.Height);
            ResultMemo.Lines.Clear;
            localPinger^ := T_Pinger.create2(false, IP);
            localPinger.OnResultChange := OnPingerResultChange;
            localPinger.PingInterval := PingIntBtn.Position;
            localPinger.PingBufferSize := PingSize;
            Btn.Caption := StopPingCaption;
         end;
end;
end;



procedure TPingForm.IPEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then PingBtn1.Click;
end;

procedure TPingForm.OnPingerResultChange(Sender: TObject);

  function sss(i : integer): string;
  begin
    if i=0
    then
      result := '<1'
    else
      result := IntToStr(i);
  end;

  function PingToStr(PingRes : T_PingResult): string;
  begin

    if PingRes.Time >= 0
    then
      result :=
      Format('%s %s %s  "%s" %s ms (%db) ' ,
              [IntToStr(t), FormatDateTime('hh:nn:ss',PingRes.Date),PingRes.IP, PingRes.Status, sss(PingRes.Time), PingRes.DataSize
              ]
            )
    else
       begin
      if checkbox2.Checked then ShowMessage('Alarm!!!');
      result := Format('%s %s *** "%s"  *** %s' ,[IntToStr(t), FormatDateTime('hh:nn:ss',PingRes.Date), PingRes.IP, PingRes.Status]);
       end
  end;

begin
  if Sender = Pinger1 then
      begin
        ResultMemo.Lines.Add( PingToStr(Pinger1.Results.Last) );
        StatEdit.Text := Pinger1.Results.Statistics;
        ResultImg.Canvas.Pen.Color := clBlue;
        if Pinger1.Results.Last.Time >= ResultImg.Height  then
                  begin
                  ResultImg.Height := Pinger1.Results.Last.Time + 50;
                  ResultImg.Picture.Bitmap.Height := Pinger1.Results.Last.Time + 50;
                  end;

        if Pinger1.Results.Last.Time = -1
          then
            begin
              ResultImg.Canvas.Pen.Color := clRed;
              ResultImg.Canvas.MoveTo(t,ResultImg.Height-30-Pinger1.Results.Last.Time);
              ResultImg.Canvas.LineTo(t,ResultImg.Height-30-Pinger1.Results.Last.Time+20);
            end
          else
            begin
        StatusBar1.Panels[1].Text := IntToStr(Pinger1.Results.Last.Time);
        ResultImg.Canvas.MoveTo(t,ResultImg.Height-30-Pinger1.Results.Last.Time);
        ResultImg.Canvas.LineTo(t,ResultImg.Height-30-Pinger1.Results.Last.Time+1);
            end;

        if t mod 50 = 0 then begin
                             ResultImg.Canvas.Pen.Color := clRed;
                             ResultImg.Canvas.MoveTo(t,ResultImg.Height);
                             ResultImg.Canvas.LineTo(t,ResultImg.Height-15);
                             ResultImg.Picture.Bitmap.Canvas.Font.Color := clBlack;
                             ResultImg.Picture.Bitmap.Canvas.Font.Size := 8;
                             ResultImg.Picture.Bitmap.Canvas.TextOut(t, ResultImg.Height-25, IntToStr(t));
                             end;

        if t mod 10 = 0 then begin
                             ResultImg.Canvas.Pen.Color := clBlack;
                             ResultImg.Canvas.MoveTo(t,ResultImg.Height);
                             ResultImg.Canvas.LineTo(t,ResultImg.Height-10);
                             end;

        if t mod 5 = 0 then begin
                             ResultImg.Canvas.Pen.Color := clBlack;
                             ResultImg.Canvas.MoveTo(t,ResultImg.Height);
                             ResultImg.Canvas.LineTo(t,ResultImg.Height-5);
                            end;



        if StrToInt(FormatDateTime('hhnnss',Pinger1.Results.Last.Date)) mod 100 = 0 then
                             begin
                             ResultImg.Canvas.Pen.Color := clRed;
                             ResultImg.Canvas.MoveTo(t,0);
                             ResultImg.Canvas.LineTo(t,25);
                             ResultImg.Picture.Bitmap.Canvas.Font.Color := clBlack;
                             ResultImg.Picture.Bitmap.Canvas.Font.Size := 7;
                             ResultImg.Picture.Bitmap.Canvas.TextOut(t, 27, FormatDateTime('hh:nn:ss',Pinger1.Results.Last.Date));
                             ResultImg.Canvas.Pen.Color := clRed;
                             ResultImg.Canvas.MoveTo(t,40);
                             ResultImg.Canvas.LineTo(t,65);
                             end;

         if StrToInt(FormatDateTime('hhnnss',Pinger1.Results.Last.Date)) mod 10 = 0 then
                             begin
                             ResultImg.Canvas.Pen.Color := clRed;
                             ResultImg.Canvas.MoveTo(t,0);
                             ResultImg.Canvas.LineTo(t,15);
                             end;

          if t = ResultImg.Width then
                             begin
                             ResultImg.Width := ResultImg.Width + 100;
                             ResultImg.Picture.Bitmap.Width:= ResultImg.Picture.Bitmap.Width + 100;
                             end;
          t:=t+1;

          if Checkbox1.Checked then
            begin
              if SaveDialog2.FileName = '' then SaveDialog2.Execute;
              ResultMemo.Lines.SaveToFile(SaveDialog2.FileName + '.txt');
              PingForm.Caption:=IPEdit1.Text + '>>' + SaveDialog2.FileName;
            end;
      end;
end;


procedure TPingForm.SaveImageAs1Click(Sender: TObject);
var
MyJpg:tjpegimage;
begin
if SavePictureDialog1.Execute then
          begin
 MyJpg := tjpegimage.create;
 MyJpg.Assign(ResultImg.Picture.Bitmap);
 MyJpg.SaveToFile(SavePictureDialog1.FileName + '.jpg');
          end;
   //ResultImg.Picture.SaveToFile(SavePictureDialog1.FileName + '.bmp');
 end;

procedure TPingForm.StatSaveBtnClick(Sender: TObject);
var
 btnSel : Integer;
begin
   if PingBtn1.Caption = StopPingCaption then
     begin
       btnSel := MessageDlg('Остановить ping?',mtError, mbOKCancel, 0);
       if BtnSel = mrOK  then PingBtn1.Click
       //SaveDialog1.FileName:= IPEdit1.Text
     end;
   if SaveDialog1.Execute then
          begin
            ResultMemo.Lines.Add('==========СТАТИСТИКА===========');
            ResultMemo.Lines.Add(StatEdit.Text);
            ResultMemo.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
            PingForm.Caption:=SaveDialog1.FileName;
          end;
end;


procedure TPingForm.Button1Click(Sender: TObject);
begin
IPEdit1.Clear;
IpEdit1.PasteFromClipboard;
PingBtn1.Click;
end;

procedure TPingForm.PingIntEditChange(Sender: TObject);
begin
  if Pinger1 <> nil then Pinger1.PingInterval := PingIntBtn.Position;
end;



procedure TPingForm.ResultImgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button<>mbLeft then move:=false
else begin
move:=true;
x0:=x;
y0:=y;
rec:=ResultImg.BoundsRect; //запоминаем контур картинки
end;

if button = mbMiddle then
      begin
        StatusBar1.Panels[0].Text := IntToStr(ResultImg.Height-30-y) + ' ms';
        //ResultImg.Hint := 
        //ResultImg.ShowHint := true;
      end;

end;

procedure TPingForm.ResultImgMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if move then begin
PingForm.Canvas.DrawFocusRect(rec); //рисуем рамку
with rec do begin
left:=Left+x-x0;
top:=Top+y-y0;
right:=right+x-x0;
bottom:=bottom+y-y0;
x0:=x;
y0:=y; // изменяем координаты
end;
PingForm.Canvas.DrawFocusRect(rec); // рисуем рамку на новом месте
end;
end;


procedure TPingForm.ResultImgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var P: TPoint;
  begin
P:=GetClientOrigin;
if Button = mbRight then PopupMenu1.Popup(x+P.X+ResultImg.Left, y+P.Y+ResultImg.Top);
if button = mbLeft then
    begin
       PingForm.Canvas.DrawFocusRect(rec);
       with ResultImg do begin
       setbounds(rec.left+x-x0,rec.top+y-y0,width,height); //перемещаем картинку
       move:=false;
                         end;
    end;

end;
end.
