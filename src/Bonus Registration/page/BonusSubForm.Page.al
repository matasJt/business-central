page 50122 BonusSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption='Line';
    SourceTable = BonusLine;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the type of the bonus assigned.'; 
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies item number for which bonus is assigned.'; 
                }

                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies bonus percent.';
                }
            }
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

    var
        myInt: Integer;
}