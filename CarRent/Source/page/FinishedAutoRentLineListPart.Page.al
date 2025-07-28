page 50230 FinishedAutoRentLineListPart
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = AutoRentLine;
    Caption = 'Addition services';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    Caption = 'Service type';
                    ToolTip = 'Specifies service type', Comment = '%';
                }
                field("Row No."; Rec."Row No.")
                {
                    ToolTip = 'Specifies the unique value of row', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the rent contract no.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of service', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Select service';
                }
                field("Count"; Rec.Quantity)
                {
                    ToolTip = 'Quantity of service';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Unit price.', Comment = '%';
                }
                field("Sum"; Rec."Sum")
                {
                    ToolTip = 'Total price of current service.', Comment = '%';
                }
            }
        }
    }

}