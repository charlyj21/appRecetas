unit Interfaz01;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Memo.Types, FMX.Memo, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.ListBox,
  FMX.Objects, FMX.Colors, FMX.ImgList, System.Actions, FMX.ActnList,
  System.ImageList, FMX.Styles.Objects, VCL.Dialogs;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel2: TPanel;
    nuevaR: TPanel;
    verR: TPanel;
    editarR: TPanel;
    buscarR: TPanel;
    HeadBuscar: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Head: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rpttitulo: TEdit;
    rptingredientes: TMemo;
    rptpreparacion: TMemo;
    rptrecomend: TMemo;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    memo: TMemo;
    Button5: TButton;
    Label2: TLabel;
    IR: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure IRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
//AGREGAR
procedure TForm1.Button1Click(Sender: TObject);
begin
  Image1.Visible:=false;
  //ABRIENDO MEMO
  memo.Lines.LoadFromFile('memo.DAT');
  memo.Cursor:=crArrow;
  //ABRIENDO MEMO
  nuevaR.Visible:=true;
  verR.Visible:=false;
  editarR.Visible:=false;
  buscarR.Visible:=false;
  headBuscar.Visible:=false;
end;
//VER
procedure TForm1.Button2Click(Sender: TObject);
begin
  Image1.Visible:=false;
  //VERIFICACION DE CAMBIOS
  //VERIFICACION DE CAMBIOS
  //ABRIENDO MEMO
  memo.Lines.LoadFromFile('memo.DAT');
  memo.Cursor:=crArrow;
  //ABRIENDO MEMO
  nuevaR.Visible:=false;
  verR.Visible:=true;
  editarR.Visible:=true;
  head.Visible:=false;
  buscarR.Visible:=false;
  headBuscar.Visible:=false;
  //bloquear
  memo.ScrollToTop(true);
  memo.ReadOnly:=true;
end;
//EDITAR
procedure TForm1.Button3Click(Sender: TObject);
begin
  Image1.Visible:=false;
  //queee
  memo.Cursor:=criBeam;
  nuevaR.Visible:=false;
  verR.Visible:=true;
  editarR.Visible:=true;
  head.Visible:=true;
  buscarR.Visible:=false;
  headBuscar.Visible:=false;
  //para edicion
  memo.ScrollToTop(true);
  memo.ReadOnly:=false;
end;
//BUSCAR
procedure TForm1.Button4Click(Sender: TObject);
begin
  Image1.Visible:=false;
  //ABRIENDO MEMO
  memo.Lines.LoadFromFile('memo.DAT');
  memo.Cursor:=crArrow;
  //ABRIENDO MEMO
  nuevaR.Visible:=false;
  verR.Visible:=false;
  editarR.Visible:=true;
  head.Visible:=false;
  buscarR.Visible:=true;
  headBuscar.Visible:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if MessageDlg('�Esta seguro que desea guardar los cambios?',
    mtCustom, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    MessageDlg('Los cambios han sido guardados.', mtCustom,
      [mbOk], 0, mbOk);
      memo.Lines.SaveToFile('memo.DAT');
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if FileExists('memo.DAT') then
    begin
      memo.Lines.LoadFromFile('memo.DAT');
    end
  else
    begin
       FileCreate('memo.DAT');
    end;
end;

procedure TForm1.IRClick(Sender: TObject);
//ir a buscar
begin
  memo.Cursor:=crArrow;
  nuevaR.Visible:=false;
  verR.Visible:=true;
  memo.Visible:=true;
  editarR.Visible:=true;
  head.Visible:=false;
  buscarR.Visible:=false;
  var I,Indice: integer;

  Indice := 0;
  for I := 0 to memo.lines.count - 1 do
    begin
      if pos(AnsiUpperCase(edit1.Text),AnsiUpperCase(memo.lines[i])) <> 0 then begin
      Indice := i;
      Break;
    end;
  end;
  edit1.Text:='';
  memo.ScrollToTop(true);
  memo.ScrollBy(0,Indice*26.8);


end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
//AGREGAR ITEM
begin
  if ((rpttitulo.Text='')OR(rptingredientes.Text='')OR(rptpreparacion.Text='')
  OR(rptrecomend.Text='')) then
  begin
    showMessage('Rellene todos los campos.');
  end
  else
  begin
      if MessageDlg('�Esta seguro que desea agregar esta receta?',
      mtCustom, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      MessageDlg('La receta ha sido agregada.', mtCustom,
        [mbOk], 0, mbOk);
        memo.Lines.Add('');
        memo.Lines.add(rpttitulo.Text);
        memo.Lines.Add('INGREDIENTES');
        memo.Lines.Add(rptingredientes.Text);
        memo.Lines.Add('PREPARACION');
        memo.Lines.Add(rptpreparacion.Text);
        memo.Lines.Add('RECOMENDACIONES');
        memo.Lines.Add(rptrecomend.Text);
        memo.Lines.SaveToFile('memo.DAT');
        rpttitulo.text:='';
        rptingredientes.Lines.Clear;
        rptpreparacion.Lines.Clear;
        rptrecomend.Lines.Clear;
        rpttitulo.SetFocus;
    end;
  end;

end;

end.
