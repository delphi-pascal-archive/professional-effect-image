unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ProEffectImage, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ProEffectImage: TProEffectImage;
    Bevel1: TBevel;
    EffectsList: TListBox;
    TrackBar: TTrackBar;
    Button_APPLY: TButton;
    AutoMatic: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure EffectsListClick(Sender: TObject);
    procedure Button_APPLYClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ FORM CREATION }
//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
 ProEffectImage.Picture.LoadFromFile ('1.bmp');
end;
//------------------------------------------------------------------------------



{ EFFECT LISTBOX ACTIONS }
//------------------------------------------------------------------------------
procedure TForm1.EffectsListClick(Sender: TObject);
begin

 {Start}
 ProEffectImage.Picture.LoadFromFile ('1.bmp');
 Button_APPLY.Enabled := True;
 TrackBar.Enabled     := True;
 TrackBar.Position    := 1;

end;
//------------------------------------------------------------------------------



{ APPLY BUTTON ACTIONS }
//------------------------------------------------------------------------------
procedure TForm1.Button_APPLYClick(Sender: TObject);
Var i  : Integer; {For Loop}
begin

  Screen.Cursor := crHourGlass;
  ProEffectImage.Picture.LoadFromFile ('1.bmp');
  Button_APPLY.Enabled := False;

  { E F F E C T S }
     Case EffectsList.ItemIndex of

           0: ProEffectImage.Effect_GaussianBlur   (TrackBar.Position);
           1: ProEffectImage.Effect_SplitBlur      (TrackBar.Position);
           2: ProEffectImage.Effect_AddColorNoise  (TrackBar.Position * 3);
           3: ProEffectImage.Effect_AddMonoNoise   (TrackBar.Position * 3);
           4: For i:=1 to TrackBar.Position do
              ProEffectImage.Effect_AntiAlias;
           5: ProEffectImage.Effect_Contrast       (TrackBar.Position * 3);
           6: ProEffectImage.Effect_FishEye        (TrackBar.Position div 10+1);
           7: ProEffectImage.Effect_Lightness      (TrackBar.Position * 2);
           8: ProEffectImage.Effect_Darkness       (TrackBar.Position * 2);
           9: ProEffectImage.Effect_Saturation     (255-((TrackBar.Position * 255) div 100));
          10: ProEffectImage.Effect_Mosaic         (TrackBar.Position div 2);
          11: ProEffectImage.Effect_Twist          (200-(TrackBar.Position * 2)+1);
          12: ProEffectImage.Effect_Splitlight     (TrackBar.Position div 20);
          13: ProEffectImage.Effect_Tile           (TrackBar.Position div 10);
          14: ProEffectImage.Effect_SpotLight      (TrackBar.Position ,
                                                    Rect (TrackBar.Position ,
                                                    TrackBar.Position ,
                                                    TrackBar.Position +TrackBar.Position*2,
                                                    TrackBar.Position +TrackBar.Position*2));
          15: ProEffectImage.Effect_Trace          (TrackBar.Position div 10);
          16: For i:=1 to TrackBar.Position do
              ProEffectImage.Effect_Emboss;
          17: ProEffectImage.Effect_Solorize       (255-((TrackBar.Position * 255) div 100));
          18: ProEffectImage.Effect_Posterize      (((TrackBar.Position * 255) div 100)+1);
          19: ProEffectImage.Effect_Grayscale;
          20: ProEffectImage.Effect_Invert;

     end;{Case}


  Screen.Cursor := crDefault;

end;
//------------------------------------------------------------------------------

procedure TForm1.TrackBarChange(Sender: TObject);
begin
 If Not Button_APPLY.Enabled then Button_APPLY.Enabled := True;
 if AutoMatic.Checked        then Button_APPLY.Click;
end;

end.