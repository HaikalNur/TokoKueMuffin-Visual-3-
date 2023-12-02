object Form2: TForm2
  Left = 291
  Top = 379
  Width = 654
  Height = 289
  Caption = 'MainMenu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnClose = Close
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 521
    Height = 171
    Caption = 
      'Error Dibagian Exit Memory Access, saya tidak tau cara'#13#10'memperba' +
      'iki nya'#13#10'untuk bagian terletak disetiap Form saya tidak sempat m' +
      'enaruh di menu'#13#10#13#10'Nama : Muhammad Haikal Nurrahman'#13#10'NPM:21100101' +
      '80'#13#10'Kelas : 5E Reg BJM'#13#10#13#10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mm1: TMainMenu
    object mnimain1: TMenuItem
      Caption = 'tabel'
      object mniKaryawan1: TMenuItem
        Caption = 'Barang'
        OnClick = mniKaryawan1Click
      end
      object mniSupplier1: TMenuItem
        Caption = 'Supplier'
        OnClick = mniSupplier1Click
      end
      object Pe1: TMenuItem
        Caption = 'Pelanggan'
        OnClick = Pe1Click
      end
      object mniPenjualan1: TMenuItem
        Caption = 'Transaksi Penjualan'
      end
      object mniItemPenjualan1: TMenuItem
        Caption = 'Item Penjualan'
      end
    end
    object mnimenu: TMenuItem
      Caption = 'laporan'
    end
    object exit1: TMenuItem
      Caption = 'exit'
      OnClick = exit1Click
    end
  end
end
