unit fDictExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IniFiles,
  Vcl.ExtCtrls;

type
  TfrmDictExp = class(TForm)
    mFileDictExp: TMemo;
    lbSections: TListBox;
    Panel1: TPanel;
    btnLoad: TButton;
    btnSave: TButton;
    btnSections: TButton;
    lbParams: TListBox;
    btnParams: TButton;
    Button1: TButton;
    Edit1: TComboBox;
    Button2: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSectionsClick(Sender: TObject);
    procedure btnParamsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FFileExp: String; // имя файла исключений
// FDictExp: TIniFile;
//    FExcDict: TExceptionDict (* TExceptionDic *);

  public
    { Public declarations }
  end;

var
  frmDictExp: TfrmDictExp;

implementation

{$R *.dfm}

uses frmMainTest;

procedure TfrmDictExp.btnLoadClick(Sender: TObject);
var
  fs: TStringList;
begin
  mFileDictExp.Lines.Clear;
  fs:=TStringList.Create;
  fs.LoadFromFile(FFileExp);
  mFileDictExp.Lines:=fs; // .LoadFromFile(FFileExp);
  fs.Free;
end;

procedure TfrmDictExp.btnParamsClick(Sender: TObject);
begin
// FDictExp.ReadSection(lbSections.Items[lbSections.ItemIndex], lbParams.Items);
(*  lbParams.Items:=FExcDict.GetParams(lbSections.Items[lbSections.ItemIndex]);
  lbParams.ItemIndex:=0;*)
end;

procedure TfrmDictExp.btnSaveClick(Sender: TObject);
begin
// mFileDictExp.Lines.SaveToFile(FFileExp);
end;

procedure TfrmDictExp.btnSectionsClick(Sender: TObject);
begin
(*  lbSections.Items:=FExcDict.GetNameSections;
  lbSections.ItemIndex:=0;*)
end;

procedure TfrmDictExp.Button1Click(Sender: TObject);
begin
//  mFileDictExp.Lines.Add('Ударение на '+IntToStr(FExcDict.AccentInfo(Edit1.Text)));
  if FExcDict.Present(Edit1.Text, lbSections.Items[lbSections.ItemIndex]) then
    mFileDictExp.Lines.Add('Есть')
  else
    mFileDictExp.Lines.Add('Нет');
end;

procedure TfrmDictExp.Button2Click(Sender: TObject);
var S: String;
begin
  S:=lbParams.Items[lbParams.ItemIndex];
  mFileDictExp.Lines.Add('Первое слово есть = "'+SelectWord(1, S, '=')+'"');
  mFileDictExp.Lines.Add('Второе слово есть = "'+SelectWord(2, S, '=')+'"');
  mFileDictExp.Lines.Add(FExcDict.GetRightPart(Trim(SelectWord(1, lbParams.Items[lbParams.ItemIndex], '=')), lbSections.Items[lbSections.ItemIndex]));
(*  FExcDict.FileName:='E:\DevelopXE\Declension\trunk\Except.dic';
  FFileExp:=FExcDict.FileName;*)
end;

procedure TfrmDictExp.FormCreate(Sender: TObject);
begin
  FFileExp:=frmTest.Decl.GetExceptionsFileName;

  FExcDict:=TExceptionDict.Create(FFileExp);
  FExcDict.ReadFile;
end;

procedure TfrmDictExp.FormDestroy(Sender: TObject);
begin
  FExcDict.Free;
end;

end.
