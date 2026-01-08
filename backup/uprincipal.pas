unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ExtDlgs, UDMDados,
  DB,
  FPReadJPEG,
  FPReadPNG, UFuncionarios;

type

  { TformPrincipal }

  TformPrincipal = class(TForm)
    Image1: TImage;
    FotosLogos: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    labelData: TLabel;
    labelHora: TLabel;
    AbreLogos: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Timer: TTimer;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn9MouseLeave(Sender: TObject);
    procedure cadastroUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure CadastroFuncionario;
    procedure AplicarTema(CorFundo, CorPainel, CorBotao, CorTexto: TColor);
  public

  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.lfm}

{ TformPrincipal }

procedure TformPrincipal.Panel4Click(Sender: TObject);
begin

end;

procedure TformPrincipal.BitBtn9Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TformPrincipal.BitBtn2Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmProdutos, FrmProdutos);
    //FrmProdutos.ShoModal;
  finally
    //FreeAndNil(FrmProdutos);
  end;
end;

procedure TformPrincipal.BitBtn3Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmClientes, FrmClientes);
    //FrmClientes.ShoModal;
  finally
    //FreeAndNil(FrmClientes);
  end;
end;

procedure TformPrincipal.BitBtn4Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmPdv, FrmPdv);
    //FrmPdv.ShoModal;
  finally
    //FreeAndNil(FrmPdv);
  end;
end;

procedure TformPrincipal.BitBtn5Click(Sender: TObject);
begin
  if AbreLogos.Execute then
  begin
  // verifica se a query está aberta
  if not DmDados.QRLogo.Active then
  DmDados.QRLogo.Open;

  if DmDados.QRLogo.IsEmpty then
  DmDados.QRLogo.Insert
  else
    DmDados.QRLogo.Edit;
  try
    // Carrega o arquivo selecionado para o campo BLOB do banco
      // Usamos TBlobField para ter acesso ao método LoadFromFile
      TBlobField(DmDados.QRLogo.FieldByName('LOGOS_IMGS')).LoadFromFile(AbreLogos.FileName);

      //salva no banco de dados
      DmDados.QRLogo.Post;

      //Confirma a gravação no arquivo do Firebird
      DmDados.conexaoDB.Commit;

      // Mostra a imagem na tela imediatamente para o usuário ver que mudou
      FotosLogos.Picture.LoadFromFile(AbreLogos.FileName);

      MessageDlg('Sucesso', 'A logo foi atualizada com êxito!', mtInformation, [mbOK], 0);
  except
    on E: Exception do
    begin
      DmDados.QRLogo.Cancel;
        ShowMessage('Erro ao salvar imagem: ' + E.Message);
    end;
  end;
  end;
end;

procedure TformPrincipal.BitBtn6Click(Sender: TObject);
begin
  AplicarTema(clWhite, $00F0D9C2, $00E1B68B, clBlack);
end;

procedure TformPrincipal.BitBtn7Click(Sender: TObject);
begin
  AplicarTema($002F2F2F, clBlack, $00444444, clWhite)
end;

procedure TformPrincipal.BitBtn8Click(Sender: TObject);
begin
  AplicarTema(clSilver, $00E0E0E0, $00C0C0C0, clBlack);
end;

procedure TformPrincipal.BitBtn9MouseLeave(Sender: TObject);
begin

end;

procedure TformPrincipal.cadastroUsuarioClick(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmFuncionarios, FrmFuncionarios);
    //FrmFuncionarios.ShoModal;
  finally
    //FreeAndNil(FrmFuncionarios);
  end;
end;

procedure TformPrincipal.FormShow(Sender: TObject);
var
  MS: TMemoryStream;
begin
  if not DmDados.QRLogo.Active then
     DmDados.QRLogo.Open;
    //verfica se existe imagem no banco
  if not DmDados.QRLogo.FieldByName('LOGOS_IMGS').IsNull then
  begin
    MS := TMemoryStream.Create;
    try
        //joga o conteudo do binario do campo para a memória (stream)
       TBlobField(DmDados.QRLogo.FieldByName('LOGOS_IMGS')).SaveToStream(MS);
       MS.Position:=0;

       FotosLogos.Picture.LoadFromStream(MS);
    finally
      MS.Free;
    end;
  end;
end;

procedure TformPrincipal.Panel7Click(Sender: TObject);
begin

end;

procedure TformPrincipal.SpeedButton1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmFuncionarios, FrmFuncionarios);
    FrmFuncionarios.ShowModa;l
  finally
    FreeAndNil(FrmFuncionarios);
  end;
end;

procedure TformPrincipal.SpeedButton2Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmProdutos, FrmProdutos);
    //FrmProdutos.ShoModal;
  finally
    //FreeAndNil(FrmProdutos);
  end;
end;

procedure TformPrincipal.SpeedButton3Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmClientes, FrmClientes);
    //FrmClientes.ShoModal;
  finally
    //FreeAndNil(FrmClientes);
  end;
end;

procedure TformPrincipal.SpeedButton4Click(Sender: TObject);
begin
  try
    //Application.CreateForm(TFrmPdv, FrmPdv);
    //FrmPdv.ShoModal;
  finally
    //FreeAndNil(FrmPdv);
  end;
end;

procedure TformPrincipal.SpeedButton5Click(Sender: TObject);
begin
  if AbreLogos.Execute then
  begin
  // verifica se a query está aberta
  if not DmDados.QRLogo.Active then
  DmDados.QRLogo.Open;

  if DmDados.QRLogo.IsEmpty then
  DmDados.QRLogo.Insert
  else
    DmDados.QRLogo.Edit;
  try
    // Carrega o arquivo selecionado para o campo BLOB do banco
      // Usamos TBlobField para ter acesso ao método LoadFromFile
      TBlobField(DmDados.QRLogo.FieldByName('LOGOS_IMGS')).LoadFromFile(AbreLogos.FileName);

      //salva no banco de dados
      DmDados.QRLogo.Post;

      //Confirma a gravação no arquivo do Firebird
      DmDados.conexaoDB.Commit;

      // Mostra a imagem na tela imediatamente para o usuário ver que mudou
      FotosLogos.Picture.LoadFromFile(AbreLogos.FileName);

      MessageDlg('Sucesso', 'A logo foi atualizada com êxito!', mtInformation, [mbOK], 0);
  except
    on E: Exception do
    begin
      DmDados.QRLogo.Cancel;
        ShowMessage('Erro ao salvar imagem: ' + E.Message);
    end;
  end;
  end;
end;

procedure TformPrincipal.SpeedButton6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TformPrincipal.SpeedButton7Click(Sender: TObject);
begin
  AplicarTema(clWhite, $00F0D9C2, $00E1B68B, clBlack);
end;

procedure TformPrincipal.SpeedButton8Click(Sender: TObject);
begin
  AplicarTema($002F2F2F, clBlack, $00444444, clWhite)
end;

procedure TformPrincipal.SpeedButton9Click(Sender: TObject);
begin
  AplicarTema($00F1F8E9 , $002E7D32, $0043A047, clWhite);
end;

procedure TformPrincipal.TimerTimer(Sender: TObject);
begin
  labelHora.Caption:= TimeToStr(Time);
  labelData.Caption := FormatDateTime('dddd', Date) + (',')+FormatDateTime('dd', Date)+(' de ')
  +FormatDateTime('mmmm', Date)+ (' de ')+FormatDateTime('yyyy', Date);
end;

procedure TformPrincipal.CadastroFuncionario;
begin

end;

procedure TformPrincipal.AplicarTema(CorFundo, CorPainel,CorBotao, CorTexto: TColor);
var
  i: integer;
begin
  Self.Color := CorFundo;

  for i := 0 to ComponentCount -1 do
  begin
      // se for um painel
       if Components[i] is TPanel then
       begin
            Tpanel(Components[i]).Color := CorPainel;
            Tpanel(Components[i]).Font.Color := CorTexto;
       end;
       // se for um texto
       if Components[i] is TLabel then
       begin
          if CorFundo = $00F1F8E9 then
          TLabel(Components[i]).Font.Color := clBlack
       else
          TLabel(Components[i]).Font.Color := CorTexto;
       end;
       //if Components[i] is TDBGrid then
    begin
      // TDBGrid(Components[i]).Color := clWhite;
       //TDBGrid(Components[i]).FixedColor := CorPainel;
      // TDBGrid(Components[i]).Font.Color := clBlack;
    end;
    if Components[i] is TSpeedButton then
       begin
            TSpeedButton(Components[i]).Flat := True;
            TSpeedButton(Components[i]).Color := CorBotao;
            TSpeedButton(Components[i]).Font.Color := CorTexto;
            TSpeedButton(Components[i]).Transparent := False;
       end;
  end;
end;

end.

