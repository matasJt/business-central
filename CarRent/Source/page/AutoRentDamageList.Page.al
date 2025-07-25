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
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
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