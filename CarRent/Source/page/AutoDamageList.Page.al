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
                field("Row No."; Rec."Row No.")
                {
                    ToolTip = 'Specifies the value of the Row No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
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
                ToolTip = 'Set damage to fixed status';
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