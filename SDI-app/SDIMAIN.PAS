unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  System.Actions;

type
  TSDIAppForm = class(TForm)
    OpenDialog: TOpenDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileOpenItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label1: TLabel;
    Ñóììû: TLabel;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    BtnClear: TButton;
    procedure FileOpen1Execute(Sender: TObject);
    procedure FillForm();
    procedure ClearForm();
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

implementation

uses About, ComObj, SysUtils, Variants;

Var
  Ap: Variant;

{$R *.dfm}

function Contains(str: string; arr: array of string): boolean;
var
  i: Integer;
begin
  for i := Low(arr) to High(arr) do
    if (str = arr[i]) then
      Exit(true);
  result := false;
end;

procedure TSDIAppForm.ClearForm();
begin
  ListBox1.Clear;
  ListBox2.Clear;
  RadioGroup1.ItemIndex := -1;
  Edit1.Text := '';
end;

procedure TSDIAppForm.FileOpen1Execute(Sender: TObject);
begin
  FillForm();
end;

procedure TSDIAppForm.BtnClearClick(Sender: TObject);
begin
  ClearForm();
end;

procedure TSDIAppForm.Button1Click(Sender: TObject);
begin
  FillForm();
end;

procedure TSDIAppForm.FillForm();
var
  WorkSheet: TObject;
  i, idx: Integer;
  names: array [0 .. 99] of string;
  name, value: string;
  summ: double;
  isDublicatesExist: boolean;
begin
  if (OpenDialog.Execute) then
  begin
    idx := 0;
    summ := 0;
    isDublicatesExist := false;
    ClearForm();
    Ap := CreateOleObject('Excel.Application');
    try
      Ap.Workbooks.Open(OpenDialog.FileName, 0, true);
      For i := 0 to 99 do
      begin
        name := Ap.Range['A' + IntToStr(i + 1)];
        if (name <> '') then
        begin
          if (Not Contains(name, names)) then
          begin
            Inc(idx);
            names[idx] := name;
            ListBox1.Items.Add(name);
          end
          else
          begin
            isDublicatesExist := true;
          end;
        end;

        value := Ap.Range['B' + IntToStr(i + 1)];
        if (value <> '') then
        begin
          summ := summ + StrToFloat(value);
          ListBox2.Items.Add(value);
        end;
      end;
      if isDublicatesExist then
        RadioGroup1.ItemIndex := 0
      else
        RadioGroup1.ItemIndex := 1;
      Edit1.Text := FloatToStr(summ);
    except
      MessageDlg('Cannot open MS Excel document!'#13'(' + OpenDialog.FileName +
        ')', mtError, [mbOk], 0);
      Exit;
    end;
  end;
end;

procedure TSDIAppForm.Button2Click(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, mbYesNo, 0) = mrYes then
    Close;
end;

procedure TSDIAppForm.FileExit1Execute(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, mbYesNo, 0) = mrYes then
    Close;
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

end.
