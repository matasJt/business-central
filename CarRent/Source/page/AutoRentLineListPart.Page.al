page 50218 AutoRentLineListPart
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = AutoRentLine;
    Caption = 'Addition services';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    Caption='Service type';
                    ToolTip = 'Specifies service type', Comment = '%';
                    Editable = Rec.Deleteable = true;

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
                    InstructionalText='Select service';
                    ToolTip='Select service';
                    ShowMandatory = true;
                    NotBlank = true;
                    Editable = Rec.Deleteable = true;

                }
                field("Count"; Rec.Quantity)
                {

                    ToolTip='Quantity of service';
                    NotBlank = true;
                    Editable = (Rec."No." <> '') and Rec.Deleteable = true;
                

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
    trigger OnModifyRecord(): Boolean
    begin
        Rec.UpdateTotalRentPrice();
    end;

    
}