unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TMiniGame = class(TForm)
    Screen: TStringGrid;
    procedure ScreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    currentPlayer,winner:string;
    procedure CheckWinner;
    procedure GameWon;
  public
    function GetWinner:string;
    { Public declarations }
  end;

var
  MiniGame: TMiniGame;

implementation

{$R *.dfm}

uses OXOBest;

procedure TMiniGame.FormCreate(Sender: TObject);
begin
  currentPlayer := 'X';
  winner := 'y';
end;

procedure TMiniGame.GameWon;
begin
  winner := currentPlayer;
  MainGame.SetMiniWinner(winner);
  MainGame.CentreLeft.Caption := winner;

end;

function TMiniGame.GetWinner: string;
begin
  result := winner;
end;

procedure TMiniGame.ScreenClick(Sender: TObject);
begin
  if (Screen.Cells[Screen.Col , Screen.Row] <> 'X') AND (Screen.Cells[Screen.Col , Screen.Row] <> 'O') then
  begin
    Screen.Cells[Screen.Col , Screen.Row] := currentPlayer;

    CheckWinner;

    if currentPlayer = 'X' then
    currentPLayer := 'O'
  else if currentPlayer = 'O' then
    currentPlayer := 'X';
  end;
end;

procedure TMiniGame.CheckWinner;
begin
  if (Screen.Cells[Screen.Col , 0] = Screen.Cells[Screen.Col , 1]) and (Screen.Cells[Screen.Col , 1] = Screen.Cells[Screen.Col , 2])then
  begin
    GameWon;
  end
  else if (Screen.Cells[0 , Screen.Row] = Screen.Cells[1 , Screen.Row]) and (Screen.Cells[1 , Screen.Row] = Screen.Cells[2 , Screen.Row])then
  begin
    GameWon;
  end
  else if (Screen.Cells[1 , 1] <> '') and (Screen.Cells[0 , 0] = Screen.Cells[1 , 1]) and (Screen.Cells[2 , 2] = Screen.Cells[1 , 1]) then
  begin
    GameWon;
  end
  else if (Screen.Cells[1 , 1] <> '') and (Screen.Cells[0 , 2] = Screen.Cells[1 , 1]) and (Screen.Cells[0 , 2] = Screen.Cells[2 , 0]) then
  begin
    GameWon;
  end;
end;

end.
