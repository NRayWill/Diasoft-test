unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons,
  Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions, CHILDWIN, Vcl.Tabs;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ControlBar1: TControlBar;
    TabSet1: TTabSet;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
    procedure ActiveFormChanged(Sender: TObject);
  public
    { Public declarations }
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  end;

var
  MainForm: TMainForm;
  ChildCount: Integer;

implementation

{$R *.dfm}

uses About;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  Inc(ChildCount);
  Child.Caption := IntToStr(ChildCount);
  if FileExists(Name) then
    Child.RichEdit1.Lines.LoadFromFile(Name);

  TabSet1.Tabs.Add(IntToStr(ChildCount));
end;

procedure TMainForm.Notification(AComponent: TComponent; Operation: TOperation);
var
  tabNum: Integer;
begin
  inherited;
  if (Operation = opRemove) and (AComponent is TForm) and
    (TForm(AComponent).FormStyle = fsMDIChild) then
  begin
    tabNum := TabSet1.Tabs.IndexOf(TForm(AComponent).Caption);
    TabSet1.Tabs.Delete(tabNum);
  end;
end;

procedure TMainForm.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
  i: Integer;
  str: string;
begin
  str := TabSet1.Tabs[NewTab];
  for i := 0 to MDIChildCount - 1 do
    if MDIChildren[i].Caption = str then
      MDIChildren[i].Show;
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('');
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Screen.OnActiveFormChange := ActiveFormChanged;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
end;

procedure TMainForm.ActiveFormChanged(Sender: TObject);
var
  tabNum: Integer;
begin
  { Do what you want to do }

  if TabSet1.TabIndex <> -1 then
  begin
    tabNum := TabSet1.Tabs.IndexOf(ActiveMDIChild.Caption);
    TabSet1.TabIndex := (tabNum);
  end;

end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

// Close by number
procedure TMainForm.N3Click(Sender: TObject);
var
  value: string;
  number, i: Integer;
begin
  if MDIChildCount <= 0 then
    Exit;

  value := InputBox('�������', '����� ���� ������� �������?', '');
  if value = '' then
    Exit;

  if (not TryStrToInt(value, number)) or ((number < 1) or (number > 99)) then
    MessageBox(handle, PChar('������������ ��������'), PChar('������'),
      MB_ICONINFORMATION + MB_OK)
  else
  begin
    for i := 0 to MDIChildCount - 1 do
      if MDIChildren[i].Caption = value then
        MDIChildren[i].Close();
  end;

end;

// Close latest
procedure TMainForm.N4Click(Sender: TObject);
begin
  if MDIChildCount > 0 then
  begin
    MDIChildren[0].Close();
  end;
end;

// Close all
procedure TMainForm.N5Click(Sender: TObject);
var
  i, Count: Integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].Close;
end;

// Add
procedure TMainForm.N7Click(Sender: TObject);
begin
  CreateMDIChild('');
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

end.
