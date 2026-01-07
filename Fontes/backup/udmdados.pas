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
    Ds_logo: TDataSource;
    QRLogo: TZQuery;
    QRLogoID: TZIntegerField;
    QRLogoLOGOS_IMGS: TZBlobField;
    QRLogoNOME_EMPRESA: TZRawStringField;
    updImgLogo: TZUpdateSQL;
  private

  public

  end;

var
  DmDados: TDmDados;

implementation

{$R *.lfm}

end.

