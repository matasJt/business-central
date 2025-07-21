table 50211 AutoRentHeader
{
    DataClassification = CustomerContent;
    LookupPageId = AutoRentHeaderCard;
    DrillDownPageId = AutoRentHeaderList;

    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Client No."; Code[50])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                CheckClient();
            end;
        }
        field(3; "Driving License"; Media)
        {
            Caption = 'Driving License';
            DataClassification = CustomerContent;

        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
        }
        field(5; "Auto No."; Code[30])
        {
            Caption = 'Auto No.';
            DataClassification = CustomerContent;
            TableRelation = Auto;
        }
        field(6; "Reservation Start Time"; DateTime)
        {
            Caption = 'Reservation starts';
            ToolTip = 'Start time of reservation';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                AutoReservation: Record AutoReservation;
            begin
                AutoReservation.IsReservationDateValid(Rec);
            end;
        }
        field(7; "Reservation End Time"; DateTime)
        {
            Caption = 'Reservation ends';
            ToolTip = 'End time of reservation';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                AutoReservation: Record AutoReservation;
            begin
                AutoReservation.IsReservationDateValid(Rec);
            end;
        }
        field(8; "Rent Price"; Decimal)
        {
            Caption = 'Rent Price';
            DataClassification = CustomerContent;
        }
        field(9; Status; Enum RentStatusType)
        {
            Editable = false;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
        LicenseMsg: Label 'Must upload driving license';
        NoSeries: Codeunit "No. Series";
        TableNoSeries: Record "No. Series";
    begin
        TableNoSeries.Get('A-ORD');
        "No." := NoSeries.GetNextNo(TableNoSeries.Code);
        ReadIsolation(IsolationLevel::ReadUncommitted);
        SetLoadFields("No.");

        while Get("No.") do
            "No." := NoSeries.GetNextNo(TableNoSeries.Code);
        "Creation Date" := System.Today;

    end;

    trigger OnModify()
    begin
        ValidateDrivingLicense();
    end;



    /// <summary>
    /// Check if client is not banned and doesn't have debt
    /// </summary>
    local procedure CheckClient()
    var
        CustomerLedger: Record "Cust. Ledger Entry";
        AmountRemained: Integer;
        Customer: Record Customer;
        BlockedMsg: Label 'This client is blocked, transactions cannot be made.';
        DebtMsg: Label 'This client has debt and cannot make new reservations.';
    begin
        Customer.Get("Client No.");
        if Customer.IsBlocked() then
            Error(BlockedMsg);
        AmountRemained := 0;
        CustomerLedger.SetRange("Customer No.", "Client No.");
        CustomerLedger.SetRange("Document Type", CustomerLedger."Document Type"::Invoice);

        if CustomerLedger.FindSet() then
            repeat
                AmountRemained += CustomerLedger."Remaining Amount";
            until CustomerLedger.Next() = 0;

        if AmountRemained <> 0 then
            Error(DebtMsg);
    end;

    local procedure ValidateDrivingLicense()
    var
        LicenseMsg: Label 'Must upload driving license';
    begin
        if not "Driving License".HasValue then
            Error(LicenseMsg);
    end;

}