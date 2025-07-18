table 50116 BonusHeader
{
    DataClassification = CustomerContent;
    DrillDownPageId = BonusList;
    LookupPageId = BonusList;

    Caption = 'Bonus';
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[50])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                    "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; Enum BonusHeaderStatus)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLine();
    end;

    var
        ErrorMessage: Label 'Status cannot be %1', Comment = '% Status field value';
        BonusLine: record BonusLine;
        sss: Page "Sales Invoice";

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(ErrorMessage, Status)
    end;

    local procedure DeleteLine()
    begin
        BonusLine.SetRange("Document No.","No.");
        BonusLine.DeleteAll();
    end;
}