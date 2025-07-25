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
                    //check if all fields are not empty
                    InsertReservation();
                end;
            }
            action(Return)
            {
                Caption = 'Return Car';
                Image = Return;
                ToolTip = 'Return car to rent place';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Issued then
                        ReturnCar();
                end;
            }
            action(Damage)
            {
                Caption = 'Add Damage';
                Image = Add;
                ToolTip = 'Registere damage to this car in this reservation context';
                trigger OnAction()
                var
                    AutoRentDamageList: Page AutoRentDamageList;
                begin
                    if Rec.Status = Rec.Status::Issued then begin
                        AutoRentDamageList.SetDocumentNo(Rec."No.");
                        AutoRentDamageList.Run();
                    end;

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
        RentError: Label 'This car is already reserved for this time during filling.';
    begin
        if AutoReservation.FindSet() THEN
            REPEAT
                IF (AutoReservation."Auto No." = Rec."Auto No.") and
                   (Rec."Reservation Start Time" <= AutoReservation."Reservation End Time") and
                   (Rec."Reservation End Time" >= AutoReservation."Reservation Start Time") then
                    Error(RentError);
            UNTIL AutoReservation.NEXT = 0;

        AutoReservation.Init();
        AutoReservation."Auto No." := Rec."Auto No.";
        AutoReservation."No." := Rec."No.";
        AutoReservation."Client No." := Rec."Client No.";
        AutoReservation."Reservation Start Time" := Rec."Reservation Start Time";
        AutoReservation."Reservation End Time" := Rec."Reservation End Time";
        AutoReservation.Insert(false);
    end;

    local procedure ReturnCar()
    var
        FinishedAutoRentHeader: Record FinishedAutoRentHeader;
        FinishedAutoRentLine: Record FinishedAutoRentLine;
        AutoRentLine: Record AutoRentLine;
        AutoDamage: Record AutoDamage;
        AutoRentDamage: Record AutoRentDamage;
        ErrorMsg: Label 'It already returned';
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;

    begin
        FinishedAutoRentHeader.Reset();
        if FinishedAutoRentHeader.Get(Rec."No.") then
            Error(ErrorMsg);
        AutoRentDamage.SetRange("Document No.", Rec."No.");
        if AutoRentDamage.FindSet() then
            repeat
                AutoDamage.Init();
                AutoDamage."Auto No." := Rec."Auto No.";
                AutoDamage.Date := AutoRentDamage.Date;
                AutoDamage.Description := AutoRentDamage.Description;
                AutoDamage.Status := AutoDamageStatus::Damaged;
                AutoDamage.Insert(true);
            until AutoRentDamage.Next() = 0;
        FinishedAutoRentHeader.Init();
        FinishedAutoRentHeader."No." := Rec."No.";
        FinishedAutoRentHeader."Client No." := Rec."Client No.";
        FinishedAutoRentHeader."Auto No." := Rec."Auto No.";
        FinishedAutoRentHeader."Creation Date" := Rec."Creation Date";
        FinishedAutoRentHeader."Reservation Start Time" := Rec."Reservation Start Time";
        FinishedAutoRentHeader."Reservation End Time" := Rec."Reservation End Time";
        TempBlob.CreateOutStream(OutStream);
        Rec."Driving License".ExportStream(OutStream);
        TempBlob.CreateInStream(InStream);
        FinishedAutoRentHeader."Driving License".ImportStream(InStream,'Driving License Copy');
        FinishedAutoRentHeader."Rent Price" := Rec."Rent Price";

        AutoRentLine.Reset();
        AutoRentLine.SetRange("Document No.", Rec."No.");
        if AutoRentLine.FindSet() then
            repeat
                FinishedAutoRentLine.Init();
                FinishedAutoRentLine."Document No." := AutoRentLine."Document No.";
                FinishedAutoRentLine."Row No." := AutoRentLine."Row No.";
                FinishedAutoRentLine.Type := AutoRentLine.Type;
                FinishedAutoRentLine."No." := AutoRentLine."No.";
                FinishedAutoRentLine.Description := AutoRentLine.Description;
                FinishedAutoRentLine.Quantity := AutoRentLine.Quantity;
                FinishedAutoRentLine.Sum := AutoRentLine.Sum;
                FinishedAutoRentLine.Insert(true);
            until AutoRentLine.Next() = 0;
        FinishedAutoRentHeader.Insert(true);
        Rec.Delete(true);
    end;

    var
        Selected: Boolean;

}