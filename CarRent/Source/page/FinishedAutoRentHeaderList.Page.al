page 50227 FinishedAutoRentHeaderList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = FinishedAutoRentHeader;
    Editable = false;
    Caption = 'Finished rent contracts list';
    CardPageId = FinishedAutoRentHeaderCard;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Main details';
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
        }
    }
    actions
    {
        area(Processing)
        {
            action(Report)
            {
                Caption = 'Create Report';
                Image = Report;
                ToolTip = 'Created report of finished rent for specific car';
                trigger OnAction()
                begin
                    Report.RunModal(Report::FinishedAutoRent, true, true);
                end;
            }
        }
        area(Promoted)
        {

            actionref(Report_Promoted; Report)
            {
            }

        }
    }

}