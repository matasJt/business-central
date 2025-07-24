page 50228 FinishedAutoRentHeaderCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = FinishedAutoRentHeader;
    Editable=false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.', Comment = '%';
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ToolTip = 'Specifies the value of the Auto No. field.', Comment = '%';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.', Comment = '%';
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                    ToolTip = 'Specifies the value of the Reservation starts field.', Comment = '%';
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                    ToolTip = 'Specifies the value of the Reservation ends field.', Comment = '%';
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    ToolTip = 'Specifies the value of the Rent Price field.', Comment = '%';
                }
            }
        }
        area(factboxes)
        {
            part(Picture; DrivingLicense)
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }

    }
}