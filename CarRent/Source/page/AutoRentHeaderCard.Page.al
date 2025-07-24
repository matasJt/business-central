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
                    Editable = (Rec."Client No." <> '') and (Rec.Status <> Rec.Status::Issued);
                    trigger OnValidate()
                    begin
                        OnSelectCar();
                    end;
                }
                field("Reservation Start Time"; Rec."Reservation Start Time")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                    trigger OnValidate()
                    begin
                        CheckReservationDate();
                    end;
                }
                field("Reservation End Time"; Rec."Reservation End Time")
                {
                    Editable = Rec.Status <> Rec.Status::Issued;
                    trigger OnValidate()
                    begin
                        CheckReservationDate();
                    end;
                }
                field("Rent Price"; Rec."Rent Price")
                {

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
                    if Rec.Status = Rec.Status::Issued then
                        exit;
                    Rec.Status := Rec.Status::Issued;
                    Rec.Modify(false);
                    //check if whole fields are not empty
                    InsertReservation();
                end;
            }
            action(Return)
            {
                Caption = 'Return automibile';
                Image = Return;
                ToolTip = 'Return automobile to rent place';
                trigger OnAction()
                begin

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

    local procedure OnSelectCar()
    var
        Auto: Record Auto;
        AutoRentLine: Record AutoRentLine;
        Resource: Record Resource;
    begin
        Auto.Get(Rec."Auto No.");
        Resource.Get(Auto.RentService);
        Rec."Rent Price" := Resource."Unit Price";
        Rec.Modify(false);
        AutoRentLine.Init();
        AutoRentLine.NewRowNo();
        AutoRentLine.Type := RentLineType::Resource;
        AutoRentLine."Document No." := Rec."No.";
        AutoRentLine.Description := Resource.Name;
        AutoRentLine."No." := Resource."No.";
        AutoRentLine.Price := Resource."Unit Price";
        AutoRentLine.Quantity := 1;
        AutoRentLine.Sum := AutoRentLine.Quantity * AutoRentLine.Price;
        AutoRentLine.Deleteable := false;
        AutoRentLine.Insert(false);
    end;

    /// <summary>
    /// Checks if reservation could be done on selected date if it's free
    /// </summary>
    local procedure CheckReservationDate()
    var
        AutoReservation: Record AutoReservation;
        RentError: Label 'Cannot rent this car, reservation for this car at selected time';
        DateError2: Label 'Start date must be earlier than end date and end date not before start date';
    begin
        // if (Rec."Reservation Start Time" < Today() ) or (Rec."Reservation End Time" < Today() ) then
        //     Error(DateError);
        if (Rec."Reservation Start Time" > Rec."Reservation End Time") or (Rec."Reservation End Time" < Rec."Reservation Start Time") then
            Error(DateError2);

        AutoReservation.Reset();
        // AutoReservation.FindSet();
        AutoReservation.SetRange("Auto No.", Rec."Auto No.");
        AutoReservation.SetFilter("Reservation Start Time", '<=%1', Rec."Reservation End Time");
        AutoReservation.SetFilter("Reservation End Time", '>=%1', Rec."Reservation Start Time");
        if AutoReservation.IsEmpty() then
            exit;
        Error(RentError);
    end;

    local procedure InsertReservation()
    var
        AutoReservation: Record AutoReservation;
    begin
        AutoReservation.Init();
        AutoReservation."Auto No." := Rec."Auto No.";
        AutoReservation."No." := Rec."No.";
        AutoReservation."Client No." := Rec."Client No.";
        AutoReservation."Reservation Start Time" := Rec."Reservation Start Time";
        AutoReservation."Reservation End Time" := Rec."Reservation End Time";
        AutoReservation.Insert(false);
    end;


    var
        Selected: Boolean;

}