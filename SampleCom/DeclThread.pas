unit DeclThread;

interface

uses
  System.Classes;

type
  TDeclThread = class(TThread)
  private
    { Private declarations }
    FFIOList: TStrings; // ������ �������
    FRes: TStringList;  // ���������� ���������
    FNum: Integer;  // ����� ������
  protected
    procedure Decl(AFIO: String);  // ����� ���������
    procedure UpDateRes; // ����� �����������
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
  FRes.Add('===== �����('+IntToStr(FNum)+'): "' + AFIO + '"' + DateTimeToStr(now()) + IntToStr(FNum)+' =====');
  for j:=1 to 6 do begin // ���� �������
    bSex:=GetSex(AFIO) = 1;
    FRes.Add('  -(' + IntToStr(j) + ') ' + GetFIOPadegFS(AFIO, bSex, j));
  end;
  FRes.Add('===== �����('+IntToStr(FNum)+'): "' + AFIO + '"' + DateTimeToStr(now()) + IntToStr(FNum)+' =====');
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
  for i:=0 to FFIOList.Count - 1 do begin // ���� �������
    FRes.Clear; // ��� ������ ����������� ��������� ����� ������ ���, ������ � ������ ���
    if i = 0 then
      FRes.Add('===== ����� '+IntToStr(FNum)+' �����: ' + DateTimeToStr(now()));
    if (not terminated) then
      Decl(FFIOList[i]);
    if i = FFIOList.Count - 1 then
      FRes.Add('===== ����� '+IntToStr(FNum)+' ��������: ' + DateTimeToStr(now()));
    Synchronize(UpDateRes);
  end;
end;

procedure TDeclThread.UpDateRes;
begin
  frmMainDecl.mResult.Lines.AddStrings(FRes);
end;

end.
