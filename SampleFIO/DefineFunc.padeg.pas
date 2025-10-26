unit DefineFunc.Padeg;

// Если установлено, то в случае ошибки вызывает исключение
// или завершает втихую вызывая Exit.
{$DEFINE RAISEERROR}
(*
https://www.sql.ru/forum/692180-2/ispolzovanie-dll-iz-delphi-v-yazyke-c
https://www.gunsmoker.ru/2019/06/developing-DLL-API.html

https://overcoder.net/q/14092/%D0%BF%D0%BE%D1%87%D0%B5%D0%BC%D1%83-widestring-%D0%BD%D0%B5-%D0%BC%D0%BE%D0%B6%D0%B5%D1%82-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F-%D0%BA%D0%B0%D0%BA-%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%89%D0%B0%D0%B5%D0%BC%D0%BE%D0%B5-%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8-%D0%B4%D0%BB%D1%8F
*)

interface

uses System.Classes, System.SysUtils;

type
  TFIOParts = record
    LastName, FirstName, MiddleName: WideString;
  end;

  // ф-ции склонения ФИО
function GetFIOPadeg(pLastName, pFirstName, pMiddleName: String; bSex: Boolean; nPadeg: Integer)
  : String; stdcall;
function GetFIOPadegAS(pLastName, pFirstName, pMiddleName: String; nPadeg: Integer)
  : String; stdcall;
function GetFIOPadegFS(pFIO: String; bSex: Boolean; nPadeg: Integer): String; stdcall;
function GetFIOPadegFSAS(pFIO: String; nPadeg: Integer): String; stdcall;

function GetIFPadeg(pFirstName, pLastName: String; bSex: Boolean; nPadeg: Integer): String; stdcall;
function GetIFPadegFS(pIF: String; bSex: Boolean; nPadeg: Integer): String; stdcall;

// восстановление ФИО
function GetNominativePadeg(pFIO: String): String; stdcall;

// склонение должностей и подразделений
function GetAppointmentPadeg(pAppointment: String; nPadeg: Integer): String; stdcall;
function GetFullAppointmentPadeg(pAppointment, pOffice: String; nPadeg: Integer): String; stdcall;
function GetOfficePadeg(pOffice: String; nPadeg: Integer): String; stdcall;

// вспомогательные ф-ции
function GetFIOParts(FIO: WideString): TFIOParts; stdcall;
function GetSex(pMiddleName: String): Integer; stdcall;

// Выстраивание ФИО в порядке Ф.И.О. например из И.О.Ф.
function FormingFIO(pFIO: String): String; stdcall;

// файл исключений
function GetExceptionsFileName: WideString; stdcall;
function UpdateExceptions: Boolean; stdcall;
function SetDictionary(FileName: String): Boolean; stdcall;

// числительные
function DoubleToVerbal(Value: Double): String; stdcall;
function NumberToString(Value: Double; iSex: Integer; Decimal: Integer;
  RemoveZero, CnvtFrac: Boolean): String; stdcall; // export;
function SumInWords(Value: String; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean)
  : String; stdcall; // export;
function DeclNumeral(Value: String; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean): String;
  stdcall; // export;
function DeclCurrency(Quantity: Currency; CurrName: String; nPadeg: Integer; Forms: Byte = 0)
  : String; stdcall; // export;
function GetCurrencyFile: String; stdcall;
function CatalogISO: String; stdcall;
function NameCurrency(ISO: String): String; stdcall;

implementation

{$IF defined(MSWINDOWS)}
uses
  Winapi.Windows;
{$ENDIF}

type

  PPartsFIO = ^TPartsFIO;

  TPartsFIO = record
    pLastName, pFirstName, pMiddleName: String;
    nLastName, nFirstName, nMiddleName: Integer;
  end;

  TPadegDLL = record
  const
    LibName: String = 'PadegNET.dll'; // имя библиотеки
    class var LibPadeg: HMODULE;
  public
    class function LoadPadeg(UpdateFileExcept: Boolean = False): Integer; static;
  end;

// типы эксплортируемых ф-ций DLL
  TGetFIOParts = function(FIO: WideString; var Parts: PPartsFIO): Integer; stdcall;
  TGetIFPadeg = function(pFirstName, pLastName: PWideChar; bSex: Boolean; nPadeg: Integer;
    var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TGetIFPadegFS = function(pIF: PWideChar; bSex: Boolean; nPadeg: Integer; var pResult: PWideChar;
    var nLen: Integer): Integer; stdcall;
  TGetFIOPadeg = function(pLastName, pFirstName, pMiddleName: PWideChar; bSex: Boolean;
    nPadeg: Integer; var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TGetFIOPadegAS = function(pLastName, pFirstName, pMiddleName: PWideChar; nPadeg: Integer;
    var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TGetFIOPadegFS = function(pFIO: PWideChar; bSex: Boolean; nPadeg: Integer; var pResult: PWideChar;
    var nLen: Integer): Integer; stdcall;
  TGetFIOPadegFSAS = function(pFIO: PWideChar; nPadeg: Integer; var pResult: PWideChar;
    var nLen: Integer): Integer; stdcall;
  TGetNominativePadeg = function(pFIO: PWideChar; var pResult: PWideChar; var nLen: Integer)
    : Integer; stdcall;
  TUpdateExceptions = function: Boolean; stdcall;
  TSetDictionary = function(DicName: PWideChar): Boolean; stdcall;
  TGetSex = function(pMiddleName: PWideChar): Integer; stdcall;

  TGetNameFileExceptions = function(var pResult: PWideChar; var nLen: Integer): Integer; stdcall;

  TFormingFIO = function(pFIO: PWideChar; var pResult: PWideChar; var nLen: Integer)
    : Integer; stdcall;
  TGetAppointmentPadeg = function(pAppointment: PWideChar; nPadeg: Integer; var pResult: PWideChar;
    var nLen: Integer): Integer; stdcall;
  TGetFullAppointmentPadeg = function(pAppointment, pOffice: PWideChar; nPadeg: Integer;
    var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TGetOfficePadeg = function(pOffice: PWideChar; nPadeg: Integer; var pResult: PWideChar;
    var nLen: Integer): Integer; stdcall;
  TFloatToVerbal = function(Value: Double; var pResult: PWideChar; var nLen: Integer)
    : Integer; stdcall;
  TSumInWords = function(Value: PWideChar; iSex: Integer; Decimal: Byte;
    RemoveZero, CnvtFrac: Boolean; var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
(* (Quantity: PWideChar; iSex: TiSex;   Decimal: Byte;
    RemoveZero, CnvtFrac: Boolean; var pResult: PWideChar; var nLen: Integer): Integer; *)

  TNumberToString = function(Value: Double; iSex: Integer; Decimal: Integer;
    RemoveZero, CnvtFrac: Boolean; var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
(* function (Quantity: Double; iSex: TiSex; Decimal: Byte; RemoveZero, CnvtFrac: Boolean;
  var pResult: PWideChar; var nLen: Integer): Integer; stdcall; export; *)

  TDeclCurrency = function(Quantity: Currency; CurrName: PWideChar; nPadeg: Integer; Forms: Byte;
    var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TDeclNumeral = function(Value: PWideChar; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean;
    var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TGetCurrencyFile = function(var pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TCatalogISO = function(pResult: PWideChar; var nLen: Integer): Integer; stdcall;
  TNameCurrency = function(pISO: PWideChar; var pResult: PWideChar; var nLen: Integer)
    : Integer; stdcall;

procedure CreateError(error: Integer);
begin
  (* -1 - недопустимое значение падежа;
    -2 - недопустимое значение рода;
    -3 - размер буфера недостаточен для размещения результата преобразования ФИО. *)
  case error of
    - 1:
      Exception.Create('Недопустимое значение падежа');
    -2:
      Exception.Create('Недопустимое значение рода');
    -3:
      Exception.Create('Размер буфера недостаточен для размещения результата преобразования ФИО');
  else
    Exception.Create('Неизвестный код ошибки: ' + IntToStr(error));
  end;
end;

function GetSex(pMiddleName: String): Integer; stdcall;
var
  pGetSex: TGetSex;
begin
  TPadegDLL.LoadPadeg;
  pGetSex:=GetProcAddress(TPadegDLL.LibPadeg, 'GetSex');
  if not Assigned(pGetSex) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetSex'' в библиотеке ' + TPadegDLL.LibName + ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  Result:=pGetSex(PWideChar(pMiddleName));
end;

function GetExceptionsFileName: WideString;
var
  pGetNameFileExceptions: TGetNameFileExceptions;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetNameFileExceptions:=GetProcAddress(TPadegDLL.LibPadeg, 'GetExceptionsFileName');
  if not Assigned(pGetNameFileExceptions) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetExceptionsFileName'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetNameFileExceptions(res, nLen);
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
  pUpdateExceptions:=GetProcAddress(TPadegDLL.LibPadeg, 'UpdateExceptions');
  if not Assigned(pUpdateExceptions) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''UpdateExceptions'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  Result:=pUpdateExceptions;
end;

function GetFIOParts(FIO: WideString): TFIOParts;
var
  pGetFIOParts: TGetFIOParts;
  Parts: PPartsFIO;
  error: Integer;
begin
  TPadegDLL.LoadPadeg;
  pGetFIOParts:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOParts');

  Result.LastName:='';
  Result.FirstName:='';
  Result.MiddleName:='';

  if not Assigned(pGetFIOParts) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOParts'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  New(Parts);

  (*
  Parts.pLastName:='Имя                              ';
  Parts.pFirstName:='Фамилия                          ';
  Parts.pMiddleName:='Отчество                         ';
  Parts.nLastName:=Length(FIO);
  Parts.nFirstName:=Length(FIO);
  Parts.nMiddleName:=Length(FIO); *)

  error:=pGetFIOParts(FIO, Parts);

  if error <> 0 then
    CreateError(error);

  // уточнение результатов
  SetLength(Parts^.pLastName, Parts^.nLastName);
  SetLength(Parts^.pFirstName, Parts^.nFirstName);
  SetLength(Parts^.pMiddleName, Parts^.nMiddleName);

  Result.LastName:=Parts^.pLastName;
  Result.FirstName:=Parts^.pFirstName;
  Result.MiddleName:=Parts^.pMiddleName;

  Dispose(Parts);
end;

function GetIFPadegFS;
var
  pGetIFPadegFS: TGetIFPadegFS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetIFPadegFS:=GetProcAddress(TPadegDLL.LibPadeg, 'GetIFPadegFS');
  if not Assigned(pGetIFPadegFS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetIFPadegFS'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pIF) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetIFPadegFS(PWideChar(pIF), bSex, nPadeg, res, nLen);
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
  Result:='';
  pGetIFPadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetIFPadeg');
  if not Assigned(pGetIFPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetIFPadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pFirstName + pLastName) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetIFPadeg(PWideChar(pFirstName), PWideChar(pLastName), bSex, nPadeg, res, nLen);
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
  Result:='';
  pGetFIOPadegFSAS:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegFSAS');
  if not Assigned(pGetFIOPadegFSAS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegFSAS'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pFIO) + 10;
  res:=WideStrAlloc(nLen);
  try
{$IFDEF CODESITE}
    CodeSite.Send(pFIO);
{$ENDIF}
    error:=pGetFIOPadegFSAS(PWideChar(pFIO), nPadeg, res, nLen);
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
  Result:='';
  pFormingFIO:=GetProcAddress(TPadegDLL.LibPadeg, 'FormingFIO');

(* System.SysUtils.GetProcAddress()
  Posix.Dlfcn.dlsym() *)

  if not Assigned(pFormingFIO) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''FormingFIO'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pFIO) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pFormingFIO(PWideChar(pFIO), res, nLen);
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
  Result:='';
  pGetFIOPadegFS:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegFS');
  if not Assigned(pGetFIOPadegFS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegFS'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pFIO) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetFIOPadegFS(PWideChar(pFIO), bSex, nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadegAS(pLastName, pFirstName, pMiddleName: String; nPadeg: Integer): String;
var
  pGetFIOPadegAS: TGetFIOPadegAS;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetFIOPadegAS:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadegAS');
  if not Assigned(pGetFIOPadegAS) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadegAS'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pLastName + pFirstName + pMiddleName) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetFIOPadegAS(PWideChar(pLastName), PWideChar(pFirstName), PWideChar(pMiddleName),
      nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFIOPadeg(pLastName, pFirstName, pMiddleName: String; bSex: Boolean;
  nPadeg: Integer): String;
var
  pGetFIOPadeg: TGetFIOPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';

  pGetFIOPadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFIOPadeg');
  if not Assigned(pGetFIOPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFIOPadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pLastName + pFirstName + pMiddleName) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetFIOPadeg(PWideChar(pLastName), PWideChar(pFirstName), PWideChar(pMiddleName), bSex,
      nPadeg, res, nLen);
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
  Result:='';
  nLen:=Length(pFIO) + 10;
  res:=WideStrAlloc(nLen);
  pGetNominativePadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetNominativePadeg');
  if not Assigned(pGetNominativePadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetNominativePadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  try
    error:=pGetNominativePadeg(PWideChar(pFIO), res, nLen);
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
  Result:='';
  pGetAppointmentPadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetAppointmentPadeg');
  if not Assigned(pGetAppointmentPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetAppointmentPadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pAppointment) + 10;
  res:=WideStrAlloc(nLen);
  try
    // error:=pGetAppointmentPadeg(PWideChar(pLastName), PWideChar(pFirstName), PWideChar(pMiddleName), bSex, nPadeg, res, nLen);
    error:=pGetAppointmentPadeg(PWideChar(pAppointment), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetFullAppointmentPadeg(pAppointment, pOffice: String; nPadeg: Integer): String;
var
  pGetFullAppointmentPadeg: TGetFullAppointmentPadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetFullAppointmentPadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetFullAppointmentPadeg');
  if not Assigned(pGetFullAppointmentPadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetFullAppointmentPadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pAppointment + pOffice) + 20;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetFullAppointmentPadeg(PWideChar(pAppointment), PWideChar(pOffice), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function GetOfficePadeg(pOffice: String; nPadeg: Integer): String;
var
  pGetOfficePadeg: TGetOfficePadeg;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetOfficePadeg:=GetProcAddress(TPadegDLL.LibPadeg, 'GetOfficePadeg');
  if not Assigned(pGetOfficePadeg) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''GetOfficePadeg'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=Length(pOffice) + 10;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetOfficePadeg(PWideChar(pOffice), nPadeg, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function SetDictionary(FileName: String): Boolean;
var
  pSetDictionary: TSetDictionary;
begin
  TPadegDLL.LoadPadeg;
  pSetDictionary:=GetProcAddress(TPadegDLL.LibPadeg, 'SetDictionary');
  if not Assigned(pSetDictionary) then begin
    Result:=False;
    // raise Exception.Create('Функция ''SetDictionary'' в библиотеке '+LibName+' не найдена');
  end
  else
    Result:=pSetDictionary(PWideChar(FileName));
end;

function DoubleToVerbal(Value: Double): String;
var
  pFloatToVerbal: TFloatToVerbal;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pFloatToVerbal:=GetProcAddress(TPadegDLL.LibPadeg, 'DoubleToVerbal');
  if not Assigned(pFloatToVerbal) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DoubleToVerbal'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    error:=pFloatToVerbal(Value, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function SumInWords(Value: String; iSex: Integer; Decimal: Integer;
  RemoveZero, CnvtFrac: Boolean): String;
var
  pSumInWords: TSumInWords;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pSumInWords:=GetProcAddress(TPadegDLL.LibPadeg, 'SumInWords');
  if not Assigned(pSumInWords) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''SumInWords'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    error:=pSumInWords(PWideChar(Value), iSex, Decimal, RemoveZero, CnvtFrac, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function NumberToString(Value: Double; iSex: Integer; Decimal: Integer;
  RemoveZero, CnvtFrac: Boolean): String;
var
  pNumberToString: TNumberToString;
{$INCLUDE padegLocVar.inc}
begin;
  TPadegDLL.LoadPadeg;
  Result:='';
  pNumberToString:=GetProcAddress(TPadegDLL.LibPadeg, 'NumberToString');
  if not Assigned(pNumberToString) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''NumberToString'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    // function(InN: Double; iSex: Integer; Decimal: Integer; RemoveZero, CnvtFrac: Boolean; pResult: PWideChar): Integer;
    error:=pNumberToString(Value, iSex, Decimal, RemoveZero, CnvtFrac, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function DeclCurrency(Quantity: Currency; CurrName: String; nPadeg: Integer;
  Forms: Byte = 0): String;
var
  pDeclCurrency: TDeclCurrency;
{$INCLUDE padegLocVar.inc }
begin;
  TPadegDLL.LoadPadeg;
  Result:='';
  pDeclCurrency:=GetProcAddress(TPadegDLL.LibPadeg, 'DeclCurrency');
  if not Assigned(pDeclCurrency) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DeclCurrency'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);

  try
    error:=pDeclCurrency(Quantity, PWideChar(CurrName), nPadeg, Forms, res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

function DeclNumeral(Value: String; nPadeg: Integer; iSex: Integer; Order, Soul: Boolean): String;
var
  pDeclNumeral: TDeclNumeral;
{$INCLUDE padegLocVar.inc }
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pDeclNumeral:=GetProcAddress(TPadegDLL.LibPadeg, 'DeclNumeral');
  if not Assigned(pDeclNumeral) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''DeclNumeral'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    error:=pDeclNumeral(PWideChar(Value), nPadeg, iSex, Order, Soul, res, nLen);
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
    if LibPadeg = 0 then
      // LibPadeg := LoadLibrary(PWideChar(TPadegDLL.LibName));
      LibPadeg:=SafeLoadLibrary(PWideChar(TPadegDLL.LibName));
  except
    LibPadeg:=LibPadeg;
  end;

  Result:=LibPadeg;
  if LibPadeg = 0 then
{$IFDEF RAISEERROR}
    Exception.Create('Библиотека ' + TPadegDLL.LibName + ' не найдена.')
{$ELSE}
    Exit
{$ENDIF}
  else begin
(* GetModuleFileName(LibPadeg, buffer, MAX_PATH); // проверка пути к DLL
    str:=buffer; *)
    if UpdateFileExcept then
      if not UpdateExceptions then
        Result:=-1;
  end;
end;

function GetCurrencyFile: String;
var
  pGetCurrencyFile: TGetCurrencyFile;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pGetCurrencyFile:=GetProcAddress(TPadegDLL.LibPadeg, 'GetCurrencyFile');
  if not Assigned(pGetCurrencyFile) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''pGetCurrencyFile'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=1000;
  res:=WideStrAlloc(nLen);
  try
    error:=pGetCurrencyFile(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function CatalogISO: String;
var
  pISOs: TCatalogISO;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;

  Result:='';

  pISOs:=GetProcAddress(TPadegDLL.LibPadeg, 'CatalogISO');
  if not Assigned(pISOs) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''CatalogISO'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:=100000;
  res:=WideStrAlloc(nLen);
  try
    error:=pISOs(res, nLen);
    if error = 0 then
      SetString(Result, res, nLen);
  finally
    StrDispose(res);
  end;
end;

function NameCurrency(ISO: String): String;
var
  pNameCurrency: TNameCurrency;
{$INCLUDE padegLocVar.inc}
begin
  TPadegDLL.LoadPadeg;
  Result:='';
  pNameCurrency:=GetProcAddress(TPadegDLL.LibPadeg, 'NameCurrency');
  if not Assigned(pNameCurrency) then
{$IFDEF RAISEERROR}
    raise Exception.Create('Функция ''NameCurrency'' в библиотеке ' + TPadegDLL.LibName +
      ' не найдена');
{$ELSE}
    Exit;
{$ENDIF}
  nLen:= (* Length(ISO) + *) 200;
  res:=WideStrAlloc(nLen);
  try
    error:=pNameCurrency(PWideChar(ISO), res, nLen);
    if error = 0 then
      SetString(Result, res, nLen)
    else
      CreateError(error);
  finally
    StrDispose(res);
  end;
end;

initialization

finalization

if TPadegDLL.LibPadeg <> 0 then begin
  FreeLibrary(TPadegDLL.LibPadeg);
  TPadegDLL.LibPadeg:=0;
end;

end.
