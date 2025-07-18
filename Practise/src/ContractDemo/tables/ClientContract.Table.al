table 50135 ClientContract
{
    Caption = 'Client Contract';
    DrillDownPageId = ClientContractList;
    LookupPageId = ClientContractCard;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(2; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Client Type" = const(ContractClientType::Customer)) Customer."No."
            else
            Vendor."No.";
            NotBlank = true;
        }
        field(3; "Client Type"; Enum ContractClientType)
        {
            Caption = 'Client Type';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Contract Amount"; Decimal)
        {
            Caption = 'Contract Amount';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(5; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
            DataClassification = CustomerContent;
            NotBlank = true;
            trigger OnValidate()
            begin
                ValidateDates();
            end;
        }
        field(6; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
            DataClassification = CustomerContent;
            NotBlank = true;
            trigger OnValidate()
            begin
                ValidateDates();
            end;
        }
        field(7; "Contract Status"; Enum ContractStatus)
        {
            Caption = 'Contract Status';
            DataClassification = CustomerContent;
            NotBlank = true;
            Editable = false;
        }
    }
    keys
    {
        key("Contract No."; "Contract No.", "Client No.")
        {
            Clustered = true;
        }

    }
    trigger OnInsert()
    var
        ContractSetup: Record ContractSetup;
        NoSeries: Codeunit "No. Series";
        ErrInfo: ErrorInfo;
    begin
        if ContractSetup.Get() then begin
            ContractSetup.TestField("Contract Nos");
            "Contract No." := NoSeries.GetNextNo(ContractSetup."Contract Nos", Today, true);
            "Contract Status" := ContractStatus::Open;
        end;
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    local procedure ValidateDates()
    begin
        if "Contract Start Date" > "Contract End Date" then
            Error('Contract Start Date cannot be later than Contract End Date.');
        if "Contract End Date" < "Contract Start Date" then
            Error('Contract End Date cannot be earlier than Contract Start Date.');
    end;

    local procedure TestStatus()
     var
        MustOpenErr: Label 'Cannot modify a released contract it need to be in Open status', Comment = 'Negalima keisti išleistos sutarties, ji turi būti atidaryta';
    begin
          if "Contract Status" = ContractStatus::Released then
            Error(MustOpenErr);
    end;

    /// <summary>
    /// Change status from released to open or vice versa.
    /// </summary>
    procedure ChangeStatus()
    var
        IsReleased: Boolean;
    begin
        IsReleased := "Contract Status" = ContractStatus::Released;
        "Contract Status" :=IsReleased ? ContractStatus::Open : ContractStatus::Released;
        Modify(false);
    end;
}