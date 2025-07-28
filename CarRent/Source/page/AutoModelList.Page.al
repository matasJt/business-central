page 50205 AutoModelList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = AutoModel;
    Caption = 'Auto Model List';

    layout
    {
        area(Content)
        {
            repeater(Genral)
            {
                field("Brand Code"; Rec."Brand Code")
                {
                    ToolTip = 'Unique code for car brand';
                }
                field(Code; Rec."Model Code")
                {
                    Caption = 'Model Code';
                    ToolTip = 'Unique code for car brand model';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Addition informatio about car model';
                }
            }
        }
    }
}