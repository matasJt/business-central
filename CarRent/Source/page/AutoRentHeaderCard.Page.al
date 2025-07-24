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
            group(Main)
            {
                Caption = 'Main details';
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
                    Editable =(Rec."Client No." <> '') and (Rec.Status <> Rec.Status::Issued);
                    trigger OnValidate()
                    begin
                        OnSelectCar();
                    end;
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
            part(Picture; DrivingLicense)
            {
                SubPageLink = "No." = FIELD("No.");
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

    local procedure SetDateTime(ReserveationTime: DateTime): DateTime
    var
        DateTimeDialog: Page "Date-Time Dialog";
    begin
        DateTimeDialog.SetDateTime(ReserveationTime);
        if DateTimeDialog.RunModal() = Action::OK then
            exit(DateTimeDialog.GetDateTime());
    end;

    local procedure OnSelectCar()
    var
        Auto: Record Auto;
        AutoRentLine: Record AutoRentLine;
        Resource: Record Resource;
    begin
        Auto.Get(Rec."Auto No.");
        Resource.Get(Auto.RentService);
        AutoRentLine.Init();
        AutoRentLine.NewRowNo();
        AutoRentLine."Document No." := Rec."No.";
        AutoRentLine.Description := Resource.Name;
        AutoRentLine."No." := Resource."No.";
        AutoRentLine.Price := Resource."Unit Price";
        AutoRentLine.Quantity := 1;
        AutoRentLine.Sum := AutoRentLine.Quantity * AutoRentLine.Price;
        AutoRentLine.Deleteable := false;
        AutoRentLine.Insert(false);
    end;

    var
        Selected: Boolean;

}