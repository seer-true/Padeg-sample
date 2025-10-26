unit frmMainTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TfrmTest = class(TForm)
    eFIO: TComboBox;
    Button1: TButton;
    eDeclension: TEdit;
    cbPadeg: TComboBox;
    Button2: TButton;
    Label11: TLabel;
    rgSex: TComboBox;
    Memo1: TMemo;
    btnNomin: TButton;
    Button3: TButton;
    btnOffice: TButton;
    btnGetFull: TButton;
    btnDict: TButton;
    StatusBar1: TStatusBar;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    eAppointment: TComboBox;
    eOffice: TComboBox;
    btnStart: TButton;
    btnStop: TButton;
    Button5: TButton;
    eValue: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    l1: TLabel;
    seDecimal: TSpinEdit;
    cbSex: TComboBox;
    cbFract: TCheckBox;
    cbDelZero: TCheckBox;
    GroupBox2: TGroupBox;
    lblPadeg: TLabel;
    cbAnimate: TCheckBox;
    cbTypeNumeral: TComboBox;
    sePadeg: TSpinEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    lForms: TLabel;
    cbCurr: TComboBox;
    seForms: TSpinEdit;
    rgSource: TRadioGroup;
    bNumDecl: TButton;
    btnFormingFIO: TButton;
    lblCurrFileName: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure eFIOChange(Sender: TObject);
    procedure btnNominClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnOfficeClick(Sender: TObject);
    procedure btnGetFullClick(Sender: TObject);
    procedure btnDictClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure eAppointmentChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure bNumDeclClick(Sender: TObject);
    procedure btnFormingFIOClick(Sender: TObject);
  private
    { Private declarations }
    cLastName: string;
    cFirstName: string;
    cMiddleName: string;
    Sex: string;
    NonStop: Boolean;
  public
    { Public declarations }
    Decl: Variant;
  end;

const
  Padegs: Array [1 .. 6] of string = ('Именительный (кто/что)', 'Родительный (кого/чего нет)',
    'Дательный (кому/чему дать)', 'Винительный (кого/что вижу)', 'Творительный (кем/чем горжусь)',
    'Предложный (о ком/о чем мечтаю)');

var
  frmTest: TfrmTest;

implementation

uses
  // Vcl.OleAuto;
  ActiveX, ComObj, System.StrUtils;

{$R *.dfm}

procedure TfrmTest.bNumDeclClick(Sender: TObject);
var
  i: Integer;
  str: string;
begin
  // pgcResult.ActivePage:=tsLog;
  Memo1.Lines.Add('======================');
  for i:=1 to 6 do
    Memo1.Lines.Add(Padegs[i] + ': ' + Decl.DeclCurrency(StrToFloat(ReplaceStr(eValue.Text, '.',
      FormatSettings.DecimalSeparator)), Copy(cbCurr.Text, 1, 3), i, seForms.Value));

  Memo1.Lines.Add('----------------------');

  case rgSource.ItemIndex of
    0: str:=Decl.DoubleToVerbal(ReplaceStr(eValue.Text, '.', FormatSettings.DecimalSeparator));
    1: str:=Decl.NumberToString(ReplaceStr(eValue.Text, '.', FormatSettings.DecimalSeparator), cbSex.ItemIndex - 1,
        seDecimal.Value, cbDelZero.Checked, cbFract.Checked);
  end;

  for i:=1 to 6 do
    Memo1.Lines.Add(rgSource.Items[rgSource.ItemIndex] + ' = ' + Decl.DeclNumeral(str, i, cbSex.ItemIndex,
      cbTypeNumeral.ItemIndex = 1, cbAnimate.Checked));
  Memo1.Lines.Add('======================');
end;

procedure TfrmTest.btnDictClick(Sender: TObject);
begin
  if Decl.Update_Exceptions then
    StatusBar1.SimpleText:=Decl.GetExceptionsFileName
  else
    StatusBar1.SimpleText:='Ошибка обновления';
end;

procedure TfrmTest.btnFormingFIOClick(Sender: TObject);
begin
  Decl.SeparateFIO(eFIO.Text, cLastName, cFirstName, cMiddleName);
  Memo1.Lines.Add(Decl.FormingFIO(cFirstName+' '+cMiddleName+' '+cLastName));
end;

procedure TfrmTest.btnGetFullClick(Sender: TObject);
var
  i: Integer;
begin
  Memo1.Lines.Add('===Результаты склонения ' + eAppointment.Text + ', ' + eOffice.Text);
  for i:=1 to 6 do
    Memo1.Lines.Add(Padegs[i] + ': ' + Decl.GetFullAppointmentPadeg(eAppointment.Text, eOffice.Text, i));
  Memo1.Lines.Add('===');
end;

procedure TfrmTest.btnNominClick(Sender: TObject);
begin
  eDeclension.Text:=Decl.GetFIOPadegFS(eFIO.Text, Sex, cbPadeg.ItemIndex + 2);
  Memo1.Lines.Add('Востановлено: ' + Decl.GetNominativePadeg(eDeclension.Text));
end;

procedure TfrmTest.btnOfficeClick(Sender: TObject);
begin
  Memo1.Lines.Add(Decl.GetOfficePadeg(eOffice.Text, cbPadeg.ItemIndex + 2));
end;

procedure TfrmTest.Button1Click(Sender: TObject);
var
  // str: string;
  i: Integer;
begin
  Decl.SeparateFIO(eFIO.Text, cLastName, cFirstName, cMiddleName);
  (* Sex := rgSex.Text[1];
    try
    str := Decl.GetFIOPadeg(cLastName, cFirstName, cMiddleName, Sex,
    cbPadeg.ItemIndex + 2);
    except
    str := 'ошибка определения рода';
    end;
    eDeclension.Text := str;
  *)
  // результат в мемо
  if rgSex.ItemIndex = 2 then
    case Decl.GetSex(eFIO.Text) of
      0:
        begin
          Sex:='Ж';
          rgSex.ItemIndex:=1;
        end;
    else
      begin
        Sex:='М';
        rgSex.ItemIndex:=0;
      end;
    end;

  Memo1.Lines.Add('===Результаты склонения ' + eFIO.Text);
  for i:=2 to 6 do
    Memo1.Lines.Add(cbPadeg.Items[i - 2] + ': ' + Decl.GetFIOPadeg(cLastName, cFirstName, cMiddleName, Sex, i));
  Memo1.Lines.Add('===');
end;

procedure TfrmTest.Button2Click(Sender: TObject);
begin
  Sex:=rgSex.Text[1];
  eDeclension.Text:=Decl.GetIFPadeg(cFirstName, cLastName, Sex, cbPadeg.ItemIndex + 2);
end;

procedure TfrmTest.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Add(Decl.GetAppointmentPadeg(eAppointment.Text, cbPadeg.ItemIndex + 2));
end;

procedure TfrmTest.Button4Click(Sender: TObject);
var
  dict: string;
begin
  dict:=Decl.GetExceptionsFileName;
  if dict <> '' then
    // вывод имени текущего словаря и запрос подтверждения смены
    if Vcl.Dialogs.MessageDlg('Текущий словарь "' + dict + '"' + sLineBreak+'Загрузить новый словарь?', mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrNo then
      Exit;
  // запрос имени нового словаря
  SaveDialog1.FileName:=dict;
  if SaveDialog1.Execute then
    Decl.SetDictionary(SaveDialog1.FileName);
  // переопределение файла словаря
  StatusBar1.SimpleText:=Decl.GetExceptionsFileName;
end;

procedure TfrmTest.Button5Click(Sender: TObject);
var
  str: String;
begin
  Memo1.Lines.Add('NumberToString= ' + Decl.NumberToString(ReplaceStr(eValue.Text, '.',
    FormatSettings.DecimalSeparator), cbSex.ItemIndex - 1, seDecimal.Value, cbDelZero.Checked, cbFract.Checked));

  Memo1.Lines.Add('SumInWords    = ' + Decl.SumInWords(ReplaceStr(eValue.Text, '.', FormatSettings.DecimalSeparator),
    cbSex.ItemIndex - 1, seDecimal.Value, cbDelZero.Checked, cbFract.Checked));

  Memo1.Lines.Add('DoubleToVerbal= ' + Decl.DoubleToVerbal(ReplaceStr(eValue.Text, '.',
    FormatSettings.DecimalSeparator)));
  // mResult.Lines.Add('');

  Memo1.Lines.Add('DeclCurrency   = ' + Decl.DeclCurrency(StrToFloat(ReplaceStr(eValue.Text, '.',
    FormatSettings.DecimalSeparator)), Copy(cbCurr.Text, 1, 3), sePadeg.Value, seForms.Value));

  case rgSource.ItemIndex of
    0: str:=Decl.DoubleToVerbal(ReplaceStr(eValue.Text, '.', FormatSettings.DecimalSeparator));
    1: str:=Decl.NumberToString(ReplaceStr(eValue.Text, '.', FormatSettings.DecimalSeparator), cbSex.ItemIndex - 1,
        seDecimal.Value, cbDelZero.Checked, cbFract.Checked);
  end;

  Memo1.Lines.Add(rgSource.Items[rgSource.ItemIndex] + ' DN = ' + Decl.DeclNumeral(str, sePadeg.Value, cbSex.ItemIndex,
    cbTypeNumeral.ItemIndex = 1, cbAnimate.Checked));
end;

procedure TfrmTest.btnStartClick(Sender: TObject);
begin
  eFIOChange(Sender);
  Memo1.Lines.Add('=== поток склонения запущен ===' + eFIO.Text);

  while not NonStop do begin
    Memo1.Lines.Add(cbPadeg.Items[cbPadeg.ItemIndex] + ': ' + Decl.GetFIOPadegFS(eFIO.Text, Sex,
      cbPadeg.ItemIndex + 2));
    Application.ProcessMessages;
  end;

  Memo1.Lines.Add('= поток склонения завершен!! =');
end;

procedure TfrmTest.btnStopClick(Sender: TObject);
begin
  NonStop:=True;
end;

procedure TfrmTest.eAppointmentChange(Sender: TObject);
begin
  eOffice.ItemIndex:=eAppointment.ItemIndex;
end;

procedure TfrmTest.eFIOChange(Sender: TObject);
begin
  case Decl.GetSex(eFIO.Text) of
    0:
      begin
        Sex:='Ж';
        rgSex.ItemIndex:=1;
      end;
    1:
      begin
        Sex:='М';
        rgSex.ItemIndex:=0;
      end;
  else
    begin
      Sex:='?';
      rgSex.ItemIndex:=2;
    end;
  end;
end;

procedure TfrmTest.FormCreate(Sender: TObject);
var
  i: Integer;
  b: Boolean;
begin
// ReportMemoryLeaksOnShutdown:=DebugHook <> 0; // отслеживание утечек памяти
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:=true;
{$ENDIF}
  cbPadeg.Items.Clear;
  for i:=2 to 6 do
    cbPadeg.Items.Add(Padegs[i]);
  cbPadeg.ItemIndex:=0;

  Decl:=CreateOleObject('PadegUCA.Declension');
  b:=Decl.Update_Exceptions;
  if b(* Decl.Update_Exceptions *) then
    StatusBar1.SimpleText:=Decl.GetExceptionsFileName
  else
    StatusBar1.SimpleText:='Ошибка обновления';

  lblCurrFileName.Caption:='Словарь "'+Decl.GetCurrencyFile+'"';

  cbCurr.Items.Text:=Decl.CatalogISO;
  for i := 0 to cbCurr.Items.Count-1 do
    cbCurr.Items[i]:=cbCurr.Items[i]+' - '+Decl.NameCurrency(cbCurr.Items[i]);
  cbCurr.ItemIndex:=0;

end;

procedure TfrmTest.FormDestroy(Sender: TObject);
begin
  Decl:=UnAssigned;
end;

end.
