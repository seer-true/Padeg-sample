unit uMain;

interface

uses
  System.StrUtils, System.SysUtils;

function MainDecl: Integer;

implementation

uses
  FIODict, FIODecl, DeclExt, Syllable;

function MainDecl: Integer;
var
  i: Integer;
  flags, decl, AddParm: String;
begin
  Result := 0;
  try
    if not Assigned(ExceptionDic) then
      ExceptionDic := TExceptionDict.Create(TExceptionDict.FindExceptionDic);
    Writeln('���� ���������� "' + ExceptionDic.FileName + '"');
    if ParamCount >= 2 then begin
      flags := ParamStr(1);
    end
    else Writeln('������. ������� �� ��� ���������, ����. //app "�������-�����������"//.');
    for i := 1 to ParamCount do begin
      Write(ParamStr(i));
      Write(', ');
    end;
    Writeln('');

    case IndexStr(UpperCase(flags), ['APP', 'OFF', 'FULL', 'FIO']) of
      0: // ���������
        begin
          decl := ParamStr(2);
          for i := 1 to 6 do
            Writeln(TSyllable.PadegStr(i) + ' ' + GetAppointment(decl, i));
//          Writeln(TSyllable.PadegStr(5) + ' ' + GetAppointment(decl, 2));
        end;
      1: // �������������
        begin
          decl := ParamStr(2);
          for i := 1 to 6 do Writeln(TSyllable.PadegStr(i) + ' ' + GetOffice(decl, i));
        end;
      2: // ��������� + �������������
        if ParamCount >= 3 then begin
          decl := ParamStr(2);
          AddParm := ParamStr(3);
            for i := 1 to 6 do Writeln(TSyllable.PadegStr(i) + ' ' + GetFullAppointment(decl, AddParm, i));
        end
        else
          Writeln('������. ������� �� ��� ���������, //full "���������� ������������" "����������� ������������� �������"//.');
      3: // ���
        if ParamCount >= 3 then begin // fio "������ ��������� ���������" �
          decl := ParamStr(2);
          AddParm := ParamStr(3);
          for i := 1 to 6 do Writeln(TSyllable.PadegStr(i) + ' ' + GetFIOFromStr(decl, AddParm, i));
        end
        else
          Writeln('������. �� ������ ��������� //fio "������ ��������� ���������" �//.');
    end;
    ReadLn;
  finally
    ExceptionDic.Free;
  end;
end;

end.
