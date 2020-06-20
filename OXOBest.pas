unit OXOBest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainGame = class(TForm)
    TopLeft: TButton;
    CentreLeft: TButton;
    BottomLeft: TButton;
    TopRight: TButton;
    CentreRight: TButton;
    CentreCentre: TButton;
    BottomCentre: TButton;
    BottomRight: TButton;
    TopCentre: TButton;
    procedure TopLeftClick(Sender: TObject);
    procedure TopCentreClick(Sender: TObject);
    procedure TopRightClick(Sender: TObject);
    procedure CentreLeftClick(Sender: TObject);
    procedure CentreCentreClick(Sender: TObject);
    procedure CentreRightClick(Sender: TObject);
    procedure BottomLeftClick(Sender: TObject);
    procedure BottomCentreClick(Sender: TObject);
    procedure BottomRightClick(Sender: TObject);
  private
    { Private declarations }
    winner,miniWinner:string;
    count:integer;
    procedure PlayGame;
    procedure GameWon;
  public
    gameWinner:string;
    procedure SetCount;
    procedure SetMiniWinner(winno:string);
    procedure CheckWin;
    { Public declarations }
  end;

var
  MainGame: TMainGame;

implementation

{$R *.dfm}

uses OXONormal;

//=======================================================================================================

procedure TMainGame.SetCount;
begin
  count:=count+1;
end;

procedure TMainGame.SetMiniWinner(winno:string);
begin
  miniWinner:=winno;
end;

//click conditions for each button

procedure TMainGame.BottomCentreClick(Sender: TObject);
begin
  BottomCentre.Enabled := false;
  Minigame.SetButton('BC');
  MiniGame.Show;
end;

procedure TMainGame.BottomLeftClick(Sender: TObject);
begin
  BottomLeft.Enabled := false;
  Minigame.SetButton('BL');
  MiniGame.Show;
end;

procedure TMainGame.BottomRightClick(Sender: TObject);
begin
  BottomRight.Enabled := false;
  Minigame.SetButton('BR');
  MiniGame.Show;
end;

procedure TMainGame.CentreCentreClick(Sender: TObject);
begin
  CentreCentre.Enabled := false;
  Minigame.SetButton('CC');
  MiniGame.Show;
end;

procedure TMainGame.CentreLeftClick(Sender: TObject);
begin
  CentreLeft.Enabled := false;
  Minigame.SetButton('CL');
  MiniGame.Show;
end;

procedure TMainGame.CentreRightClick(Sender: TObject);
begin
  CentreRight.Enabled := false;
  Minigame.SetButton('CR');
  MiniGame.Show;
end;

procedure TMainGame.TopCentreClick(Sender: TObject);
begin
  TopCentre.Enabled := false;
  Minigame.SetButton('TC');
  MiniGame.Show;
end;

procedure TMainGame.TopLeftClick(Sender: TObject);
begin
  TopLeft.Enabled := false;
  Minigame.SetButton('TL');
  MiniGame.Show;
end;

procedure TMainGame.TopRightClick(Sender: TObject);
begin
  TopRight.Enabled := false;
  Minigame.SetButton('TR');
  MiniGame.Show;
end;

//=====================================================================================================

procedure TMainGame.CheckWin; //checks all rows, columns and diagonals for winner
begin
  gameWinner := '';
  if (TopLeft.Caption = TopCentre.Caption) and (TopLeft.Caption = TopRight.Caption) and (TopCentre.Caption <> '')then
    begin
    gameWinner:=TopLeft.Caption;
    GameWon;
    end
  else if (CentreLeft.Caption = CentreCentre.Caption) and (CentreLeft.Caption = CentreRight.Caption) and (CentreCentre.Caption <> '')then
    begin
    gameWinner:=CentreLeft.Caption;
    GameWon;
    end
  else if (BottomLeft.Caption = BottomCentre.Caption) and (BottomLeft.Caption = BottomRight.Caption) and (BottomCentre.Caption <> '')then
    begin
    gameWinner:=BottomLeft.Caption;
    GameWon;
    end
  else if (TopLeft.Caption = CentreLeft.Caption) and (TopLeft.Caption = BottomLeft.Caption) and (CentreLeft.Caption <> '')then
    begin
    gameWinner:=TopLeft.Caption;
    GameWon;
    end
  else if (TopCentre.Caption = CentreCentre.Caption) and (TopCentre.Caption = BottomCentre.Caption) and (CentreCentre.Caption <> '')then
    begin
    gameWinner:=TopCentre.Caption;
    GameWon;
    end
  else if (TopRight.Caption = CentreRight.Caption) and (TopRight.Caption = BottomRight.Caption) and (CentreRight.Caption <> '')then
    begin
    gameWinner:=TopRight.Caption;
    GameWon;
    end
  else if (TopLeft.Caption = CentreCentre.Caption) and (TopLeft.Caption = BottomRight.Caption) and (CentreCentre.Caption <> '') then
    begin
    gameWinner:=TopLeft.Caption;
    GameWon;
    end
  else if (TopRight.Caption = CentreCentre.Caption) and (TopRight.Caption = BottomLeft.Caption) and (CentreCentre.Caption <> '') then
    begin
    gameWinner:=TopRight.Caption;
    GameWon;
    end
    else if count = 9 then
    begin
      gameWinner:='/';
      GameWon;
    end;
end;

//=======================================================================================================

procedure TMainGame.GameWon; //displays winner of game
begin
  TopLeft.Caption:='';
  TopCentre.Caption:=gameWinner;
  TopRight.Caption:='';
  CentreLeft.Caption:='N';
  CentreCentre.Caption:='O';
  CentreRight.Caption:='W';
  BottomLeft.Caption:='';
  BottomCentre.Caption:='!';
  BottomRight.Caption:='';
end;

//=======================================================================================================

procedure TMainGame.PlayGame;
begin
  MiniGame.Show;
  MiniGame.Reset;
end;
end.
