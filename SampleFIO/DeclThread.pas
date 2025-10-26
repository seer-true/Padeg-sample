unit DeclThread;

interface

uses
  System.Classes;

type
  TDeclThread = class(TThread)
  private
    { Private declarations }
    FFIOList: TStrings; // список склония
    FRes: TStringList;  // результаты склонения
    FNum: Integer;  // номер потока
  protected
    procedure Decl(AFIO: String);  // вызов склонения
    procedure UpDateRes; // вывод результатов
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; Num: Integer = 0);
    destructor Destroy; override;
    property FIOList: TStrings read FFIOList write FFIOList;
    // property FIO: String read FFIO write FFIO;
  end;

implementation

uses padegFIO, frmMain, System.SysUtils;

{ TDeclThread }

constructor TDeclThread.Create(CreateSuspended: Boolean; Num: Integer = 0);
begin
  inherited Create(CreateSuspended);
  FRes:=TStringList.Create;
  FNum:=Num;
end;

procedure TDeclThread.Decl(AFIO: String);
var
  j: Integer;
  bSex: Boolean;
begin
  FRes.Add('===== Старт('+IntToStr(FNum)+'): "' + AFIO + '"' + DateTimeToStr(now()) + IntToStr(FNum)+' =====');
  for j:=1 to 6 do begin // цикл падежей
    bSex:=GetSex(AFIO) = 1;
    FRes.Add('  -(' + IntToStr(j) + ') ' + GetFIOPadegFS(AFIO, bSex, j));
  end;
  FRes.Add('===== Финиш('+IntToStr(FNum)+'): "' + AFIO + '"' + DateTimeToStr(now()) + IntToStr(FNum)+' =====');
end;

destructor TDeclThread.Destroy;
begin
  FRes.Free;
  inherited;
end;

procedure TDeclThread.Execute;
var
  i: Integer;
begin
  { Place thread code here }
  for i:=0 to FFIOList.Count - 1 do begin // цикл фамилий
    FRes.Clear; // это список резельтатов склонения одной строки ФИО, потому и очищаю тут
    if i = 0 then
      FRes.Add('===== Поток '+IntToStr(FNum)+' начат: ' + DateTimeToStr(now()));
    if (not terminated) then
      Decl(FFIOList[i]);
    if i = FFIOList.Count - 1 then
      FRes.Add('===== Поток '+IntToStr(FNum)+' завершен: ' + DateTimeToStr(now()));
    Synchronize(UpDateRes);
  end;
end;

procedure TDeclThread.UpDateRes;
begin
  frmMainDecl.mResult.Lines.AddStrings(FRes);
end;

end.
