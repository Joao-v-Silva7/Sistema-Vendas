unit UDMDados;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZDataset, ZConnection, ZSqlUpdate, ZAbstractRODataset,
  SQLDB, DB;

type

  { TDmDados }

  TDmDados = class(TDataModule)
    conexaoDB: TZConnection;
    Ds_Funcionarios: TDataSource;
    Ds_logo: TDataSource;
    QFuncionariosBAIRRO: TZRawStringField;
    QFuncionariosCARGO: TZRawStringField;
    QFuncionariosCEP: TZRawStringField;
    QFuncionariosCIDADE: TZRawStringField;
    QFuncionariosCPF: TZRawStringField;
    QFuncionariosCTPS: TZRawStringField;
    QFuncionariosENDERECO: TZRawStringField;
    QFuncionariosESTADO: TZRawStringField;
    QFuncionariosESTADO_CIVIL: TZRawStringField;
    QFuncionariosFOTOS: TZRawStringField;
    QFuncionariosID: TZIntegerField;
    QFuncionariosNIVEL: TZIntegerField;
    QFuncionariosNOME: TZRawStringField;
    QFuncionariosNUMERO: TZInt64Field;
    QFuncionariosRG: TZRawStringField;
    QFuncionariosSENHA: TZRawStringField;
    QFuncionariosSEXO: TZRawStringField;
    QFuncionariosTELEFONE: TZRawStringField;
    QRLogo: TZQuery;
    QRLogoID: TZIntegerField;
    QRLogoLOGOS_IMG: TZBlobField;
    updImgLogo: TZUpdateSQL;
    QFuncionarios: TZQuery;
    updFuncionarios: TZUpdateSQL;
    procedure Ds_logoDataChange(Sender: TObject; Field: TField);
  private

  public

  end;

var
  DmDados: TDmDados;

implementation

{$R *.lfm}

{ TDmDados }

procedure TDmDados.Ds_logoDataChange(Sender: TObject; Field: TField);
begin

end;

end.

