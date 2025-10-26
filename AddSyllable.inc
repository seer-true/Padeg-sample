//(nPadeg: Word; question: Boolean = True): String;
begin
  if question then
    case nPadeg of
      1:
        Result:='Им.'+#9;
      2:
        Result:='Род. (нет)';
      3:
        Result:='Дат. (дать)';
      4:
        Result:='Вин. (вижу)';
      5:
        Result:='Тв. (горжусь)';
      6:
        Result:='Пр. (мечтаю о)';
    else
      Result:='';
    end
  else
    case nPadeg of
      1:
        Result:='Им.';
      2:
        Result:='Род.';
      3:
        Result:='Дат.';
      4:
        Result:='Вин.';
      5:
        Result:='Тв.';
      6:
        Result:='Пр.';
    else
      Result:='';
    end;
end;