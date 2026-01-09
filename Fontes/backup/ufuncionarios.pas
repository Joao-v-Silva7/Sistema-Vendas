unit UFuncionarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, DBCtrls, DBGrids;

type

  { TFrmFuncionarios }

  TFrmFuncionarios = class(TForm)
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    FotosFuncionarios: TImage;
    Label1: TLabel;
    Label2: TLabel;
    PageControl: TPageControl;
    PanelPesquisa: TPanel;
    PanelPesquisa1: TPanel;
    PanelPesquisa2: TPanel;
    Botao_Insert: TSpeedButton;
    Botao_Excluir: TSpeedButton;
    Botao_Alterar: TSpeedButton;
    Botao_Salvar: TSpeedButton;
    Botao_Cancelar: TSpeedButton;
    Botao_Fotos: TSpeedButton;
    TabConsultas: TTabSheet;
    TabCadastros: TTabSheet;
    procedure Botao_AlterarClick(Sender: TObject);
    procedure Botao_CancelarClick(Sender: TObject);
    procedure Botao_InsertClick(Sender: TObject);
    procedure Botao_SalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmFuncionarios: TFrmFuncionarios;

implementation

{$R *.lfm}

{ TFrmFuncionarios }

procedure TFrmFuncionarios.FormCreate(Sender: TObject);
begin

end;

procedure TFrmFuncionarios.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key = #27 then
  begin
    if PageControl.ActivePageIndex = 0 then
    close
    else
      Botao_Cancelar.Click;
  end;
end;

procedure TFrmFuncionarios.Botao_SalvarClick(Sender: TObject);
begin
  TabConsultas.TabVisible:= True;
  TabCadastros.TabVisible:= False;
  //DBEdit1.SetFocus;
end;

procedure TFrmFuncionarios.Botao_CancelarClick(Sender: TObject);
begin
  TabConsultas.TabVisible:= True;
  TabCadastros.TabVisible:= False;
  DBGrid.SetFocus;
end;

procedure TFrmFuncionarios.Botao_AlterarClick(Sender: TObject);
begin
  TabConsultas.TabVisible:= False;
  TabCadastros.TabVisible:= True;
  //DBEdit1.SetFocus;
end;

procedure TFrmFuncionarios.Botao_InsertClick(Sender: TObject);
begin
  TabConsultas.TabVisible:= False;
  TabCadastros.TabVisible:= True;
  //DBGrid.SetFocus;
end;

procedure TFrmFuncionarios.FormShow(Sender: TObject);
begin
  TabConsultas.TabVisible:= True;
  TabCadastros.TabVisible:= False;
  DBGrid.SetFocus;
end;

end.

