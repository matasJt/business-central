page 50210 AutoReservationList
{
    PageType = List;
    UsageCategory = None;
    SourceTable = AutoReservation;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Auto Reservation List';

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
                    ToolTip = 'Selection of car from auto list';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specfifies client';
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                    ToolTip = 'Specifies when reservation starts';
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                    ToolTip = 'Specifies when reservation ends';

                }

            }
        }
    }
}