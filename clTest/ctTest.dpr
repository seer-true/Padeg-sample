program ctTest;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  {$ENDIF }
  System.SysUtils,
  {$IFDEF LINUX}
  Posix.Base,
  {$ENDIF }
  System.Classes,
  System.StrUtils,
  ctConst in 'ctConst.pas',
  PadegLibrary in 'PadegLibrary.pas';

procedure WriteCommands;
begin
  Writeln(sCommands);
  Write(cArrow);
end;

function PadegStr(nPadeg: Word; question: Boolean = True): String;
begin
{$INCLUDE AddSyllable.inc}
end;

procedure AllDecl(const flags, Decl: String; AddParam: String = '');
var
  i: Integer;
begin
  Writeln(Format('Преобразуем: %s %s %s', [flags, Decl, AddParam]));
  case IndexStr(UpperCase(flags), ['APP', 'OFF', 'FULL', 'FIO', 'CURR']) of
    0: //должность
      begin
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + GetAppointment(Decl, i));
      end;
    1: //подразделение
      begin
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + GetOffice(Decl, i));
      end;
    2: begin //должность + подразделение
//full "Заведующий лабораторией" "Лаборатория спектрального анализа"
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + GetFullAppointment(Decl, AddParam, i));
      end;
    3: //ФИО
 //fio "Пушкин Адександр Сергеевич" м
      if Trim(AddParam) <> '' then begin
        var
          bSex: Boolean;
        bSex := AddParam.ToLower = 'м';
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + GetFIOPadegFS(Decl, bSex, i));
      end
      else
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + GetFIOPadegFSAS(Decl, i));
    4: begin //валюта
//CURR 456.6 RUB
        for i := 1 to 6 do
          Writeln(PadegStr(i) + ' ' + DeclCurrency(StrToCurr(ReplaceStr(Decl, '.', FormatSettings.DecimalSeparator)), AddParam, i, 2))//склонение
      end;
  else
    Writeln('Неизвестная команда "' + flags + '"');
  end;
end;

procedure RunTest;
var
  LResponse: String;
  Cmd: Integer;
  str: string;
begin
//  Log.Info('Старт.', 'RunTest');
  Writeln('Файл исключений "' + GetDictionary + '"');
  WriteCommands();
  while True do begin
    ReadLn(LResponse);
    try
      Cmd := LResponse.ToInteger;
    except
      Cmd := 5;
    end;
    case Cmd of
//['APP', 'OFF', 'FULL', 'FIO', 'CURR'])
      0: Break;
      1: begin
          Write('Введите должность: '); ReadLn(str);
          AllDecl('APP', str); //
        end;
      2: begin
          Write('Введите подразделение: '); ReadLn(str);
          AllDecl('OFF', str); //
        end;
      3: begin
          var
            off, app: string;
          Write('Введите должность: '); ReadLn(app);
          Write('Введите подразделение: '); ReadLn(off);
          AllDecl('FULL', app, off); //
        end;
      4: begin
          Write('Введите ФИО: '); ReadLn(str);
          AllDecl('FIO', str)
        end;
      5: begin
          Write('Введите цифру: '); ReadLn(str);
//Write('Введите обозначение валюты: '); ReadLn(ncurr);
          AllDecl('CURR', str, 'RUB'); //
        end;
    else
      Writeln('Неизвестная команда');
    end;
    Write(cArrow);
  end;
  Writeln('Завершение работы.');
end;

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True; //отслеживание утечек памяти
{$ENDIF}
  if FileExists(TPadegLiblary.LibName) then
///home/seer/PAServer/scratch-dir/Seer-Ubuntu 18/
    Writeln('Файл ' + TPadegLiblary.LibName + ' найден');
  Writeln(TPadegLiblary.LibName + ' = ', TPadegLiblary.LoadPadeg);
  try
    if ParamCount >= 2 then begin
      AllDecl(ParamStr(1), ParamStr(2), ParamStr(3));
//      ReadLn;
    end
    else
      RunTest;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  if TPadegLiblary.LibPadeg > 0 then begin
    DeInitialization;
    FreeLibrary(TPadegLiblary.LibPadeg);
    TPadegLiblary.LibPadeg := 0;
  end;

end.
