page 50224 AutoRentDamageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = AutoRentDamage;
    Caption = 'Auto Rent Damage List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Rent Document No.';
                    ToolTip = 'Specifies unique code for rent document', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies when damage was made to the car.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    InstructionalText='Damage details';
                    ToolTip = 'Details about damage.', Comment = '%';
                }
            }
        }
    }
    /// <summary>
    /// Set range for specific rent No.
    /// </summary>
    /// <param name="No">Code[30].</param>
    procedure SetDocumentNo(No: Code[30])
    begin
        Rec.SetRange("Document No.", No);
    end;
}