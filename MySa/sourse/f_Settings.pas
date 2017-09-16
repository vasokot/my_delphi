unit f_Settings;

interface

uses
Unit1,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSetForm = class(TForm)
    ServEdit: TEdit;
    DBEdit: TEdit;
    OkBtn: TButton;
    CnlBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure CnlBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetForm: TSetForm;

implementation

{$R *.dfm}

function ItIsIp(str:string):boolean;
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

procedure TSetForm.OkBtnClick(Sender: TObject);
begin
if not ItIsIp(ServEdit.Text)
  then
    begin
      MessageDlg('В поле Server нужно ввести IP сервера',mtError,[mbOK],0);
      Exit;
    end
  else
    begin
    if Trim(DBEdit.Text) = ''
        then MessageDlg('В поле DB Name нужно ввести Имя базы данных',mtError,[mbOK],0)
        else SetForm.ModalResult:= mrOK;
    end;
 end;

procedure TSetForm.CnlBtnClick(Sender: TObject);
begin
Close;
end;

end.
