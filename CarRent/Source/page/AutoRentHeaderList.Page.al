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
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies if rent contract is issued or still open';
                }
            }
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
                ToolTip = 'Change status to issued, rent contract will be activated';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Issued;
                    Rec.Modify(false);
                end;
            }
        }
        area(Promoted)
        {

            actionref(Issued_Promoted; Issued)
            {
            }
        }
    }


}