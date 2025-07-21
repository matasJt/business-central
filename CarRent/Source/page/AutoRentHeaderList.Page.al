page 50213 AutoRentHeaderList
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = AutoRentHeader;
    Caption = 'Auto Rent List';
    Editable = false;
    CardPageId = AutoRentHeaderCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {

                }
                field("Client No."; Rec."Client No.")
                {

                }
                field("Creation Date"; Rec."Creation Date")
                {

                }
                field("Auto No."; Rec."Auto No.")
                {

                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {

                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {

                }
                field("Rent Price"; Rec."Rent Price")
                {

                }
                field(Status; Rec.Status)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }


}