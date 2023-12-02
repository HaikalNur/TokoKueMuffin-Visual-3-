unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Menus;

type
  TForm2 = class(TForm)
    mm1: TMainMenu;
    mnimenu: TMenuItem;
    mnimain1: TMenuItem;
    exit1: TMenuItem;
    mniKaryawan1: TMenuItem;
    mniSupplier1: TMenuItem;
    Pe1: TMenuItem;
    mniPenjualan1: TMenuItem;
    mniItemPenjualan1: TMenuItem;
    procedure exit1Click(Sender: TObject);
    procedure Close(Sender: TObject; var Action: TCloseAction);
    procedure mniKaryawan1Click(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form2: TForm2;

implementation
uses Unit1;

{$R *.dfm}


procedure TForm2.exit1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.Close(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm2.mniKaryawan1Click(Sender: TObject);

var
  Form3: TForm3; // Declare a variable to hold Form3
begin
  Form3 := TForm3.Create(Self); // Create an instance of Form3
  try
    Form3.ShowModal; // Show Form3 modally
  finally
    Form3.Free; // Free the memory occupied by Form3 when it's closed
  end;
end;

end.