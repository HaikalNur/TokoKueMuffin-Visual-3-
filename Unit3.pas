unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    telepon: TLabel;
    Alamat: TLabel;
    Kota: TLabel;
    KodePos: TLabel;
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
    Label1: TLabel;
    procedure posisiawal;
    procedure bersih;
    procedure OnCell(Column: TColumn);

    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;
procedure TForm3.posisiawal;
begin
bersih;
btn1.Enabled:=True;
btn2.Enabled:=False;
btn3.Enabled:=False;
btn4.Enabled:=False;
btn5.Enabled:=False;

edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
end;



procedure TForm3.OnCell(Column: TColumn);

var
  SelectedRow: Integer;
  ClickedColumn: Integer;
  FieldName: string;
begin
  SelectedRow := dbgrd1.DataSource.DataSet.RecNo;

  ClickedColumn := Column.Index; // Get the index of the clicked column

  FieldName := dbgrd1.Columns[ClickedColumn].FieldName;
  // Retrieve field name based on the clicked column index

  // Display data from the clicked cell's row and column in Edit components
  if not dbgrd1.DataSource.DataSet.IsEmpty then
  begin
    dbgrd1.DataSource.DataSet.RecNo := SelectedRow; // Move to the clicked row
    edt1.Text := dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
    edt2.Text := dbgrd1.DataSource.DataSet.FieldByName('kode-barang').AsString;
    edt3.Text := dbgrd1.DataSource.DataSet.FieldByName('nama').AsString;
    edt4.Text := dbgrd1.DataSource.DataSet.FieldByName('harga').AsString;
    edt5.Text := dbgrd1.DataSource.DataSet.FieldByName('stok').AsString;
    // Display data from the clicked cell in the respective Edit
    // Adjust 'FieldName' to the actual field name corresponding to the clicked column
  end;
end;

end.
