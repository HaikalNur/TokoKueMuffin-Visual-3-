unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  zqry1.SQL.Text := 'SELECT * FROM login WHERE nama = :username AND password = :password';
  zqry1.ParamByName('username').AsString := edt1.Text;
  zqry1.ParamByName('password').AsString := edt2.Text;
  zqry1.Open;

  if not zqry1.IsEmpty then
  begin
    ShowMessage('Login successful!');

    // Hide Form1 instead of closing it
    Hide;

    // Create and show Form2
    Form2 := TForm2.Create(Self);
    try
      Form2.ShowModal;
    finally
      // When Form2 is closed, show Form1 again
      Show;
      Form2.Free;
    end;
  end
  else
    ShowMessage('Invalid username or password');
end;


procedure TForm1.btn2Click(Sender: TObject);
begin
  zqry1.SQL.Text := 'SELECT COUNT(*) AS UserCount FROM login WHERE nama = :username';
  zqry1.ParamByName('username').AsString := edt1.Text;
  zqry1.Open;

  if zqry1.FieldByName('UserCount').AsInteger > 0 then
  begin
    ShowMessage('Username already exists. Please choose a different username.');
    Exit; // Exit the procedure if the username already exists
  end;

  // If the username doesn't exist, proceed with registration
  zqry1.Close; // Close the previous query

  zqry1.SQL.Text := 'INSERT INTO login (nama, password) VALUES (:username, :password)';
  zqry1.ParamByName('username').AsString := edt1.Text;
  zqry1.ParamByName('password').AsString := edt2.Text;

  zqry1.ExecSQL;

  ShowMessage('Registration successful!');

end;

end.
