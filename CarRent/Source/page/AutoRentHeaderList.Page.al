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
     actions
    {
        area(Processing)
        {
            action(Issued)
            {
                Caption = 'Issue';
                Image = ReleaseDoc;
                ToolTip = 'Change status to issued, rent will be activated';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Issued;
                    Rec.Modify(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Issue';
                
                actionref(Issued_Promoted; Issued)
                {
                }
            }
        }
    }


}