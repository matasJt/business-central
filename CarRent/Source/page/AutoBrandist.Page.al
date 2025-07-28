page 50203 AutoBrandist
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = AutoBrand;
    Caption = 'Auto Brand List';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Unique code for car brand';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Addition information about brand';
                }
            }
        }
    }
}