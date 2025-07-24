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
                CheckClient(); // Your existing validation logic
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
            Editable = false;
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
            NotBlank = true;
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
    begin
        GenerateNewNo();
    end;



    /// <summary>
    /// Check if client is not banned and doesn't have debt, validate other must select fields
    /// </summary>
    procedure CheckClient()
    var
        CustomerLedger: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        Auto: Record Auto;
        BlockedMsg: Label 'This client is blocked, transactions cannot be made.';
        DebtMsg: Label 'This client has debt and cannot make new reservations.';
        AutoMsg: Label 'Auto must be selected';
    begin
        if Customer.IsBlocked() then
            Error(BlockedMsg);
        Customer.Get("Client No.");
        CustomerLedger.SetRange("Customer No.", "Client No.");
        CustomerLedger.SetRange("Document Type", CustomerLedger."Document Type"::Invoice);

        if CustomerLedger.FindSet() then
            repeat
                if CustomerLedger."Closed by Amount" = 0 then
                    Error(DebtMsg);
            until CustomerLedger.Next() = 0;
    end;

    local procedure ValidateDrivingLicense()
    var
        LicenseMsg: Label 'Must upload driving license';
    begin
        if not "Driving License".HasValue then
            Error(LicenseMsg);
    end;

    local procedure GenerateNewNo()
    var
        NoSeries: Codeunit "No. Series";
        AutoSetup: Record "AutoSetup";
    begin
        AutoSetup.Get();
        "No." := NoSeries.GetNextNo(AutoSetup."Rent Card No. Series");
        ReadIsolation(IsolationLevel::ReadUncommitted);
        SetLoadFields("No.");

        while Get("No.") do
            "No." := NoSeries.GetNextNo(AutoSetup."Rent Card No. Series");
        "Creation Date" := System.Today;
    end;

}