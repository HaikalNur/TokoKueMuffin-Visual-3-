unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm5 = class(TForm)
    lbl1: TLabel;
    telepon: TLabel;
    Alamat: TLabel;
    Kota: TLabel;
    KodePos: TLabel;
    Label1: TLabel;
    dbgrd1: TDBGrid;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure RefreshDataandView;
    procedure OnCell(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}
procedure TForm5.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;
procedure TForm5.posisiawal;
begin
bersih;
btn1.Enabled:=True;
btn2.Enabled:=False;
btn3.Enabled:=False;
btn4.Enabled:=True;
btn5.Enabled:=False;

edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
end;

procedure TForm5.RefreshDataAndView;
begin
  // Refresh the dataset after deletion or insertion
  zqry1.Close;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('SELECT * FROM supplier');
  zqry1.Open;

  // Inform DBGrid to refresh its view
  dbgrd1.DataSource := nil; // Detach the DataSource temporarily
  dbgrd1.DataSource := ds1; // Reattach the DataSource
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.OnCell(Column: TColumn);

var
  SelectedRow: Integer;
  ClickedColumn: Integer;
  FieldName: string;
begin
  edt1.Enabled:= False;
  edt2.Enabled:= True;
  edt3.Enabled:= True;
  edt4.Enabled:= True;
  edt5.Enabled:= True;
  SelectedRow := dbgrd1.DataSource.DataSet.RecNo;

  ClickedColumn := Column.Index; // Get the index of the clicked column

  FieldName := dbgrd1.Columns[ClickedColumn].FieldName;
  // Retrieve field name based on the clicked column index

  // Display data from the clicked cell's row and column in Edit components
  if not dbgrd1.DataSource.DataSet.IsEmpty then
  begin
    dbgrd1.DataSource.DataSet.RecNo := SelectedRow; // Move to the clicked row
    edt1.Text := dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
    edt2.Text := dbgrd1.DataSource.DataSet.FieldByName('nama').AsString;
    edt3.Text := dbgrd1.DataSource.DataSet.FieldByName('alamat').AsString;
    edt4.Text := dbgrd1.DataSource.DataSet.FieldByName('telp').AsString;
    edt5.Text := dbgrd1.DataSource.DataSet.FieldByName('tipe').AsString;
    // Display data from the clicked cell in the respective Edit
    // Adjust 'FieldName' to the actual field name corresponding to the clicked column
  end;
end;

end.
