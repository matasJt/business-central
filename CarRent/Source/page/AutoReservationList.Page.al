page 50210 AutoReservationList
{
    PageType = List;
    UsageCategory = None;
    SourceTable = AutoReservation;
    Editable = false;

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