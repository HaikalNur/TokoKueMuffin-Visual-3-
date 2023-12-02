object Form1: TForm1
  Left = 454
  Top = 254
  Width = 526
  Height = 373
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 24
    Top = 24
    Width = 457
    Height = 249
    Caption = 'Login'
    TabOrder = 0
    object lbl1: TLabel
      Left = 104
      Top = 120
      Width = 46
      Height = 13
      Caption = 'password'
    end
    object lbl2: TLabel
      Left = 104
      Top = 56
      Width = 47
      Height = 13
      Caption = 'username'
    end
    object edt1: TEdit
      Left = 176
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'admin'
    end
    object edt2: TEdit
      Left = 176
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'admin'
    end
    object btn1: TButton
      Left = 96
      Top = 176
      Width = 75
      Height = 25
      Caption = 'login'
      TabOrder = 2
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 288
      Top = 176
      Width = 75
      Height = 25
      Caption = 'register'
      TabOrder = 3
      OnClick = btn2Click
    end
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_toko'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\moxy\Desktop\TOKOKUE\libmysql.dll'
    Left = 72
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from login')
    Params = <>
    Left = 32
  end
end
