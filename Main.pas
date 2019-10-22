unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxSSheet;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    tsSpreadSheet: TTabSheet;
    tsXml: TTabSheet;
    mXML: TMemo;
    cxSpread: TcxSpreadSheetBook;
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GenerateXML();
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

uses msxml;

procedure TForm1.GenerateXML;
var
  Doc: IXMLDOMDocument;
  DataElement: IXMLDOMElement;
  I, J: Integer;
  Cell: TcxSSCellObject;
  //R: TRect;
  S, AttrName: string;
  Row: IXMLDOMElement;
begin
  Doc := CoDOMDocument.Create;
  Doc.preserveWhiteSpace := True;
  DataElement := Doc.createElement('data');
  Doc.documentElement := DataElement;
  for J := 0 to cxSpread.ActiveSheet.RowCount - 1 do
  begin
    Row := Doc.createElement('row');
    DataElement.appendChild(Row);
    for I := 0 to cxSpread.ActiveSheet.ColumnCount - 1 do
    begin
      Cell := cxSpread.ActiveSheet.GetCellObject(I, J);
      S := Cell.DisplayText;
      //R := Rect(I, J, I, J);
      //S := cxSpread.CellsNameByRef(cxSpread.ActivePage, R);
      if S <> '' then
      begin
        AttrName := 'c' + IntToStr(I);
        Row.setAttribute(AttrName, S);
      end;
    end;
  end;
  Doc.save('d:\my.xml');
  mXML.Text := Doc.xml;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    GenerateXML();
end;

end.
