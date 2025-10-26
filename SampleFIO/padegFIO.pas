/// <summary>                                                        \
/// Интерфейсный модуль описывающий все функции библиотеки для вызывающих программ. Можно напрямую обращаться к
/// данным функциям не описывая их заново в своих программах
/// </summary>
unit padegFIO;

// Если установлено, то в случае ошибки вызывает исключение
// или завершает втихую вызывая Exit.
{$DEFINE RAISEERROR}

{ .$DEFINE CDECL } // если установлено вызываемые ф-ции - cdecl, иначе stdcall
interface

uses System.Classes, SysUtils;

type
  TFIOParts = record
    LastName, FirstName, MiddleName: String;
  end;

  ///
  TPadegDLL = record
  const
    LibName: String = 'PadegUC.dll'; // имя библиотеки
//    LibName: String = 'PadegNET.dll'; // имя библиотеки
    class var LibPadeg: HMODULE;
  public
    class function LoadPadeg(UpdateFileExcept: Boolean = False): Integer; static;
  end;
  ///

  // ф-ции склонения ФИО
function GetIFPadeg(pFirstName, pLastName: String; bSex: Boolean; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetIFPadegFS(pIF: String; bSex: Boolean; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetFIOPadeg(pLastName, pFirstName, pMiddleName: String; bSex: Boolean; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetFIOPadegAS(pLastName, pFirstName, pMiddleName: String; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetFIOPadegFS(pFIO: String; bSex: Boolean; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetFIOPadegFSAS(pFIO: String; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// восстановление ФИО
function GetNominativePadeg(pFIO: String): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// склонение должностей и подразделений
function GetAppointmentPadeg(pAppointment: String; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetFullAppointmentPadeg(pAppointment, pOffice: String; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetOfficePadeg(pOffice: String; nPadeg: LongInt): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// вспомогательные ф-ции
function GetFIOParts(pFIO: String): TFIOParts; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetSex(pMiddleName: String): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// Выстраивание ФИО в порядке Ф.И.О. например из И.О.Ф.
function FormingFIO(pFIO: String): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// файл исключений
function GetExceptionsFileName: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function GetDictionary: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function UpdateExceptions: Boolean; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function SetDictionary(FileName: String): Boolean; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
// числительные
function DoubleToVerbal(Value: Extended): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function NumberToString(Value: Extended; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
function SumInWords(Value: String; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
function DeclNumeral(Value: String; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
function DeclCurrency(Quantity: Currency; CurrName: String; nPadeg: Integer; Forms: Byte = 0): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
function GetCurrencyFile: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function CatalogISO: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
function NameCurrency(ISO: String): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
procedure DeInitialization; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}

implementation

uses
  Windows;

type
  PPartsFIO = ^TPartsFIO;

  TPartsFIO = record
    pLastName, pFirstName, pMiddleName: String;
    nLastName, nFirstName, nMiddleName: LongInt;
  end;

  TGetFIOParts = function(pFIO: PChar; Parts: PPartsFIO): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetIFPadeg = function(pFirstName, pLastName: PChar; bSex: Boolean; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetIFPadegFS = function(pIF: PChar; bSex: Boolean; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetFIOPadeg = function(pLastName, pFirstName, pMiddleName: PChar; bSex: Boolean; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetFIOPadegAS = function(pLastName, pFirstName, pMiddleName: PChar; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetFIOPadegFS = function(pFIO: PChar; bSex: Boolean; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetFIOPadegFSAS = function(pFIO: PChar; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetNominativePadeg = function(pFIO, pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
  TUpdateExceptions = function: Boolean; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TSetDictionary = function(DicName: PChar): Boolean; {$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
  TGetSex = function(pMiddleName: PChar): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetNameFileExceptions = function(pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall;
{$ENDIF}
  TFormingFIO = function(pFIO: PChar; pResult: PChar; var nLen: Integer): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetAppointmentPadeg = function(pAppointment: PChar; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetFullAppointmentPadeg = function(pAppointment, pOffice: PChar; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetOfficePadeg = function(pOffice: PChar; nPadeg: LongInt; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TFloatToVerbal = function(Value: Extended; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
  TSumInWords = function(Value: PChar; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean; pResult: PChar; var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TNumberToString = function(Value: Extended; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean; pResult: PChar;
    var nLen: LongInt): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TDeclCurrency = function(Quantity: Currency; CurrName: PChar; nPadeg: Integer; Forms: Byte; pResult: PChar; var nLen: Integer): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TDeclNumeral = function(Value: PChar; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean; pResult: PChar; var nLen: Integer): Integer;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  TGetCurrencyFile = function(pResult: PChar; var nLen: LongInt): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall;
{$ENDIF}
  TCatalogISO = function(pResult: PChar; var nLen: LongInt): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall;
{$ENDIF}
  TNameCurrency = function(pISO: PChar; pResult: PChar; var nLen: Integer): Integer; {$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}

procedure CreateError(error: Integer);
begin
  (* -1 - недопустимое значение падежа;
    -2 - недопустимое значение рода;
    -3 - размер буфера недостаточен для размещения результата преобразования ФИО. *)
  case error of
    -1: Exception.Create('Недопустимое значение падежа');
    -2: Exception.Create('Недопустимое значение рода');
    -3: Exception.Create('Размер буфера недостаточен для размещения результата преобразования ФИО');
  else
    Exception.Create('Неизвестный код ошибки: ' + IntToStr(error));
  end;
end;

procedure DeInitialization; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pDeInit: procedure(); {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
begin
  if TPadegDLL.LibPadeg > 0 then begin // если = 0 нет смысла деинициализировать
    pDeInit := GetProcAddress(TPadegDLL.LibPadeg, 'DeInitialization');
    if Assigned(pDeInit) then
      pDeInit;
  end;
end;

function GetSex(pMiddleName: String): Integer; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pGetSex: TGetSex;
const
  FunctDLL: PChar = 'GetSex';
begin
  TPadegDLL.LoadPadeg;
  pGetSex := GetProcAddress(TPadegDLL.LibPadeg, FunctDLL);
  if not Assigned(pGetSex) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция "' + FunctDLL + '" в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  Result := pGetSex(PChar(pMiddleName));
end;

function GetExceptionsFileName: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall;
{$ENDIF}
var
  pGetNameFileExceptions: TGetNameFileExceptions;
{$INCLUDE padegLocVar.inc}
const
  FunctDLL: PChar = 'GetDictionary';
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetNameFileExceptions := GetProcAddress(TPadegDLL.LibPadeg, FunctDLL);
  if not Assigned(pGetNameFileExceptions) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция "' + FunctDLL + '" в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := StrAlloc(nLen);
  try
    error := pGetNameFileExceptions(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function GetDictionary: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall;
{$ENDIF}
var
  pGetNameFileExceptions: TGetNameFileExceptions;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetNameFileExceptions := GetProcAddress(TPadegDLL.LibPadeg, 'GetDictionary');
  if not Assigned(pGetNameFileExceptions) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetDictionary'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := StrAlloc(nLen);
  try
    error := pGetNameFileExceptions(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function UpdateExceptions;
var
  pUpdateExceptions: TUpdateExceptions;
begin
  TPadegDLL.LoadPadeg;
  // (pathDic: PChar = nil): Boolean; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
  pUpdateExceptions := GetProcAddress(TPadegDLL.LibPadeg, 'UpdateExceptions');
  if not Assigned(pUpdateExceptions) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''UpdateExceptions'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  Result := pUpdateExceptions;
end;

function GetFIOParts(pFIO: String): TFIOParts; {$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
var
  pGetFIOParts: TGetFIOParts;
  Parts: TPartsFIO;
  error: Integer;
begin
  TPadegDLL.LoadPadeg;
  pGetFIOParts := GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOParts');

  Result.LastName := '';
  Result.FirstName := '';
  Result.MiddleName := '';

  if not Assigned(pGetFIOParts) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOParts'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  // распределение памяти под результат
  // ????? по половине входной строки должно хватить  как показала практика не хватает, напр. Ая Тевис
  // поставил заведомо больше
  SetLength(Parts.pLastName, Length(pFIO));
  SetLength(Parts.pFirstName, Length(pFIO));
  SetLength(Parts.pMiddleName, Length(pFIO));

  Parts.nLastName := Length(pFIO);
  Parts.nFirstName := Length(pFIO);
  Parts.nMiddleName := Length(pFIO);

  error := pGetFIOParts(PChar(pFIO), @Parts);
  if error <> 0 then
    CreateError(error);

  // уточнение результатов
  // поставил заведомо больше
  SetLength(Parts.pLastName, Parts.nLastName);
  SetLength(Parts.pFirstName, Parts.nFirstName);
  SetLength(Parts.pMiddleName, Parts.nMiddleName);

  Result.LastName := Parts.pLastName;
  Result.FirstName := Parts.pFirstName;
  Result.MiddleName := Parts.pMiddleName;
end;

function GetIFPadegFS;
var
  pGetIFPadegFS: TGetIFPadegFS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetIFPadegFS := GetProcAddress(TPadegDLL.LibPadeg, 'GetIFPadegFS');
  if not Assigned(pGetIFPadegFS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetIFPadegFS'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pIF) + 10;
  res := PChar(StrAlloc(nLen));
  try
    error := pGetIFPadegFS(PChar(pIF), bSex, nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetIFPadeg;
var
  pGetIFPadeg: TGetIFPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetIFPadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetIFPadeg');
  if not Assigned(pGetIFPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetIFPadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pFirstName + pLastName) + 10;
  res := PChar(StrAlloc(nLen));
  try
    error := pGetIFPadeg(PChar(pFirstName), PChar(pLastName), bSex, nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadegFSAS;
var
  pGetFIOPadegFSAS: TGetFIOPadegFSAS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetFIOPadegFSAS := GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegFSAS');
  if not Assigned(pGetFIOPadegFSAS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegFSAS'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pFIO) + 10;
  res := PChar(StrAlloc(nLen));
  try
{$IFDEF CODESITE}
    CodeSite.Send(pFIO);
{$ENDIF}
    error := pGetFIOPadegFSAS(PChar(pFIO), nPadeg, res, nLen);
{$IFDEF CODESITE}
    CodeSite.Send(res);
{$ENDIF}
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function FormingFIO;
var
  pFormingFIO: TFormingFIO;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pFormingFIO := GetProcAddress(TPadegDLL.LibPadeg, 'FormingFIO');
  if not Assigned(pFormingFIO) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''FormingFIO'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pFIO) + 10;
  res := PChar(StrAlloc(nLen));
  try
    error := pFormingFIO(PChar(pFIO), res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadegFS;
var
  pGetFIOPadegFS: TGetFIOPadegFS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetFIOPadegFS := GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegFS');
  if not Assigned(pGetFIOPadegFS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegFS'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pFIO) + 10;
  res := PChar(StrAlloc(nLen));
  try
    error := pGetFIOPadegFS(PChar(pFIO), bSex, nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadegAS;
var
  pGetFIOPadegAS: TGetFIOPadegAS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  nLen := Length(pLastName + pFirstName + pMiddleName) + 10;
  res := PChar(StrAlloc(nLen));
  pGetFIOPadegAS := GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegAS');
  if not Assigned(pGetFIOPadegAS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegAS'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pLastName + ' ' + pFirstName + ' ' + pMiddleName) + 10;
  try
    error := pGetFIOPadegAS(PChar(pLastName), PChar(pFirstName), PChar(pMiddleName), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadeg(pLastName, pFirstName, pMiddleName: String; bSex: Boolean; nPadeg: LongInt): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pGetFIOPadeg: TGetFIOPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetFIOPadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadeg');
  if not Assigned(pGetFIOPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pLastName + pFirstName + pMiddleName) + 10;
  res := StrAlloc(nLen);
  try
    error := pGetFIOPadeg(PChar(pLastName), PChar(pFirstName), PChar(pMiddleName), bSex, nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetNominativePadeg;
var
  pGetNominativePadeg: TGetNominativePadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  nLen := Length(pFIO) + 10;
  res := PChar(StrAlloc(nLen));
  pGetNominativePadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetNominativePadeg');
  if not Assigned(pGetNominativePadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetNominativePadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  try
    error := pGetNominativePadeg(PChar(pFIO), res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetAppointmentPadeg;
var
  pGetAppointmentPadeg: TGetAppointmentPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetAppointmentPadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetAppointmentPadeg');
  if not Assigned(pGetAppointmentPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetAppointmentPadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pAppointment) + 10;
  res := PChar(StrAlloc(nLen));
  try
    // error:=pGetAppointmentPadeg(PChar(pLastName), PChar(pFirstName), PChar(pMiddleName), bSex, nPadeg, res, nLen);
    error := pGetAppointmentPadeg(PChar(pAppointment), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFullAppointmentPadeg(pAppointment, pOffice: String; nPadeg: LongInt): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pGetFullAppointmentPadeg: TGetFullAppointmentPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetFullAppointmentPadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetFullAppointmentPadeg');
  if not Assigned(pGetFullAppointmentPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFullAppointmentPadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pAppointment + pOffice) + 20;
  res := PChar(StrAlloc(nLen));
  try
    error := pGetFullAppointmentPadeg(PChar(pAppointment), PChar(pOffice), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetOfficePadeg(pOffice: String; nPadeg: LongInt): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pGetOfficePadeg: TGetOfficePadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetOfficePadeg := GetProcAddress(TPadegDLL.LibPadeg, 'GetOfficePadeg');
  if not Assigned(pGetOfficePadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetOfficePadeg'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := Length(pOffice) + 10;
  res := PChar(StrAlloc(nLen));
  try
    error := pGetOfficePadeg(PChar(pOffice), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function SetDictionary(FileName: String): Boolean; {$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
var
  pSetDictionary: TSetDictionary;
begin
  TPadegDLL.LoadPadeg;
  pSetDictionary := GetProcAddress(TPadegDLL.LibPadeg, 'SetDictionary');
  if not Assigned(pSetDictionary) then begin
    Result := False;
    // raise Exception.Create('Функция ''SetDictionary'' в библиотеке '+LibName+' не найдена');
  end
  else
    Result := pSetDictionary(PChar(FileName));
end;

function DoubleToVerbal(Value: Extended): String; {$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF}
var
  pFloatToVerbal: TFloatToVerbal;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pFloatToVerbal := GetProcAddress(TPadegDLL.LibPadeg, 'DoubleToVerbal');
  if not Assigned(pFloatToVerbal) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DoubleToVerbal'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := PChar(StrAlloc(nLen));
  try
    error := pFloatToVerbal(Value, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function SumInWords(Value: String; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
var
  pSumInWords: TSumInWords;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pSumInWords := GetProcAddress(TPadegDLL.LibPadeg, 'SumInWords');
  if not Assigned(pSumInWords) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''SumInWords'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := PChar(StrAlloc(nLen));
  try
    error := pSumInWords(PChar(Value), iSex, Decimal, RemoveZero, CnvtFrac, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function NumberToString(Value: Extended; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
var
  pNumberToString: TNumberToString;
{$INCLUDE padegLocVar.inc}
begin;
  TPadegDLL.LoadPadeg;
  Result := '';
  pNumberToString := GetProcAddress(TPadegDLL.LibPadeg, 'NumberToString');
  if not Assigned(pNumberToString) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''NumberToString'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := PChar(StrAlloc(nLen));
  try
    // function(InN: Extended; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean; pResult: PChar): Integer;
    error := pNumberToString(Value, iSex, Decimal, RemoveZero, CnvtFrac, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function DeclCurrency(Quantity: Currency; CurrName: String; nPadeg: Integer; Forms: Byte = 0): String;
{$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF} export;
var
  pDeclCurrency: TDeclCurrency;
{$INCLUDE padegLocVar.inc }
begin;
  TPadegDLL.LoadPadeg;
  Result := '';
  pDeclCurrency := GetProcAddress(TPadegDLL.LibPadeg, 'DeclCurrency');
  if not Assigned(pDeclCurrency) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DeclCurrency'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := PChar(StrAlloc(nLen));

  try
    error := pDeclCurrency(Quantity, PChar(CurrName), nPadeg, Forms, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function DeclNumeral(Value: String; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean): String;
{$IFDEF CDECL} cdecl;
{$ELSE} stdcall; {$ENDIF} export;
var
  pDeclNumeral: TDeclNumeral;
{$INCLUDE padegLocVar.inc }
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pDeclNumeral := GetProcAddress(TPadegDLL.LibPadeg, 'DeclNumeral');
  if not Assigned(pDeclNumeral) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DeclNumeral'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := PChar(StrAlloc(nLen));
  try
    error := pDeclNumeral(PChar(Value), nPadeg, iSex, Order, Soul, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

{ TPadegDLL }
class function TPadegDLL.LoadPadeg(UpdateFileExcept: Boolean): Integer;
(* var
  buffer: array [0..MAX_PATH] of Char;
  str: String; *)
begin
  try
    if LibPadeg = 0 then begin
// LibPadeg := LoadLibrary(PWideChar(TPadegDLL.LibName));
      LibPadeg := SafeLoadLibrary(PWideChar(TPadegDLL.LibName));
    end;
  except
    LibPadeg := LibPadeg;
  end;

  Result := LibPadeg;
  if LibPadeg = 0 then
// В режиме отладки в одном каталоге c данной DLL должна лежать DLL от FastMM
{$IFDEF RAISEERROR}
    raise Exception.Create('Библиотека ' + TPadegDLL.LibName + ' не найдена.')
{$ELSE}
    Exit
{$ENDIF}
  else begin
    (* GetModuleFileName(LibPadeg, buffer, MAX_PATH); // проверка пути к DLL
      str:=buffer; *)
    if UpdateFileExcept then
      if not UpdateExceptions then
        Result := -1;
  end;
end;

function GetCurrencyFile: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pGetCurrencyFile: TGetCurrencyFile;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pGetCurrencyFile := GetProcAddress(TPadegDLL.LibPadeg, 'GetCurrencyFile');
  if not Assigned(pGetCurrencyFile) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''pGetCurrencyFile'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := StrAlloc(nLen);
  try
    error := pGetCurrencyFile(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function CatalogISO: String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pISOs: TCatalogISO;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;

  Result := '';

  pISOs := GetProcAddress(TPadegDLL.LibPadeg, 'CatalogISO');
  if not Assigned(pISOs) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''CatalogISO'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := 1000;
  res := StrAlloc(nLen);
  try
    error := pISOs(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function NameCurrency(ISO: String): String; {$IFDEF CDECL} cdecl; {$ELSE} stdcall; {$ENDIF}
var
  pNameCurrency: TNameCurrency;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result := '';
  pNameCurrency := GetProcAddress(TPadegDLL.LibPadeg, 'NameCurrency');
  if not Assigned(pNameCurrency) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''NameCurrency'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen := (* Length(ISO) + *) 200;
  res := PChar(StrAlloc(nLen));
  try
    error := pNameCurrency(PChar(ISO), res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

end.
