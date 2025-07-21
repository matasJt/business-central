page 50205 AutoModelList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
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

                }
                field(Code; Rec."Model Code")
                {

                }
                field(Description; Rec.Description)
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