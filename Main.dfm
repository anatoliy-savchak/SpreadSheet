object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = cxSpread
  Caption = 'SpreadSheet'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 554
    Height = 290
    ActivePage = tsSpreadSheet
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tsSpreadSheet: TTabSheet
      Caption = 'SpreadSheet'
      object cxSpread: TcxSpreadSheetBook
        Left = 0
        Top = 0
        Width = 546
        Height = 262
        Align = alClient
        DefaultStyle.Font.Name = 'Tahoma'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        ExplicitLeft = 96
        ExplicitTop = 32
        ExplicitWidth = 350
        ExplicitHeight = 200
      end
    end
    object tsXml: TTabSheet
      Caption = 'XML'
      ImageIndex = 1
      object mXML: TMemo
        Left = 0
        Top = 0
        Width = 546
        Height = 262
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'mXML')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
end
