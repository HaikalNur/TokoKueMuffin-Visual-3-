object Form2: TForm2
  Left = 246
  Top = 177
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
