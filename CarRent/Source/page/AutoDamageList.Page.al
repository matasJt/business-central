page 50221 AutoDamageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AutoDamage;
    Editable = false;
    Caption = 'Auto Damage List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Auto No."; Rec."Auto No.")
                {
                    DrillDownPageId = AutoCard;
                    ToolTip = 'Specifies the value of the Auto No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {

                    ToolTip = 'Specifies then damage was made.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of made damage to car', Comment = '%';
                }
                field(Status; Rec.Status)
                {

                    ToolTip = 'Status of damage, fixed or damaged', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Fixed)
            {
                Caption = 'Fixed';
                ToolTip = 'Set current damage record to fixed';
                Image = Change;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Fixed;
                    Rec.Modify(false);
                end;
            }
        }
        area(Promoted)
        {

            actionref(Fixed_Promoted; Fixed)
            {
            }
        }
    }
}