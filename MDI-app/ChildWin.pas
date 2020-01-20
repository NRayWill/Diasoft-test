unit CHILDWIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Dialogs, SysUtils, Vcl.StdActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.ExtActns;

type
  TMDIChild = class(TForm)
    RichEdit1: TRichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    OpenDialog1: TOpenDialog;
    ToolButton2: TToolButton;
    SaveDialog1: TSaveDialog;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ColorDialog1: TColorDialog;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    FontDialog1: TFontDialog;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ImageList1: TImageList;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditStrikeOut1: TRichEditStrikeOut;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TMDIChild.Edit1Enter(Sender: TObject);
begin
  RichEdit1.SelAttributes.Size := StrToInt(Edit1.Text);
end;

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMDIChild.ToolButton13Click(Sender: TObject);
begin
  if (ColorDialog1.Execute) then
    RichEdit1.SelAttributes.Color := ColorDialog1.Color;
end;

procedure TMDIChild.ToolButton16Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    RichEdit1.Font := FontDialog1.Font;
end;

procedure TMDIChild.ToolButton1Click(Sender: TObject);
begin
  if (OpenDialog1.Execute = true) then
  begin
    RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;

end;

procedure TMDIChild.ToolButton2Click(Sender: TObject);
begin
  if (SaveDialog1.Execute = true) then
  begin
    RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

end.
