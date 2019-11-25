object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Localhost PoC'
  ClientHeight = 288
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    641
    288)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 625
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 558
    Top = 255
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    DefaultPort = 5000
    IOHandler = IdServerIOHandlerSSLOpenSSL1
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 544
    Top = 68
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.RootCertFile = 'certs\M01B_root_CA.crt'
    SSLOptions.CertFile = 'certs\M01B_Devel_GENERIC_127.0.0.1.crt'
    SSLOptions.KeyFile = 'certs\M01B_Devel_GENERIC_127.0.0.1.pem'
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 548
    Top = 12
  end
end
