table 50143 ContractVersion
{
    Caption = 'Client Version';
    DataClassification = CustomerContent;
    DrillDownPageId = ContractVersionList;
    LookupPageId = ContractVersionCard;

    fields
    {
        field(1; "Contract Version No."; Integer)
        {
            Caption = 'Contract Version No.';
            DataClassification = CustomerContent;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = CustomerContent;
        }
        field(3; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Client Type"; Enum ContractClientType)
        {
            Caption = 'Client Type';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(5; "Contract Amount"; Decimal)
        {
            Caption = 'Contract Amount';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(6; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(7; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(8; "Contract Status"; Enum ContractStatus)
        {
            Caption = 'Contract Status';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
    }

    keys
    {
        key(PK; "Contract Version No.", "Contract No.", "Client No.")
        {
            Clustered = true;
        }
       
    }
}
