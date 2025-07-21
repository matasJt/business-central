page 50203 AutoBrandist
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AutoBrand;
    Caption = 'Auto mark List';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {

                }
                field(Description;Rec.Description)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}