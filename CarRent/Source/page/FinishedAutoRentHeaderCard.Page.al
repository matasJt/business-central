page 50228 FinishedAutoRentHeaderCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = FinishedAutoRentHeader;
    Editable = false;
    Caption = 'Finished rent contract';


    layout
    {
        area(Content)
        {
            group(Main)
            {
                field("No."; Rec."No.")
                {
                   
                }
               field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specfifies client';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Creation date of a contract';
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ToolTip = 'Selection of car from auto list';
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                    ToolTip = 'Specifies when reservation starts';
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                    ToolTip = 'Specifies when reservation ends';
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    ToolTip = 'Initial rent price without services';
                }
               
            }
            group(Addition)
            {
                part(Services; AutoRentLineListPart)
                {
                    SubPageLink = "Document No." = FIELD("No.");
                    ApplicationArea = All;
                    Visible = Rec."No." <> '';
                }
            }
        }

        area(factboxes)
        {
            part(Picture; DrivingLicenseCopy)
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }

    }
}