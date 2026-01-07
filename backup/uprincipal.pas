unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TformPrincipal }

  TformPrincipal = class(TForm)
    cadastroUsuario: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    labelData: TLabel;
    labelHora: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Timer: TTimer;
    procedure BitBtn9Click(Sender: TObject);
    procedure cadastroUsuarioClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure CadastroFuncionario;
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

procedure TformPrincipal.cadastroUsuarioClick(Sender: TObject);
begin

end;

procedure TformPrincipal.Panel7Click(Sender: TObject);
begin

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

end.

