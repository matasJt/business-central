page 50225 AutoAvailableReservations
{
   
    PageType = List;
    UsageCategory = None;
    SourceTable = AutoReservation;
    Editable = false;
    Caption = 'Active Reservations From Today';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                   
                
                }
                field("Auto No."; Rec."Auto No.")
                {
                   
                   
                }
                field("Client No."; Rec."Client No.")
                {
                   
                   
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                   
                   
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                   
                  
                }

            }
        }
    }
}