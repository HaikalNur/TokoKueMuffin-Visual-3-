unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
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
    procedure OnCell(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure btn4Click(Sender: TObject);
    procedure RefreshDataAndView;
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn6Click(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;
procedure TForm4.posisiawal;
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

procedure TForm4.RefreshDataAndView;
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

procedure TForm4.OnCell(Column: TColumn);
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

procedure TForm4.btn1Click(Sender: TObject);
begin
bersih;
btn1.Enabled:=False;
btn2.Enabled:=True;
btn3.Enabled:=True;
btn4.Enabled:=False;
btn5.Enabled:=True;

edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
end;

procedure TForm4.btn2Click(Sender: TObject);

var
  KodeBarangExists, NamaExists: Boolean;

begin
  if edt2.Text = '' then
    ShowMessage('Nama TIDAK BOLEH KOSONG!')
  else if edt3.Text = '' then
    ShowMessage('Alamat TIDAK BOLEH KOSONG!')
  else if edt4.Text = '' then
    ShowMessage('Telp TIDAK BOLEH KOSONG!')
  else if edt5.Text = '' then
    ShowMessage('Tipe TIDAK BOLEH KOSONG!')
  else
  begin


    // Check if 'nama' already exists in the database
    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT COUNT(*) FROM supplier WHERE nama = :Nama');
    zqry1.ParamByName('Nama').AsString := edt3.Text;
    zqry1.Open;
    NamaExists := zqry1.Fields[0].AsInteger > 0;
    zqry1.Close;

    if NamaExists then
    begin
      if NamaExists then
        ShowMessage('Duplicate Nama!');
      // Show a message or handle duplicate entry according to your requirements
    end
    else
    begin
      // Insert data into the database
      zqry1.SQL.Clear;
      zqry1.SQL.Add('INSERT INTO supplier (`nama`, alamat, telp, tipe) ' +
                    'VALUES (:KodeBarang, :Nama, :Harga, :Stok)');
      zqry1.ParamByName('KodeBarang').AsString := edt2.Text;
      zqry1.ParamByName('Nama').AsString := edt3.Text;
      zqry1.ParamByName('Harga').AsString := edt4.Text;
      zqry1.ParamByName('Stok').AsString := edt5.Text;
      zqry1.ExecSQL;
    end;

    // Refresh the dataset
    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT * FROM supplier');
    zqry1.Open;


  end;
end;

procedure TForm4.btn4Click(Sender: TObject);

var
  DeleteID: Integer;
  MaxID: Integer;
begin
  // Check if edt1 contains a valid integer
  if TryStrToInt(edt1.Text, DeleteID) then
  begin
    // Delete the record based on the entered ID
    zqry1.SQL.Clear;
    zqry1.SQL.Add('DELETE FROM supplier WHERE id = :ID');
    zqry1.ParamByName('ID').AsInteger := DeleteID;
    zqry1.ExecSQL;

    // Update to resequence the IDs
    zqry1.SQL.Clear;
    zqry1.SQL.Add('SET @count = 0;');
    zqry1.ExecSQL;

    zqry1.SQL.Clear;
    zqry1.SQL.Add('UPDATE supplier SET id = (@count:=@count+1);');
    zqry1.ExecSQL;

    // Refresh the dataset after deletion and resequencing
    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT * FROM supplier');
    zqry1.Open;
      // Get the maximum ID currently in the table
    zqry1.Close;
    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT MAX(id) AS MaxID FROM supplier');
    zqry1.Open;
    if not zqry1.FieldByName('MaxID').IsNull then
    begin
      // Obtain the maximum ID and set auto-increment to the next available ID
      MaxID := zqry1.FieldByName('MaxID').AsInteger;
      zqry1.Close;
      zqry1.SQL.Clear;
      zqry1.SQL.Add('ALTER TABLE supplier AUTO_INCREMENT = :NewAutoIncrement');
      zqry1.ParamByName('NewAutoIncrement').AsInteger := MaxID + 1; // Start from the next available ID
      zqry1.ExecSQL;
      RefreshDataAndView;
    end;
  end
  else
    ShowMessage('Invalid ID entered!');
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
zqry1.SQL.Clear;
zqry1.SQL.Add('UPDATE supplier SET `nama` = :Nama, alamat = :Alamat, telp = :Telp, tipe = :Tipe  WHERE id = :ID');
zqry1.ParamByName('Nama').AsString := edt2.Text;
zqry1.ParamByName('Alamat').AsString := edt3.Text;
zqry1.ParamByName('Telp').AsString := edt4.Text;
zqry1.ParamByName('Tipe').AsString := edt5.Text;
zqry1.ParamByName('ID').AsString := edt1.Text;
zqry1.ExecSQL;

// Refresh the dataset
zqry1.Close;
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM supplier');
zqry1.Open;

ShowMessage('DATA BERHASIL DIUPDATE!');
posisiawal; // Assuming this is a custom method to reset the position or perform some other action
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.btn6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
