unit f_Connection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConForm = class(TForm)
    LogEdit: TEdit;
    PasEdit: TEdit;
    ConBtn: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure ConBtnClick(Sender: TObject);
    procedure PasEditKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConForm: TConForm;

implementation

{$R *.dfm}

procedure TConForm.Button3Click(Sender: TObject);
begin
//Close;
end;



procedure TConForm.ConBtnClick(Sender: TObject);
begin

if Conform.LogEdit.Text = ''
    then
      begin
      MessageDlg('Не введён логин', mtError, [mbOk], 0);
      LogEdit.SetFocus;
      end
    else
     if Conform.PasEdit.Text = ''
        then
          begin
            MessageDlg('Не введён пароль', mtError, [mbOk], 0);
            PasEdit.SetFocus;
          end
        else ConForm.ModalResult:=mrOk;


end;

procedure TConForm.PasEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then ConBtn.Click;

end;

end.
