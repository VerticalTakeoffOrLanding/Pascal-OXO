unit OXONormal;

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
    currentPlayer,winner,button:string;
    count:integer;
    procedure CheckWinner;
    procedure GameWon;
  public
    function SetButton(but:string):string;
    function GetWinner:string;
    procedure Reset;
    { Public declarations }
  end;

var
  MiniGame: TMiniGame;

implementation

{$R *.dfm}

uses OXOBest;

//=======================================================================================================

procedure TMiniGame.FormCreate(Sender: TObject);
begin
  currentPlayer := 'X';
  winner := 'Y';
  count:=0;
end;

//=======================================================================================================

procedure TMiniGame.GameWon;
begin
  //Hide;

  //sets the caption of the maingame button to be the winner of this game
  winner := currentPlayer;
  MainGame.SetMiniWinner(winner);
  if button = 'TL' then
    MainGame.TopLeft.Caption := winner;
  if button = 'TC' then
    MainGame.TopCentre.Caption := winner;
  if button = 'TR' then
    MainGame.TopRight.Caption := winner;
  if button = 'CL' then
    MainGame.CentreLeft.Caption := winner;
  if button = 'CC' then
    MainGame.CentreCentre.Caption := winner;
  if button = 'CR' then
    MainGame.CentreRight.Caption := winner;
  if button = 'BL' then
    MainGame.BottomLeft.Caption := winner;
  if button = 'BC' then
    MainGame.BottomCentre.Caption := winner;
  if button = 'BR' then
    MainGame.BottomRight.Caption := winner;

  MainGame.gameWinner:=currentPlayer;
  MainGame.CheckWin; //checks if this was a winning game
end;

//=======================================================================================================

function TMiniGame.GetWinner: string;
begin
  result := winner; //returns the winner of this game to the maingame
end;

//=======================================================================================================

procedure TMiniGame.Reset;
var
  i: Integer;
  u: Integer;
begin
  if currentPlayer = '/' then  //defaults to X if noone lost previous game
    currentPlayer:='X';
  winner := 'Y'; //sets winner to non X or O value
  count:=0;
  Screen.Enabled:=true;

  for i := 0 to 2 do //Empties the cells on the stringgrid
  begin
    for u := 0 to 2 do
    begin
      Screen.Cells[i,u]:= '';
    end;
  end;
end;

//=======================================================================================================

procedure TMiniGame.ScreenClick(Sender: TObject);
begin
  if (Screen.Cells[Screen.Col , Screen.Row] <> 'X') AND (Screen.Cells[Screen.Col , Screen.Row] <> 'O') then
  begin
    //^^ checks if the space has been filled yet
    count:=count+1;

    Screen.Cells[Screen.Col , Screen.Row] := currentPlayer; //sets space as person who clicked

    CheckWinner;

    if currentPlayer = 'X' then //swaps current player
    currentPlayer := 'O'
  else if currentPlayer = 'O' then
    currentPlayer := 'X';
  end;
end;

//=======================================================================================================

function TMiniGame.SetButton(but: string): string;
begin
  MainGame.SetCount;
  button := but;
  Reset;
end;

//=======================================================================================================

procedure TMiniGame.CheckWinner;
begin
  if (Screen.Cells[Screen.Col , 0] = Screen.Cells[Screen.Col , 1]) and (Screen.Cells[Screen.Col , 1] = Screen.Cells[Screen.Col , 2])then
  begin
    GameWon; //Checks local column
  end
  else if (Screen.Cells[0 , Screen.Row] = Screen.Cells[1 , Screen.Row]) and (Screen.Cells[1 , Screen.Row] = Screen.Cells[2 , Screen.Row])then
  begin
    GameWon; //Checks local row
  end
  else if (Screen.Cells[1 , 1] <> '') and (Screen.Cells[0 , 0] = Screen.Cells[1 , 1]) and (Screen.Cells[2 , 2] = Screen.Cells[1 , 1]) then
  begin
    GameWon; //Checks first diagonal
  end
  else if (Screen.Cells[1 , 1] <> '') and (Screen.Cells[0 , 2] = Screen.Cells[1 , 1]) and (Screen.Cells[0 , 2] = Screen.Cells[2 , 0]) then
  begin
    GameWon; //Checks second diagonal
  end
  else if count = 9 then //Checks for a draw
  begin
    currentPlayer:='/';
    GameWon;
  end;

//=======================================================================================================

end;

end.
