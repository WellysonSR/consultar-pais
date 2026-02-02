unit uPaisServico;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Net.HttpClient,
  System.Net.URLClient, System.Net.HttpClientComponent, System.NetEncoding,
  uPais;

type
  TPaisServico = class
  private
    function TraduzirRegiao(ARegiao: string): string;
  public
    function ConsultarPais(ANome: string): TPais;
  end;

implementation

function TPaisServico.TraduzirRegiao(ARegiao: string): string;
begin
  Result := ARegiao;
  if ARegiao = 'Americas' then Result := 'Américas'
  else if ARegiao = 'Europe' then Result := 'Europa'
  else if ARegiao = 'Africa' then Result := 'África'
  else if ARegiao = 'Asia' then Result := 'Ásia';
end;

function TPaisServico.ConsultarPais(ANome: string): TPais;
var
  LHTTP: TNetHTTPClient;
  LResponse: IHTTPResponse;
  LJSONArray: TJSONArray;
  LCountryObj, LTranslations, LCurrencies: TJSONObject;
  LURL, LCurrencyKey: string;
begin
  Result := nil;
  LHTTP := TNetHTTPClient.Create(nil);
  try
    LURL := 'https://restcountries.com/v3.1/name/' + TNetEncoding.URL.Encode(ANome);

    try
      LResponse := LHTTP.Get(LURL);

      if LResponse.StatusCode = 200 then
      begin
        LJSONArray := TJSONObject.ParseJSONValue(LResponse.ContentAsString) as TJSONArray;
        if Assigned(LJSONArray) then
        try
          LCountryObj := LJSONArray.Items[0] as TJSONObject;
          Result := TPais.Create;

          LTranslations := LCountryObj.GetValue<TJSONObject>('translations');
          if (LTranslations <> nil) and (LTranslations.GetValue('por') <> nil) then
            Result.NomeOficial := LTranslations.GetValue<TJSONObject>('por').GetValue('official').Value
          else
            Result.NomeOficial := LCountryObj.GetValue<TJSONObject>('name').GetValue('official').Value;

          if LCountryObj.GetValue('capital') <> nil then
            Result.Capital := (LCountryObj.GetValue('capital') as TJSONArray).Items[0].Value
          else
            Result.Capital := 'N/A';

          Result.Regiao := TraduzirRegiao(LCountryObj.GetValue('region').Value);
          Result.Populacao := FormatFloat('#,##0', LCountryObj.GetValue<Double>('population'));

          Result.Moeda := 'Não informada';
          LCurrencies := LCountryObj.GetValue<TJSONObject>('currencies');
          if (LCurrencies <> nil) and (LCurrencies.Count > 0) then
          begin
            LCurrencyKey := LCurrencies.Pairs[0].JsonString.Value;
            Result.Moeda := LCurrencies.GetValue<TJSONObject>(LCurrencyKey).GetValue('name').Value;
          end;
        finally
          LJSONArray.Free;
        end;
      end;
    except
      on E: Exception do
      begin
        if Assigned(Result) then FreeAndNil(Result);
        raise Exception.Create('Erro ao processar dados do país: ' + E.Message);
      end;
    end;
  finally
    LHTTP.Free;
  end;
end;

end.
