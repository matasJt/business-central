page 50214 AutoRentHeaderCard
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = AutoRentHeader;
    Caption = 'Auto Rent Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {

                }
                field("Client No."; Rec."Client No.")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Reservation Start Time" := SetDateTime(Rec."Reservation Start Time");
                    end;
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Reservation End Time" := SetDateTime(Rec."Reservation End Time");
                    end;
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                }
                field(Status; Rec.Status)
                {

                }
            }
        }
        area(factboxes)
        {
            part(Picture; DrivingLicense)
            {
                ApplicationArea = All;
               
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
                ToolTip = 'Change status to issued, means rent is active.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Issued;
                    Rec.Modify(false);
                end;
            }
        }
    }

    local procedure SetDateTime(ReserveationTime: DateTime): DateTime
    var
        DateTimeDialog: Page "Date-Time Dialog";
    begin
        DateTimeDialog.SetDateTime(ReserveationTime);
        if DateTimeDialog.RunModal() = Action::OK then
            exit(DateTimeDialog.GetDateTime());
    end;
}