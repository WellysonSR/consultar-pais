unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uPais, uPaisServico;

type
  TForm1 = class(TForm)
    edtPesquisa: TEdit;
    btnConsultarPais: TButton;
    lblConsultaPais: TLabel;
    memoResultados: TMemo;
    procedure btnConsultarPaisClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConsultarPaisClick(Sender: TObject);
var
  LServico: TPaisServico;
  LPais: TPais;
begin
  if Trim(edtPesquisa.Text) = '' then
  begin
    ShowMessage('Por favor, digite o nome de um país.');
    Exit;
  end;

  memoResultados.Lines.Clear;
  memoResultados.Lines.Add('Consultando dados...');

  LServico := TPaisServico.Create;
  try
    try
      LPais := LServico.ConsultarPais(edtPesquisa.Text);

      if Assigned(LPais) then
      try
        memoResultados.Lines.Clear;
        memoResultados.Lines.Add('--- INFORMAÇÕES DO PAÍS ---');
        memoResultados.Lines.Add('Nome Oficial: ' + LPais.NomeOficial);
        memoResultados.Lines.Add('Capital: ' + LPais.Capital);
        memoResultados.Lines.Add('Região: ' + LPais.Regiao);
        memoResultados.Lines.Add('População: ' + LPais.Populacao);
        memoResultados.Lines.Add('Moeda: ' + LPais.Moeda);
        memoResultados.Lines.Add('---------------------------');
      finally
        LPais.Free;
      end
      else
      begin
        memoResultados.Lines.Clear;
        memoResultados.Lines.Add('País não encontrado.');
      end;

    except
      on E: Exception do
        ShowMessage('Erro: ' + E.Message);
    end;
  finally
    LServico.Free;
  end;
end;

end.
