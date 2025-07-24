page 50230 FinishedAutoRentLineListPart
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = AutoRentLine;
    Caption = 'Addition services';
    Editable=false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Row No."; Rec."Row No.")
                {
                    ToolTip = 'Specifies the value of the Row No. field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Docutment. No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {

                }
                field("Count"; Rec.Quantity)
                {

                    ToolTip = 'Specifies the value of the Count field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
                field("Sum"; Rec."Sum")
                {
                    ToolTip = 'Specifies the value of the Sum field.', Comment = '%';
                }
            }
        }
    }

}