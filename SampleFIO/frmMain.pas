{ Основная форма }
unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, padegFIO, ComCtrls, UITypes, Vcl.Samples.Spin, Vcl.Mask, Vcl.Buttons (*,
    Data.Bind.Components*);

type
  TfrmMainDecl = class(TForm)
    StatusBar1: TStatusBar;
    dlgOpenFileDict: TOpenDialog;
    pgcTop: TPageControl;
    tsFIO: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cbSelectFunc: TComboBox;
    btnDecl: TButton;
    eF: TEdit;
    eI: TEdit;
    eO: TEdit;
    btnSeparateFIO: TButton;
    btnGetSex: TButton;
    btnClearParts: TButton;
    Memo1: TMemo;
    rgSex: TComboBox;
    eFIO: TComboBox;
    btnStart: TButton;
    btnThread: TButton;
    tsOffice: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    btnApp: TButton;
    btnOff: TButton;
    btnAppOff: TButton;
    eAppointment: TComboBox;
    eOffice: TComboBox;
    tsDict: TTabSheet;
    btnNewDict: TButton;
    btnLoadChanges: TButton;
    btnOpenDict: TButton;
    tsNum: TTabSheet;
    pgcResult: TPageControl;
    tsResult: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    btnClearResult: TButton;
    btnNomin: TButton;
    cbPadeg: TComboBox;
    tsLog: TTabSheet;
    mResult: TMemo;
    Label16: TLabel;
    btnTest: TButton;
    rgSource: TRadioGroup;
    bDeclNum: TButton;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    l1: TLabel;
    seDecimal: TSpinEdit;
    cbSex: TComboBox;
    cbFract: TCheckBox;
    cbDelZero: TCheckBox;
    GroupBox2: TGroupBox;
    lblPadeg: TLabel;
    cbAnimate: TCheckBox;
    cbTypeNumeral: TComboBox;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    lForms: TLabel;
    cbCurr: TComboBox;
    seForms: TSpinEdit;
    cbPadegNum: TComboBox;
    bRandomNumber: TButton;
    btnFormingFIO: TButton;
    eNumber: TEdit;
    btn1: TButton;
    btnViewHdbk: TButton;
    dlgOpenHdbk: TOpenDialog;
    lblDict: TLabel;
    lblNdbk: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDeclClick(Sender: TObject);
    procedure btnClearResultClick(Sender: TObject);
    //procedure Button4Click(Sender: TObject);
    procedure btnSeparateFIOClick(Sender: TObject);
    procedure btnClearPartsClick(Sender: TObject);
    procedure eFIOExit(Sender: TObject);
    procedure btnGetSexClick(Sender: TObject);
    //procedure ComboBox1Change(Sender: TObject);
    procedure btnAppClick(Sender: TObject);
    procedure btnOffClick(Sender: TObject);
    procedure btnAppOffClick(Sender: TObject);
    procedure btnLoadChangesClick(Sender: TObject);
    procedure btnNominClick(Sender: TObject);
    procedure cbSelectFuncChange(Sender: TObject);
    procedure btnNewDictClick(Sender: TObject);
    procedure eFIOSelect(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnThreadClick(Sender: TObject);
    procedure btnOpenDictClick(Sender: TObject);
    procedure mResultChange(Sender: TObject);
    procedure eAppointmentChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTestClick(Sender: TObject);
    procedure tsNumShow(Sender: TObject);
    procedure bDeclNumClick(Sender: TObject);
    procedure pgcTopChange(Sender: TObject);
    procedure btnRandClick(Sender: TObject);
    procedure bRandomNumberClick(Sender: TObject);
    procedure btnFormingFIOClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure tsDictShow(Sender: TObject);
    procedure btnViewHdbkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    //BindScope1: TBindScope;
    NonStop: Boolean;
    FThreadRefCount: Integer;
    procedure HandleTerminateOne(Sender: TObject);
    procedure HandleTerminateTwo(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMainDecl: TfrmMainDecl;

implementation

{$R *.DFM}

uses System.Win.ComObj, System.Variants, System.StrUtils, ShellApi, DeclThread (*, Syllable,
    LogIni*);

var
  eFIOp: array [1 .. 6] of TEdit;

//Decl: Variant;
  //function Declen_FIO(pFIO: PChar; nPadeg: LongInt): String; cdecl; external 'PadegIB';
function PadegStr(nPadeg: Word; question: Boolean = True): String;
begin
{$INCLUDE AddSyllable.inc}
end;

procedure TfrmMainDecl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    eFIO.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'FIOList.txt');
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

  if TPadegDLL.LibPadeg <> 0 then begin
    DeInitialization;
    FreeLibrary(TPadegDLL.LibPadeg);
    TPadegDLL.LibPadeg := 0;
  end;
end;

procedure TfrmMainDecl.FormCreate(Sender: TObject);
var
  i: Integer;
begin
{$IFDEF DEBUG}
  //ReportMemoryLeaksOnShutdown:=DebugHook <> 0; // отслеживание утечек памяти
  //ReportMemoryLeaksOnShutdown:=true;
{$ELSE}
  pgcTop.ActivePageIndex := 0;
{$ENDIF}
  //
//eFIO.ItemIndex := 0;
  cbSelectFunc.ItemIndex := 0;
  cbPadeg.ItemIndex := 0;
  eFIOp[1] := TEdit(eFIO);
  eFIOp[2] := Edit2;
  eFIOp[3] := Edit3;
  eFIOp[4] := Edit4;
  eFIOp[5] := Edit5;
  eFIOp[6] := Edit6;
  pgcResult.ActivePage := tsResult;
  cbPadegNum.Clear;
  for i := 1 to 6 do
    cbPadegNum.Items.Add(PadegStr(i, True));
  cbPadegNum.ItemIndex := 1;
  //UpdateExceptions;
  mResult.Lines.Clear;
  { загрузка списка фамилий }
  if FileExists(ExtractFilePath(Application.ExeName) + 'FIOList.txt') then
    eFIO.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'FIOList.txt');
  eFIO.ItemIndex := 0;
  eFIOSelect(Sender);
  //используемые валюты
  StatusBar1.SimpleText := GetDictionary;
  lblNdbk.Caption := 'Справочник валют: ' + GetCurrencyFile;
  cbCurr.Items.Text := CatalogISO;
  (* for i := 0 to cbCurr.Items.Count-1 do
    cbCurr.Items[i]:=cbCurr.Items[i]+' - '+NameCurrency(cbCurr.Items[i]); *)
{$IFDEF DEBUG}
  cbCurr.ItemIndex := 2;
{$ELSE}
  cbCurr.ItemIndex := 0;
{$ENDIF}
end;

procedure TfrmMainDecl.HandleTerminateOne(Sender: TObject);
begin
  Dec(FThreadRefCount);
  mResult.Lines.Add('===== Подтверждение завершения 1-ого потока : ' + DateTimeToStr(now()));
end;

procedure TfrmMainDecl.HandleTerminateTwo(Sender: TObject);
begin
  Dec(FThreadRefCount);
  mResult.Lines.Add('===== Подтверждение завершения 2-ого потока : ' + DateTimeToStr(now()));
end;

procedure TfrmMainDecl.mResultChange(Sender: TObject);
begin
  if mResult.Text = '' then
    mResult.ScrollBars := ssNone//если пусто, нет прокрутки
  else
    if mResult.Lines.Count > 10 then
      mResult.ScrollBars := ssVertical//если >5 строк, вертикальная прокрутка
end;

procedure TfrmMainDecl.pgcTopChange(Sender: TObject);
begin
  case pgcTop.ActivePageIndex of
    0, 1:
      pgcResult.ActivePageIndex := 0;
    2:
      pgcResult.ActivePageIndex := 1; (* 3:
      lblNdbk.Caption:='Справочник валют: ' + GetCurrencyFile; *)
  end;
end;

procedure TfrmMainDecl.SpeedButton1Click(Sender: TObject);
begin
  mResult.Lines.Add('Валюта: "' + NameCurrency(cbCurr.Text) + '"');
end;

procedure TfrmMainDecl.tsDictShow(Sender: TObject);
var
  dict: string;
begin
  dict := GetDictionary;
  if not dict.IsEmpty then
    lblDict.Caption := 'Словарь: ' + dict;
  (* dict:='';
    if not dict.IsEmpty then
    lblDict.Caption:='Словарь: ' + dict; *)
end;

procedure TfrmMainDecl.tsNumShow(Sender: TObject);
begin
{$IFDEF DEBUG}
  eNumber.Text := '3.5'; //'651,46'; //'481.01';
{$ELSE}
  bRandomNumberClick(Sender);
{$ENDIF}
end;

procedure TfrmMainDecl.btnNewDictClick(Sender: TObject);
var
  dict: string;
begin
  dict := GetDictionary;
  if dict <> '' then
    //вывод имени текущего словаря и запрос подтверждения смены
    if Dialogs.MessageDlg('Текущий словарь "' + dict + '"' + sLineBreak + 'Загрузить новый словарь?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo
    then
      Exit;
  //запрос имени нового словаря
  dlgOpenFileDict.FileName := dict;
  if dlgOpenFileDict.Execute then
    SetDictionary(dlgOpenFileDict.FileName);
  //переопределение файла словаря
  StatusBar1.SimpleText := GetDictionary;
end;

procedure TfrmMainDecl.btnViewHdbkClick(Sender: TObject);
(* var
  dict: string; *)
begin
  //dict:=GetCurrencyFileName;
  lblNdbk.Caption := 'Справочник валют: ' + GetCurrencyFile;
end;

procedure TfrmMainDecl.btnDeclClick(Sender: TObject);
var
  i: Integer;
  str: String;
begin
  //mResult.Lines.Add('=== ' + (Sender as TButton).Caption);
  for i := 2 to 6 do begin
    case cbSelectFunc.ItemIndex of
      0:
        str := GetFIOPadeg(eF.Text, eI.Text, eO.Text, rgSex.ItemIndex = 0, i);
      1:
        str := GetFIOPadegAS(eF.Text, eI.Text, eO.Text, i);
      2:
        str := GetFIOPadegFS(eFIO.Text, rgSex.ItemIndex = 0, i);
      3:
        str := GetFIOPadegFSAS(eFIO.Text, i);
      4:
        str := GetIFPadeg(eF.Text, eI.Text, rgSex.ItemIndex = 0, i);
      5:
        str := GetIFPadegFS(eI.Text + ' ' + eF.Text, rgSex.ItemIndex = 0, i);
    else
      eFIOp[i].Text := 'Не реализовано';
    end;
    if str <> '' then
      mResult.Lines.Add(PadegStr(i, True) + ':'#$0009 + str);
    eFIOp[i].Text := str;
  end;
  //mResult.Lines.Add('=====');
end;

procedure TfrmMainDecl.btnClearResultClick(Sender: TObject);
var
  i: Integer;
begin
  mResult.Clear;
  for i := 2 to 6 do
    eFIOp[i].Text := '';
  MessageBeep(100);
end;

procedure TfrmMainDecl.btnSeparateFIOClick(Sender: TObject);
var
  f, i, o: String;
  res: TFIOParts;
begin
  res := GetFIOParts(eFIO.Text);
  eF.Text := res.LastName;
  i := res.FirstName;
  eI.Text := res.FirstName;
  o := res.MiddleName;
  eO.Text := res.MiddleName;
  f := trim(i) + trim(o);
end;

procedure TfrmMainDecl.btnClearPartsClick(Sender: TObject);
begin
  eF.Text := '';
  eI.Text := '';
  eO.Text := '';
end;

procedure TfrmMainDecl.eAppointmentChange(Sender: TObject);
begin
  //eOffice.ItemIndex:=eAppointment.ItemIndex;
end;

procedure TfrmMainDecl.eFIOExit(Sender: TObject);
begin
  if eFIO.Text <> '' then
    btnSeparateFIOClick(Sender);
end;

procedure TfrmMainDecl.eFIOSelect(Sender: TObject);
begin
  //StatusBar1.SimpleText:=eFIO.Text;
  if eFIO.Text <> '' then begin
    btnSeparateFIOClick(Sender);
    btnGetSexClick(Sender);
  end;
end;

procedure TfrmMainDecl.btnGetSexClick(Sender: TObject);
begin
  case GetSex(eFIO.Text) of
    0:
      rgSex.ItemIndex := 1;
    1:
      rgSex.ItemIndex := 0;
  else
    rgSex.ItemIndex := 2;
  end;
end;

procedure TfrmMainDecl.bDeclNumClick(Sender: TObject);
var
  i: Integer;
  str: string;
begin
  pgcResult.ActivePage := tsLog;
  mResult.Lines.Add('======================');
  for i := 1 to 6 do
    mResult.Lines.Add(PadegStr(i, True) + ':'#$0009 + DeclCurrency(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)),
      Copy(cbCurr.Text, 1, 3), i, seForms.Value));
  mResult.Lines.Add('----------------------');
  case rgSource.ItemIndex of
    0: str := DoubleToVerbal(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)));
    1: str := NumberToString(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)), cbSex.ItemIndex - 1, seDecimal.Value,
        cbDelZero.Checked, cbFract.Checked);
  end;
  for i := 1 to 6 do
    mResult.Lines.Add(PadegStr(i, True) + ': ' + DeclNumeral(str, i, cbSex.ItemIndex - 1, cbTypeNumeral.ItemIndex = 1, cbAnimate.Checked));
  mResult.Lines.Add('======================');
end;

procedure TfrmMainDecl.bRandomNumberClick(Sender: TObject);
var
  d: Extended;
begin
  Randomize;
  d := Random;
  eNumber.Text := '';
  if d < 0.5 then begin
    d := Int(d * 1000000000000000);
    eNumber.Text := FloatToStr(d);
    d := Int(Random * 100000000000000);
    eNumber.Text := eNumber.Text + FormatSettings.DecimalSeparator + FloatToStr(d);
  end
  else begin
    Randomize;
    d := Random;
    eNumber.Text := FloatToStr(d);
  end;
  //eNumber.Text := '0,6';
end;

procedure TfrmMainDecl.btn1Click(Sender: TObject);
begin
  mResult.Lines.Add(PadegStr(2, True) + ':'#$0009 + GetOfficePadeg(eOffice.Text, 2));
  mResult.Lines.Add(PadegStr(3, True) + ':'#$0009 + GetOfficePadeg(eOffice.Text, 3));
  mResult.Lines.Add(PadegStr(4, True) + ':'#$0009 + GetOfficePadeg(eOffice.Text, 4));
  mResult.Lines.Add(PadegStr(5, True) + ':'#$0009 + GetOfficePadeg(eOffice.Text, 5));
end;

procedure TfrmMainDecl.btnAppClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 2 to 6 do begin
    eFIOp[i].Text := GetAppointmentPadeg(eAppointment.Text, i);
    if eFIOp[i].Text <> '' then
      mResult.Lines.Add(PadegStr(i, True) + ':'#$0009 + eFIOp[i].Text);
  end;
end;

procedure TfrmMainDecl.btnOffClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 2 to 6 do begin
    eFIOp[i].Text := GetOfficePadeg(eOffice.Text, i);
    if eFIOp[i].Text <> '' then
      mResult.Lines.Add(PadegStr(i, True) + ':'#$0009 + eFIOp[i].Text);
  end;
end;

procedure TfrmMainDecl.btnAppOffClick(Sender: TObject);
var
  i: Integer;
  str: String;
begin
  mResult.Lines.Add('=== ' + (Sender as TButton).Caption);
  for i := 2 to 6 do begin
    str := GetFullAppointmentPadeg(eAppointment.Text, eOffice.Text, i);
    eFIOp[i].Text := str;
    if str <> '' then
      mResult.Lines.Add(PadegStr(i, True) + ':'#$0009 + str);
    eFIOp[i].Text := str;
  end;
  mResult.Lines.Add('=====');
end;

procedure TfrmMainDecl.btnStartClick(Sender: TObject);
var
  res: String;
  i, p: Integer;
begin
  //выполнение в цикле
  pgcResult.ActivePageIndex := 1;
  NonStop := not NonStop;
  if NonStop then begin
    btnStart.Caption := 'Стоп';
    mResult.Lines.Add('===== Старт основного потока ' + DateTimeToStr(now()) + ' =====');
    while NonStop do begin //склонять по кругу
      for i := 0 to eFIO.Items.Count - 1 do begin //весь список ФИО
        for p := 2 to 6 do begin //на всех падежах
          res := GetFIOPadegFSAS(eFIO.Items[i], p);
          mResult.Lines.Add(IntToStr(p) + ':'#$0009 + res);
        end;
        Application.ProcessMessages;
      end;
    end;
    mResult.Lines.Add('===== Стоп основного потока ' + DateTimeToStr(now()) + ' =====');
  end
  else
    btnStart.Caption := 'Старт';
end;

procedure TfrmMainDecl.btnTestClick(Sender: TObject);
var
  str: String;
begin
  pgcResult.ActivePage := tsLog;
  mResult.Clear;
  mResult.Lines.Add(eNumber.Text);
  mResult.Lines.Add('NumberToString = ' + NumberToString(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)),
    cbSex.ItemIndex - 1, seDecimal.Value, cbDelZero.Checked, cbFract.Checked));
  mResult.Lines.Add('SumInWords = ' + SumInWords(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator), cbSex.ItemIndex - 1, seDecimal.Value,
    cbDelZero.Checked, cbFract.Checked));
  mResult.Lines.Add('DoubleToVerbal  = ' + DoubleToVerbal(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator))));
  mResult.Lines.Add('DeclCurrency   = ' + DeclCurrency(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)),
    Copy(cbCurr.Text, 1, 3), cbPadegNum.ItemIndex + 1, seForms.Value));
  case rgSource.ItemIndex of
    0:
      str := DoubleToVerbal(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)));
    1:
      str := NumberToString(StrToFloat(ReplaceStr(eNumber.Text, '.', FormatSettings.DecimalSeparator)), cbSex.ItemIndex - 1, seDecimal.Value,
        cbDelZero.Checked, cbFract.Checked);
  end;
  mResult.Lines.Add(rgSource.Items[rgSource.ItemIndex] + ' DeclNumeral = ' + DeclNumeral(str, cbPadegNum.ItemIndex + 1, cbSex.ItemIndex - 1,
    cbTypeNumeral.ItemIndex = 1, cbAnimate.Checked));
end;

procedure TfrmMainDecl.btnThreadClick(Sender: TObject);
var
  NewThread: TDeclThread;
  TwoThread: TDeclThread;
begin
  pgcResult.ActivePageIndex := 1;
  //первый поток
  NewThread := TDeclThread.Create(True, 1);
  NewThread.FreeOnTerminate := True;
  try
    NewThread.FIOList := eFIO.Items;
    Inc(FThreadRefCount);
    NewThread.OnTerminate := HandleTerminateOne;
    mResult.Lines.Add('Старт 1-ого потока');
    NewThread.Start;
  except
    on E: Exception do begin
      NewThread.Free;
      ShowMessage(E.Message);
    end;
  end;
  //второй поток
  TwoThread := TDeclThread.Create(True, 2);
  TwoThread.FreeOnTerminate := True;
  try
    TwoThread.FIOList := eFIO.Items;
    Inc(FThreadRefCount);
    TwoThread.OnTerminate := HandleTerminateTwo;
    mResult.Lines.Add('Старт 2-ого потока');
    TwoThread.Start;
  except
    on E: Exception do begin
      TwoThread.Free;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmMainDecl.btnFormingFIOClick(Sender: TObject);
var
  str: String;
begin
  btnSeparateFIOClick(Sender);
  pgcResult.ActivePageIndex := 1;
  //str := FormingFIO(eI.Text+' '+(*eO.Text+' '+*)eF.Text);
  str := FormingFIO(eFIO.Text);
  mResult.Lines.Add(str);
end;

procedure TfrmMainDecl.btnOpenDictClick(Sender: TObject);
var
  sei: TShellExecuteInfo;
  aFile: string;
begin
  aFile := GetDictionary;
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.Wnd := Self.Handle;
  sei.fMask := SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  sei.lpVerb := 'open'; //при open тоже самое
  sei.lpFile := PChar(aFile);
  sei.lpParameters := PChar('');
  sei.nShow := SW_SHOWNORMAL;
  if not ShellExecuteEx(@sei) then
    RaiseLastOSError;
  if sei.hProcess <> 0 then begin
    while WaitForSingleObject(sei.hProcess, 50) = WAIT_TIMEOUT do
      Application.ProcessMessages;
    CloseHandle(sei.hProcess);
    UpdateExceptions;
    //StatusBar1.SimpleText:=GetDictionary;
  end;
  //ShellExecuteEx(Handle, 'open', pWideChar(GetExceptionsFileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMainDecl.btnRandClick(Sender: TObject);
begin
  tsNumShow(Sender);
end;

procedure TfrmMainDecl.btnLoadChangesClick(Sender: TObject);
begin
  UpdateExceptions;
  StatusBar1.SimpleText := GetDictionary;
end;

procedure TfrmMainDecl.btnNominClick(Sender: TObject);
var
  s: string;
begin
  s := GetNominativePadeg(eFIOp[cbPadeg.ItemIndex + 2].Text);
  if s <> '' then
    MessageDlg(s, mtInformation, [mbOK], 0);
end;

procedure TfrmMainDecl.cbSelectFuncChange(Sender: TObject);
begin
  case cbSelectFunc.ItemIndex of
    0:
      Memo1.Text := 'Склонение фамилии, имени и отчества с явным указанием рода.';
    1:
      Memo1.Text := 'Склонениe фамилии, имени и отчества с автоматическим определением рода.';
    2:
      Memo1.Text := 'Cклонениe фамилии, имени и отчества записанных одной строкой с явным указанием рода.';
    3:
      Memo1.Text := 'Cклонениe фамилии, имени и отчества записанных одной строкой с автоматическим определением рода.';
    4:
      Memo1.Text := 'Cклонение пары: имя, фамилия с явным указанием рода.';
    5:
      Memo1.Text := 'Склонение имени и фамилии, записанных одной строкой с явным указанием рода';
  else
    Memo1.Text := '';
  end;
end;

end.
